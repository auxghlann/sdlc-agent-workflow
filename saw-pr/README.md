# Pull Request & Commit Skill (`saw-pr`)

Automates the pull request workflow with built-in security auditing, branch creation, conventional commit formatting, and GitHub CLI PR submission.

---

## Features

- **Integrated Security Gate**: Directly runs `saw-security-check` to verify no credentials, keys, or high-severity vulnerabilities are staged.
- **Branch Protection**: Proposes dedicated feature/fix branches rather than committing directly to `main`/`master`.
- **Conventional Commits**: Formulates strict conventional commit messages with zero emojis.
- **GitHub PR Integration**: Creates structured PR descriptions documenting summary, rationale, and security audit status via `gh pr create`.
