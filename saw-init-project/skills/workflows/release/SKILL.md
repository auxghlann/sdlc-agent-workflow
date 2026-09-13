---
name: release
description: Procedure for preparing changes, migrations, and documentation for release.
---

# Release Preparation Workflow

## Purpose
Guide the AI agent in verifying, packaging, and documenting application releases.

## Pre-Release Checklist
1. **Clean Build Verification**: Run standard clean build and verify zero compiler or linter errors.
2. **Complete Test Suite**: Execute unit, integration, and API contract tests.
3. **Database Migration Audit**: Verify schema migrations run cleanly forward and have backward rollback scripts.
4. **Environment Variables Audit**: Ensure all new configuration variables are documented in `.spec/development.md`.
5. **API Compatibility Verification**: Ensure no breaking contract changes were made to active API versions in `.spec/api.md`.
6. **Specification Synchronization**: Confirm all `.spec/` documents match current production state.
7. **Release Summary**: Generate a clean release summary detailing new features, fixes, migration steps, and ADR links.
