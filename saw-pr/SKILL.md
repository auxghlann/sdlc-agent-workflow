---
name: saw-pr
description: Runs pre-flight security checks via saw-security-check, manages feature branches, enforces conventional commits, and opens structured GitHub Pull Requests.
---

# Pull Request & Commit Workflow (`saw-pr`)

## Goal
Ensure code is statically audited, cleanly committed under Conventional Commits standards, and submitted via a well-structured GitHub Pull Request without committing credentials or unverified changes.

---

## Workflow Steps

**Agent Instructions**: Execute following steps sequentially. Never bypass security checks or commit without approval.

### 1. Mandatory Security Audit (`saw-security-check`)
- Execute the `saw-security-check` skill across active and staged changes.
- If any leaked secrets, private `.env` tracking, or critical vulnerabilities are identified:
  - **STOP IMMEDIATELY**.
  - Present findings to the user.
  - Halt workflow execution until the user corrects the vulnerability.
- If clean, proceed to step 2.

### 2. Branch Management
- Run `git status` to determine current branch.
- If current branch is `main` or `master`:
  - Formulate a clear, descriptive branch name based on changed functionality (e.g., `feat/auth-middleware`, `fix/token-expiry`, `refactor/api-proxy`).
  - Ask user whether to create and switch: `git checkout -b <branch_name>`.
- Stage approved changes using `git add <files>`.

### 3. Conventional Commit Formulation
- Analyze staged diffs and construct a strict [Conventional Commit](https://www.conventionalcommits.org/) message:
  - Format: `<type>(<optional scope>): <short summary>`
  - Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`.
  - Strictly avoid emojis in commit messages.
  - Keep message concise and descriptive.
- Present proposed commit message to user for explicit approval.
- Once approved, execute: `git commit -m "<message>"`.

### 4. Push & Pull Request Creation
- Request user confirmation before pushing remote branches.
- Once confirmed, push branch: `git push -u origin <branch_name>`.
- Create a structured Pull Request using GitHub CLI:
  ```powershell
  gh pr create --title "<Commit_Title>" --body "## Description`n<summary>`n`n## Context`n<rationale>`n`n## Security Audit`nVerified clean via saw-security-check."
  ```
- Output clickable GitHub PR link to the user.
