---
name: saw-update-spec
description: Analyzes recent codebase changes and synchronizes modular .spec/ documents (requirements, architecture, diagrams, api, data-model, legal, decisions) to eliminate documentation drift.
---

# Specification Synchronization Skill (`saw-update-spec`)

## Goal
To inspect recent changes across the codebase (`git status`, `git diff`, commit history, modified files) and surgically synchronize the modular `.spec/` files so that documentation remains the authoritative single source of truth.

---

## Workflow Steps

### 1. Detect Specification Root
- Verify that `.spec/` exists in the workspace root.
- If missing:
  - Halt execution.
  - Recommend initializing the specification system via `saw-init-project`.

### 2. Gather Changes & Codebase State
- Inspect modified, untracked, and committed changes:
  - Run `git status`
  - Run `git diff`
  - Inspect recent commit summaries: `git log -n 5 --oneline`
- Scan manifests for dependency updates (`package.json`, `requirements.txt`, `pyproject.toml`, `Cargo.toml`).
- Scan database directories for new migration files or schema changes.
- Scan API routing files for new endpoints or altered contracts.

### 3. Analyze Drift & Perform Surgical Updates

Evaluate affected domains and update the corresponding `.spec/` subcomponents:

#### A. Product Requirements (`.spec/requirements/`)
- Compare implemented features against `user-stories.md` and `functional.md`.
- Mark completed features or acceptance criteria as fulfilled.
- Append newly introduced scope items or capabilities.

#### B. Architecture & Diagrams (`.spec/architecture/` & `.spec/diagrams/`)
- **Tech Stack**: Update `architecture/tech-stack.md` when new dependencies or engines are added.
- **Component Topology**: Update `architecture/components.md` if new services or background workers were added.
- **Diagrams**: Update Mermaid flowcharts in `diagrams/use-case.md` or sequence diagrams in `diagrams/system-flow.md` when user-facing interactions or lifecycles change.

#### C. API Contracts (`.spec/api/`)
- Update `api/endpoints.md` with new routes, methods, payload schemas, query parameters, and response status codes.
- Update `api/auth.md` if authentication headers or session tokens changed.

#### D. Data Model (`.spec/data-model/`)
- Update `data-model/schema.md` and `data-model/entities.md` when tables, columns, constraints, or relations are added/modified.
- Log new migration references in `data-model/migrations.md`.

#### E. Legal & Compliance (`.spec/legal-documents/`)
- If new external cloud services, authentication scopes, analytics, or data retention changes occurred, update `legal-documents/privacy-policy.md` and `terms-of-service.md`.
- Note: Keep legal specifications formal, explicit, and uncompressed.

#### F. Development Guide (`.spec/development/`)
- Update `development/commands.md` if build, test, or run scripts changed.
- Verify environment variable requirements in `.env.example`.

#### G. Architectural Decisions (`.spec/decisions/`)
- Check if changes introduced major architectural decisions (new database engine, auth strategy, refactoring pattern, caching layer).
- If a significant decision was made:
  - Create a new ADR file in `.spec/decisions/` (e.g., `adr-002-<topic>.md`) using `ADR-TEMPLATE.md`.
  - Update `.spec/decisions/README.md` index.

---

## Finalization & Report
- Run `git diff .spec/` to confirm updates are surgical and accurate.
- Report modified specification files concisely to the user.
- Strictly avoid emojis in code, diffs, and summaries.
