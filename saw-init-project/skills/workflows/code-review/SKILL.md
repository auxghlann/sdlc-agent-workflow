---
name: code-review
description: Procedure for reviewing code changes against specs, architecture, security, and test quality.
---

# Code Review Workflow

## Purpose
Provide a structured checklist and procedure for reviewing local pull requests or code edits.

## Review Criteria
1. **Spec Alignment**: Does the code fulfill `.spec/requirements.md` without feature creep?
2. **Architectural Integrity**: Does it respect component boundaries in `.spec/architecture.md`?
3. **Contract Adherence**: Do API responses and DB operations match `.spec/api.md` and `.spec/data-model.md`?
4. **Security & Secrets**: Are inputs sanitized? Are secrets excluded? Are parameterized queries used?
5. **Test Sufficiency**: Are behavior-driven unit or integration tests included?
6. **Code Quality**: Is the change clean, readable, and free of redundant code?

## Categorized Review Feedback
- **[Blocking]**: Bugs, security vulnerabilities, broken specs, or broken builds. Must be fixed before merging.
- **[Non-blocking]**: Minor refactoring recommendations or style improvements.
- **[Suggestion]**: Ideas for future consideration.
