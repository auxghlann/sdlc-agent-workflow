---
name: implementation
description: Procedure for executing approved implementation plans safely, minimally, and surgically.
---

# Plan Execution & Implementation Workflow

## Purpose
Guide the AI agent in executing an approved plan from `.spec/plans/` while preserving system integrity.

## Directives
1. **Follow the Approved Plan**: Stick strictly to the changes detailed in `.spec/plans/NNN-feature-name.md`.
2. **Inspect Before Changing**: View the target lines and invocation sites before editing.
3. **Minimal Surgical Edits**: Modify only the exact lines required. Match existing formatting and code style.
4. **No Speculative Features**: Do not add unrequested abstractions, extra endpoints, or unused parameters.
5. **Sync Specifications**: Update affected `.spec/` files (`api.md`, `data-model.md`, `architecture.md`) whenever system contracts or behavior change.
6. **Run Verification Commands**: Execute build and test commands (see `.spec/development.md`).
7. **Inspect Diff**: Review `git diff` to verify no leftover debug prints, temporary files, or unintended changes exist.
