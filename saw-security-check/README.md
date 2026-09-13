# SDLC Security Check Skill (`saw-security-check`)

A focused security audit skill designed to detect exposed secrets, injection risks, authentication flaws, and dependency vulnerabilities across active project diffs and staged commits.

---

## Capabilities

- **Credential & Secret Leak Detection**: Scans diffs for cloud tokens (AWS, Google Gemini, GitHub, OpenAI), database URIs with passwords, and private keys.
- **Environment File Defense**: Blocks accidental committing or staging of `.env` files.
- **Injection Analysis**: Flags unparameterized SQL queries, shell execution with unvalidated variables, and path traversals.
- **Tenant Isolation Verification**: Confirms database migrations include Row Level Security (RLS) policies.
- **Dependency Auditing**: Runs native security audits (`npm audit`, `pip-audit`, `cargo audit`).

---

## Usage

Agents invoke this skill prior to opening Pull Requests or creating commits.

You can also run the PowerShell scanner manually:
```powershell
powershell -File ./scripts/security-check.ps1
```

---

## Integration with `saw-pr`
The `saw-pr` workflow automatically invokes `saw-security-check` as its mandatory gate step. If issues are identified, the workflow halts and blocks the PR creation process until vulnerabilities are addressed.
