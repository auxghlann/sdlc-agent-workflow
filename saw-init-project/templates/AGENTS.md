# Agent Constitution & Project Rules

Welcome to this project! This file serves as the workspace constitution for all AI agents.

## Absolute Source of Truth
CRITICAL: You MUST refer to the `.spec/` directory for the definitive truth regarding this project's requirements, architecture, API contracts, and data model.
Start navigation from `.spec/README.md` or the corresponding component index:
- Product Requirements & Scope: `.spec/requirements/README.md`
- Architecture & System Boundaries: `.spec/architecture/README.md`
- System Diagrams & Visual Flows: `.spec/diagrams/README.md`
- API Contracts & Endpoints: `.spec/api/README.md`
- Data Model & Persistence: `.spec/data-model/README.md`
- Legal & Compliance Specifications: `.spec/legal-documents/README.md`
- Dev Guide & Commands: `.spec/development/README.md`
- Architectural Decision Log: `.spec/decisions/README.md`
- Active Implementation Plans: `.spec/plans/`

Always align your implementation plans and code changes with the documents in `.spec/` before writing code. Load only the specific subcomponent markdown files needed for your immediate task to avoid unnecessary context bloat.

## Specification Precedence & Conflict Resolution
- Each specification document is authoritative within its domain (`requirements/` for scope, `architecture/` for structure, `diagrams/` for visual contracts, `api/` for endpoints, `data-model/` for persistence, `legal-documents/` for policy compliance, `development/` for workflow).
- If specifications conflict:
  1. Identify the conflict and affected documents.
  2. Attempt safe resolution from context.
  3. If ambiguous, halt and ask the user for clarification.
  4. Update the relevant `.spec/` documents once clarified.

## Core Directives
1. **Spec-First & Plan-First**: Create a plan in `.spec/plans/` for significant changes before modifying code.
2. **Minimal & Surgical Edits**: Write only the absolute minimum code necessary for the immediate task. Leave unbroken adjacent code untouched.
3. **Environment Security**: Never commit secrets, credentials, or private configuration files. **Never read, open, or inspect private environment files (e.g., `.env`, `.env.local`, `.env.production`)**. Strictly rely only on publicly committed sample templates such as `.env.example`.
4. **Strict Push & Commit Guard**: Never execute `git push` or `git commit` unless explicitly instructed or approved by the user.
5. **No Hallucinated Facts**: Rely on `.spec/` and active codebase inspection. Never invent endpoints, parameters, schemas, or file paths.
6. **Specification Synchronization**: Update corresponding `.spec/` documents whenever code changes alter system behavior, APIs, diagrams, or database schemas.
7. **Strict Icon & Emoji Rule**: Strictly avoid adding emojis as icons in code or in documentation.

## Consulting SDLC Skills
Refer to the SDLC agent workflow skills (`saw-*`) in `.agents/skills/` or persistent global skills:
- **Project Context Scaffolding**: `saw-init-project`
- **Security & Vulnerability Audit**: `saw-security-check`
- **Pull Request & Commit Flow**: `saw-pr`
- **Specification Drift Sync**: `saw-update-spec`
- **Session Recall & Quiz Generation**: `saw-quiz-me`
- **Workflow Guide & Reference**: `saw-help` (`/saw-help`)

## Companion Optimization Skills
Refer to optimization skills in `.agents/skills/` or `~/.agents/skills/`:
- **Ponytail Suite** (`/ponytail [lite|full|ultra]`): Enforces minimal code and YAGNI ladder.
  - Quick reference & commands: `/ponytail-help` (`ponytail-help`)
  - Over-engineering review: `/ponytail-review` (`ponytail-review`)
  - Codebase audit: `/ponytail-audit` (`ponytail-audit`)
  - Deferred shortcuts ledger: `/ponytail-debt` (`ponytail-debt`)
- **Caveman Mode** (`/caveman [lite|full|ultra]`): Token-efficient compressed communication. Exempts legal specifications.

## Reference Engineering & Workflow Skills
For standard engineering procedures and workflows, refer to the skills bundled in `saw-init-project/skills/` (or `.agents/skills/`):
- **Engineering Procedures**:
  - Architecture: `skills/engineering/architecture/SKILL.md`
  - API Design: `skills/engineering/api/SKILL.md`
  - Database & Migrations: `skills/engineering/database/SKILL.md`
  - Security Engineering: `skills/engineering/security/SKILL.md`
  - Testing & Quality: `skills/engineering/testing/SKILL.md`
  - Git Operations: `skills/engineering/git/SKILL.md`
- **Workflow Procedures**:
  - Planning: `skills/workflows/planning/SKILL.md`
  - Implementation: `skills/workflows/implementation/SKILL.md`
  - Debugging: `skills/workflows/debugging/SKILL.md`
  - Code Review: `skills/workflows/code-review/SKILL.md`
  - Release: `skills/workflows/release/SKILL.md`
