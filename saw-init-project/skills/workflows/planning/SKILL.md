---
name: planning
description: Procedure for creating structured implementation plans before feature development or refactoring.
---

# Feature Planning Workflow

## Purpose
Guide the AI agent in creating detailed, specification-aligned implementation plans written to `.spec/plans/`.

## Prerequisites
Before writing a plan, read the project's authoritative specs:
- Product requirements: `.spec/requirements.md`
- Architecture & system boundaries: `.spec/architecture.md`
- API contracts: `.spec/api.md`
- Data model & persistence: `.spec/data-model.md`
- Decisions & ADR log: `.spec/decisions.md`

## Workflow Procedure
1. **Understand Request**: Clarify goals, constraints, and non-goals with the user.
2. **Inspect Existing Code**: Search and view relevant controllers, services, repositories, schemas, and tests.
3. **Analyze Impact**: Identify affected components, API schema changes, database migrations, testing needs, and security risks.
4. **Consult Engineering Skills**:
   - Architecture: `.agents/skills/engineering/architecture/SKILL.md`
   - API Design: `.agents/skills/engineering/api/SKILL.md`
   - Database Design: `.agents/skills/engineering/database/SKILL.md`
   - Test Strategy: `.agents/skills/engineering/testing/SKILL.md`
5. **Draft Implementation Plan**: Save to `.spec/plans/NNN-feature-name.md` using the standard format:
   - Goal & Background Context
   - User Review Required & Open Questions
   - Proposed Changes (demarcate `[NEW]`, `[MODIFY]`, `[DELETE]`)
   - Verification & Test Strategy
   - Specification Synchronization Tasks
6. **Obtain Approval**: Stop and present the plan to the user for approval before writing code.
