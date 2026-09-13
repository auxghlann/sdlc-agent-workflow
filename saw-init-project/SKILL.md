---
name: saw-init-project
description: Scaffolds the Modular AI Engineering Context System in a new or existing repository, establishing hierarchical project truth in .spec/, agent rules in .agents/AGENTS.md, diagrams, and legal specifications. Use when initializing a project or establishing repository context.
---

# Modular AI Engineering Context System Initialization (`saw-init-project`)

## Goal
Establish a **Modular AI Engineering Context System** in a new or existing repository by separating project truth (`.spec/`), agent rules (`.agents/AGENTS.md`), engineering procedures, diagrams, legal documents, and implementation plans (`.spec/plans/`).

This skill uses **Hierarchical Context Indexing** and **Progressive Disclosure** to prevent context window bloat: every domain component has its own directory with a root `README.md` index that directs the agent only to the exact subcomponent needed for a given task.

---

## Prerequisite Skills Verification

Before executing initialization steps, verify that companion workflow optimization skills are present:
1. **Check Local Workspace**: Inspect `.agents/skills/caveman/` and `.agents/skills/ponytail/`.
2. **Check Global Customizations**: Inspect user-level skills in `~/.agents/skills/` or `<global_customizations_root>/skills/`.
3. **Download Condition**: If either skill is absent, inform the user or retrieve it via Skills CLI (`npx skills add <source>`). Do NOT attempt redundant downloads if already installed.

---

## Execution Principles (Caveman & Ponytail)

1. **Caveman Token Efficiency**:
   - The agent MUST execute this workflow in Caveman mode: terse output, drop articles, drop pleasantries, omit conversational filler, fragments acceptable.
   - **CRITICAL EXCEPTION FOR LEGAL DOCUMENTS**: When scaffolding, writing, or customizing files in `.spec/legal-documents/` (`privacy-policy.md`, `terms-of-service.md`), **SUSPEND Caveman mode completely**. Legal terms must remain fully formal, explicit, comprehensive, and legally sound.
2. **Ponytail Planning Upfront**:
   - The agent MUST load and follow the `ponytail` skill (`.agents/skills/ponytail/SKILL.md` or `~/.agents/skills/ponytail/SKILL.md`) when drafting initial project specifications.
   - For a quick reference of modes (`lite`, `full`, `ultra`) and sub-skills, consult `ponytail-help` (`.agents/skills/ponytail-help/SKILL.md` or `/ponytail-help`).
   - Stop at the first rung that holds: YAGNI first (no speculative architecture), existing codebase reuse, stdlib before custom code, native platform features before heavy dependencies.
   - Do NOT scaffold speculative abstractions, mock frameworks, or unrequested microservices.

---

## Mental Model & Hierarchy

```text
Level 0: AGENTS.md                   = Constitution & high-level agent rules
Level 1: .spec/README.md             = Master specification map (routes to components)
Level 2: .spec/<component>/README.md = Component index (routes to subcomponents)
Level 3: .spec/<component>/*.md      = Granular, authoritative truth
Level 4: .spec/plans/                = Transient implementation plans
Level 5: Persistent SDLC Skills      = saw-* skills in .agents/skills/ or global skills
Level 6: Source Code                 = Actual codebase implementation
```

---

## Target System Architecture

```text
Project Workspace:
.agents/
`-- AGENTS.md (Constitutional rules, points to .spec/ and saw-* skills)

.spec/
|-- README.md (Master specification map)
|-- api/
|   |-- README.md (API index)
|   |-- auth.md
|   |-- common-formats.md
|   |-- conventions.md
|   |-- endpoints.md
|   `-- pagination.md
|-- architecture/
|   |-- README.md (Architecture index)
|   |-- components.md
|   |-- data-flow.md
|   |-- deployment.md
|   |-- overview.md
|   |-- security.md
|   `-- tech-stack.md
|-- diagrams/
|   |-- README.md (Diagrams index)
|   |-- use-case.md
|   `-- system-flow.md
|-- data-model/
|   |-- README.md (Data model index)
|   |-- entities.md
|   |-- lifecycle.md
|   |-- migrations.md
|   |-- relationships.md
|   `-- schema.md
|-- legal-documents/
|   |-- README.md (Legal index)
|   |-- privacy-policy.md
|   `-- terms-of-service.md
|-- decisions/
|   |-- README.md (ADR log index)
|   |-- ADR-TEMPLATE.md
|   `-- adr-001-baseline.md
|-- development/
|   |-- README.md (Development index)
|   |-- commands.md
|   |-- definition-of-done.md
|   |-- git-workflow.md
|   `-- setup.md
|-- requirements/
|   |-- README.md (Requirements index)
|   |-- acceptance-criteria.md
|   |-- functional.md
|   |-- non-functional.md
|   |-- overview.md
|   |-- scope.md
|   `-- user-stories.md
`-- plans/

Reference Procedural Skills Repository:
saw-init-project/skills/
|-- engineering/
|   |-- architecture/SKILL.md (Structural boundaries & ADRs)
|   |-- api/SKILL.md          (REST/GraphQL design & contracts)
|   |-- database/SKILL.md     (Schema, constraints & migrations)
|   |-- security/SKILL.md     (Threat modeling & auth validation)
|   |-- testing/SKILL.md      (Test strategies & DoD gates)
|   `-- git/SKILL.md          (Branching & staging hygiene)
`-- workflows/
    |-- planning/SKILL.md       (Scope & requirements decomposition)
    |-- implementation/SKILL.md (Minimal surgical execution)
    |-- debugging/SKILL.md      (Root-cause hypothesis loop)
    |-- code-review/SKILL.md    (Quality gates & complexity checks)
    `-- release/SKILL.md        (Deployment & tag verification)
```

---

## Execution Workflow

### Automation Helper
Execute the companion PowerShell script to scaffold the complete structure automatically without overwriting existing files:
```powershell
powershell -File ./scripts/init-project.ps1
```
Or execute manual steps below.

---

### Step 1: Existing Repository Inspection & Context Preservation

1. **Scan Workspace**:
   - Inspect existing `README.md`, package manifests (`package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`), database schemas, and existing docs.
   - **Environment Variable Guard**: Never open or inspect `.env`, `.env.local`, or private credential files. Only read `.env.example`.
2. **Preserve Existing Context**:
   - Do NOT overwrite existing project documentation blindly.
   - Extract real project facts to populate relevant `.spec/` subcomponents.
3. **Do Not Hallucinate Facts**:
   - If details are undetermined, mark with:
     ```markdown
     > [!TODO]
     > This information has not yet been determined for this repository.
     ```

---

### Step 2: Scaffold Modular Specification Directory (`.spec/`)

Populate `.spec/` using templates from `saw-init-project/templates/`:
1. **Master Spec Map**: `templates/README.md` -> `.spec/README.md`
2. **Product Requirements**: `templates/requirements/` -> `.spec/requirements/`
3. **System Architecture**: `templates/architecture/` -> `.spec/architecture/`
4. **System Diagrams**: `templates/diagrams/` -> `.spec/diagrams/`
   - `use-case.md`: Functional actors, system boundary, and Mermaid use-case flowchart.
   - `system-flow.md`: Request sequence diagrams and lifecycle.
5. **API Contracts**: `templates/api/` -> `.spec/api/`
6. **Data Model**: `templates/data-model/` -> `.spec/data-model/`
7. **Legal Documents**: `templates/legal-documents/` -> `.spec/legal-documents/`
   - `privacy-policy.md`: Full privacy specification (explicit, uncompressed).
   - `terms-of-service.md`: Full terms of service (explicit, uncompressed).
8. **Development Guide**: `templates/development/` -> `.spec/development/`
9. **Architectural Decisions**: `templates/decisions/` -> `.spec/decisions/`
10. **Active Plans**: Create empty `.spec/plans/`.

---

### Step 3: Scaffold Agent Constitution (`.agents/AGENTS.md`)

Create `.agents/AGENTS.md` using `templates/AGENTS.md`.
Enforce:
- `.spec/` as absolute source of truth.
- Strict prohibition against reading private `.env` files (rely only on `.env.example`).
- Strict constraints: never push or commit without explicit user instruction.
- Strictly avoid emojis as icons in code or docs.
- Ponytail minimal surgical edits.

---

### Step 4: Gitignore Policy Guidance

Team-shared context files SHOULD BE COMMITTED:
- `.spec/`
- `.agents/AGENTS.md`

If local-only configs or notes are needed, create `.agents/local/` and add only `.agents/local/` to `.gitignore`.

---

### Step 5: Final Validation Checklist
- `.agents/AGENTS.md` exists and contains security & environment guards.
- All 8 component directories exist in `.spec/` (`requirements/`, `architecture/`, `diagrams/`, `api/`, `data-model/`, `legal-documents/`, `development/`, `decisions/`).
- Each component directory contains its own `README.md` index.
- No private `.env` files were inspected or committed.
- Legal documents are fully articulated without compression.
- Output report is presented to the user concisely in Caveman style.
