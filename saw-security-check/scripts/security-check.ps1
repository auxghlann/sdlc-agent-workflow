<#
.SYNOPSIS
    Performs static security and secret leak scanning on repository changes (saw-security-check).

.DESCRIPTION
    Scans uncommitted git diffs, staged files, and configuration files for exposed API keys,
    hardcoded credentials, private key headers, and invokes native package manager audit tools.

.PARAMETER TargetDirectory
    Directory to scan. Defaults to the current working directory.
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$TargetDirectory = (Get-Location).Path
)

$ErrorActionPreference = "Stop"
Set-Location -Path $TargetDirectory

Write-Host "Running SDLC Security Check (saw-security-check) in: $TargetDirectory"

$IssuesFound = 0

# 1. Check for uncommitted .env files
Write-Host "[1/3] Checking for uncommitted private environment files..."
$EnvFiles = Get-ChildItem -Path $TargetDirectory -Filter ".env*" -File -Recurse -ErrorAction SilentlyContinue | 
    Where-Object { $_.Name -notmatch "\.example$" -and $_.FullName -notmatch "node_modules|\.git" }

foreach ($EnvFile in $EnvFiles) {
    # Check if git is tracking this file
    $Tracked = git ls-files --error-unmatch $EnvFile.FullName 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[CAUTION] Tracked private environment file detected: $($EnvFile.FullName)"
        $IssuesFound++
    }
}

# 2. Secret Pattern Scanning via Git Diff
Write-Host "[2/3] Scanning git diff for credential patterns..."
$SecretPatterns = @(
    "AIza[0-9A-Za-z-_]{35}",                      # Google / Gemini API Key
    "AKIA[0-9A-Z]{16}",                           # AWS Access Key ID
    "ghp_[0-9A-Za-z]{36}",                        # GitHub Personal Access Token
    "sk-[A-Za-z0-9-_]{32,}",                      # OpenAI / Anthropic Secret Key
    "-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY", # Private Keys
    "(postgres|mysql|mongodb\+srv)://[^:]+:[^@]+@" # DB Connection Strings with Passwords
)

$DiffOutput = @()
$prevEAP = $ErrorActionPreference
$ErrorActionPreference = "SilentlyContinue"
$null = git rev-parse --quiet --verify HEAD 2>&1
$HasHead = ($LASTEXITCODE -eq 0)

if ($HasHead) {
    $DiffOutput = git diff HEAD 2>&1
} else {
    $DiffOutput = git diff --cached 2>&1
    if (-not $DiffOutput) {
        $DiffOutput = git diff 2>&1
    }
}
$ErrorActionPreference = $prevEAP

if ($DiffOutput) {
    foreach ($Pattern in $SecretPatterns) {
        $Matches = $DiffOutput | Select-String -Pattern "^\+.*$Pattern"
        if ($Matches) {
            foreach ($Match in $Matches) {
                Write-Host "[CAUTION] Possible leaked secret detected (Pattern: $Pattern):"
                Write-Host "  $($Match.Line.Trim())"
                $IssuesFound++
            }
        }
    }
}

# 3. Dependency Vulnerability Audit
Write-Host "[3/3] Checking dependency manifests..."
if (Test-Path "package.json") {
    Write-Host "Node.js project detected. Running npm audit..."
    try {
        npm audit --audit-level=high
        if ($LASTEXITCODE -ne 0) {
            Write-Host "[WARNING] npm audit reported high/critical vulnerabilities."
            $IssuesFound++
        }
    } catch {
        Write-Host "[INFO] npm audit command skipped or failed to execute."
    }
}

Write-Host ""
if ($IssuesFound -gt 0) {
    Write-Host "Security Check FAILED: $IssuesFound critical security warning(s) found."
    exit 1
} else {
    Write-Host "Security Check PASSED: No credentials or high-severity vulnerabilities found."
    exit 0
}
