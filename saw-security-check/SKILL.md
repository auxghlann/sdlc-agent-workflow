---
name: saw-security-check
description: Runs a comprehensive security audit on active or staged changes, checking for hardcoded secrets, injection flaws, missing auth/RLS policies, insecure configurations, and vulnerable dependencies. Use before commits, pull requests, or deployments.
---

# SDLC Security Check Skill (`saw-security-check`)

## Goal
To audit active, staged, or targeted codebase changes for critical security vulnerabilities, secret leaks, authorization gaps, and dependency risks before code is committed or deployed.

---

## Prerequisite Skills Verification
Before initiating security audit workflows:
1. **Check Local Workspace**: Inspect `.agents/skills/ponytail/` and `.agents/skills/caveman/`.
2. **Check Global Customizations**: Inspect user-level skills in `~/.agents/skills/` or `<global_customizations_root>/skills/`.
3. **Download Condition**: If absent, inform the user or retrieve them via Skills CLI (`npx skills add <source>`). Do NOT perform duplicate downloads if already present.

---

## Ponytail Security Philosophy
- **Load Skill**: The agent MUST load `.agents/skills/ponytail/SKILL.md` (or `~/.agents/skills/ponytail/SKILL.md`) when planning security checks. Refer to `ponytail-help` (`.agents/skills/ponytail-help/SKILL.md` or `/ponytail-help`) for command syntax and mode options.
- **Root Cause over Symptom**: Flag the shared configuration, entry point, or root validation failure rather than generating dozens of redundant alerts across sibling callers.
- **Native & Built-in First**: Use native git diff inspection, pattern matching, and platform audit tools (`npm audit`, `pip-audit`, `cargo audit`) instead of requiring heavy external scanning containers.
- **Zero Hallucination / Zero Noise**: Only report verified patterns and genuine security hazards. Do not report stylistic nitpicks as security vulnerabilities.

---

## Audit Steps

### 1. Collect Scope & Diff
- Run `git diff` and `git diff --staged` to isolate modified lines.
- Identify untracked files with `git status`.
- Check if any private environment files (`.env`, `.env.local`, `.env.production`) or credential files are present or staged.

### 2. Secret & Credential Scanning
Scan all changed lines and unstaged files against credential patterns:
- **Cloud API Keys**: Google Cloud / Gemini (`AIza[0-9A-Za-z-_]{35}`), AWS Access Keys (`AKIA[0-9A-Z]{16}`), GitHub PATs (`ghp_[0-9A-Za-z]{36}`), OpenAI keys (`sk-[A-Za-z0-9-_]{32,}`), Stripe keys (`sk_live_[0-9a-zA-Z]{24}`).
- **Private Keys & Certificates**: `-----BEGIN PRIVATE KEY-----`, `-----BEGIN RSA PRIVATE KEY-----`.
- **Database Connection Strings**: URIs containing embedded passwords (`postgres://user:pass@host/db`, `mysql://`, `mongodb+srv://`).
- **Environment Staging**: Staging of `.env` files must be blocked immediately.

### 3. Injection & Data Handling Checks
- **SQL Injection**: Raw string formatting, template interpolation, or concatenation in SQL statements instead of parameterized queries.
- **Command Injection**: Passing unvalidated user input into shell execution primitives (`child_process.exec`, `os.system`, `subprocess.Popen(shell=True)`).
- **Path Traversal**: Unsanitized user inputs in file path resolution (`fs.readFile(userInput)`, `open(userInput)` without boundary validation).
- **XSS & Unsafe HTML**: Unescaped inner HTML injection (e.g., `dangerouslySetInnerHTML`) with dynamic data.

### 4. Authorization & Multi-Tenant Isolation
- **Authentication Guards**: Ensure new route handlers, server actions, or API endpoints require valid session verification.
- **Row Level Security (RLS)**: In database migrations or schema updates, ensure new tables have RLS enabled (`ALTER TABLE ... ENABLE ROW LEVEL SECURITY;`) with tenant-isolated policies.

### 5. Dependency Vulnerability Audit
If dependency manifests were modified (`package.json`, `package-lock.json`, `requirements.txt`, `pyproject.toml`, `Cargo.toml`):
- Run native audit command if available:
  - Node: `npm audit --audit-level=high`
  - Python: `pip-audit`
  - Rust: `cargo audit`

---

## Remediation & Reporting

If security defects or leaked secrets are detected:
1. **HALT Immediately**: Do not proceed to commit or pull request creation.
2. Present a clear alert block:
   ```markdown
   > [!CAUTION]
   > Security Audit Failed: Critical issues detected in staged changes.
   ```
3. List findings in a structured table:
   | File | Line | Vulnerability Category | Description & Minimal Fix |
   | :--- | :--- | :--- | :--- |
4. Highlight root-cause remediation steps. Require user correction or explicit override before continuing.

If no issues are found, confirm security pass concisely (Caveman style):
```text
Security audit clean. No leaked credentials, injection vectors, or unprotected routes found.
```
