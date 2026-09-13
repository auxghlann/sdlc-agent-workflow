---
name: git
description: Procedure for repository hygiene, commit conventions, diff reviews, and safe staging.
---

# Git Engineering Skill

## Purpose
Enforce clean Git repository hygiene, atomic commit history, and safe staging practices.

## Pre-Commit Checklist
1. **Verification**: Verify build completes with zero errors and all tests pass.
2. **Diff Review**: Inspect `git diff --staged` line by line.
   - Remove temporary debug logs, print statements, and commented-out dead code.
   - Verify no secrets or sensitive files (`.env`, `.pem`) are staged.
3. **Conventional Commits**: Format commit messages using conventional prefixes:
   - `feat:` New feature
   - `fix:` Bug fix
   - `docs:` Documentation updates
   - `refactor:` Code restructuring without behavior changes
   - `test:` Test suite updates
   - `chore:` Build/dependency updates
