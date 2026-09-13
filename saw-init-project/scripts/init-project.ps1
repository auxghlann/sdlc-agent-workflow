<#
.SYNOPSIS
    Scaffolds the Modular AI Engineering Context System (saw-init-project) in a target project directory.

.DESCRIPTION
    Creates the hierarchical .spec/ and .agents/ directories and populates them
    with modular specification component templates (requirements, architecture,
    diagrams, api, data-model, legal-documents, development, decisions) and AGENTS.md.
    Existing files are preserved by default to prevent loss of project context.

.PARAMETER TargetDirectory
    The root path of the project to initialize. Defaults to the current working directory.

.PARAMETER Force
    Overwrites existing specification and constitution files if set.

.EXAMPLE
    powershell -File ./scripts/init-project.ps1
    Scaffolds the modular context system in the current working directory.

.EXAMPLE
    powershell -File ./scripts/init-project.ps1 -TargetDirectory "C:\path\to\my-project"
    Scaffolds the modular context system in a specific project directory.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Position = 0)]
    [string]$TargetDirectory = (Get-Location).Path,

    [Parameter()]
    [switch]$Force,

    [Parameter()]
    [switch]$CopyReferenceSkills
)

$ErrorActionPreference = "Stop"

$TemplatesDir = Join-Path -Path $PSScriptRoot -ChildPath "..\templates"
if (-not (Test-Path -Path $TemplatesDir)) {
    throw "Templates directory not found at: $TemplatesDir"
}
$ResolvedTemplatesDir = (Resolve-Path -Path $TemplatesDir).Path
if (-not $ResolvedTemplatesDir.EndsWith([System.IO.Path]::DirectorySeparatorChar.ToString())) {
    $ResolvedTemplatesDir += [System.IO.Path]::DirectorySeparatorChar
}

if (-not (Test-Path -Path $TargetDirectory)) {
    if ($PSCmdlet.ShouldProcess($TargetDirectory, "Create Target Directory")) {
        $null = New-Item -Path $TargetDirectory -ItemType Directory -Force
    }
}

$ResolvedTarget = (Resolve-Path -Path $TargetDirectory).Path
Write-Host "Initializing Modular AI Engineering Context System in: $ResolvedTarget"

# Ensure Base Directories Exist
$AgentsDir = Join-Path -Path $ResolvedTarget -ChildPath ".agents"
$SpecDir = Join-Path -Path $ResolvedTarget -ChildPath ".spec"
$PlansDir = Join-Path -Path $SpecDir -ChildPath "plans"

$BaseDirs = @($AgentsDir, $SpecDir, $PlansDir)
foreach ($Dir in $BaseDirs) {
    if (-not (Test-Path -Path $Dir)) {
        if ($PSCmdlet.ShouldProcess($Dir, "Create Directory")) {
            $null = New-Item -Path $Dir -ItemType Directory -Force
            Write-Host "[CREATED] Directory: $Dir"
        }
    } else {
        Write-Host "[EXISTS]  Directory: $Dir"
    }
}

$CreatedCount = 0
$SkippedCount = 0

# Recursively crawl all template files
$TemplateFiles = Get-ChildItem -Path $ResolvedTemplatesDir -Recurse -File

foreach ($File in $TemplateFiles) {
    $RelativeFromTemplates = $File.FullName.Substring($ResolvedTemplatesDir.Length)
    
    if ($RelativeFromTemplates -eq "AGENTS.md") {
        $DestRelPath = Join-Path -Path ".agents" -ChildPath "AGENTS.md"
    } else {
        $DestRelPath = Join-Path -Path ".spec" -ChildPath $RelativeFromTemplates
    }

    $DestFullPath = Join-Path -Path $ResolvedTarget -ChildPath $DestRelPath
    $DestParentDir = Split-Path -Path $DestFullPath -Parent

    if (-not (Test-Path -Path $DestParentDir)) {
        if ($PSCmdlet.ShouldProcess($DestParentDir, "Create Directory")) {
            $null = New-Item -Path $DestParentDir -ItemType Directory -Force
            Write-Host "[CREATED] Directory: $DestParentDir"
        }
    }

    if ((Test-Path -Path $DestFullPath) -and (-not $Force)) {
        Write-Host "[SKIPPED] $DestRelPath (already exists, use -Force to overwrite)"
        $SkippedCount++
    } else {
        if ($PSCmdlet.ShouldProcess($DestFullPath, "Copy Template")) {
            Copy-Item -Path $File.FullName -Destination $DestFullPath -Force
            Write-Host "[COPIED]  $DestRelPath"
            $CreatedCount++
        }
    }
}

if ($CopyReferenceSkills) {
    $SkillsSourceDir = Join-Path -Path $PSScriptRoot -ChildPath "..\skills"
    if (Test-Path -Path $SkillsSourceDir) {
        $DestSkillsDir = Join-Path -Path $ResolvedTarget -ChildPath ".agents\skills"
        if (-not (Test-Path -Path $DestSkillsDir)) {
            $null = New-Item -Path $DestSkillsDir -ItemType Directory -Force
        }
        Copy-Item -Path "$SkillsSourceDir\*" -Destination $DestSkillsDir -Recurse -Force
        Write-Host "[COPIED] Reference procedural skills to .agents\skills\"
    }
}

Write-Host ""
Write-Host "Initialization complete."
Write-Host "  Files copied: $CreatedCount"
Write-Host "  Files skipped: $SkippedCount"
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Start navigation at .spec/README.md to review component indices."
Write-Host "2. Populate component sub-specs with real project facts or mark with > [!TODO]."
Write-Host "3. Verify .agents/AGENTS.md accurately points to global persistent skills."
