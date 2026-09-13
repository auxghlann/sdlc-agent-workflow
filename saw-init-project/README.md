# Modular AI Engineering Context System Skill (`saw-init-project`)

An extensible agent skill and scaffolding engine for establishing the **Modular AI Engineering Context System** across new or existing repositories as part of the SDLC Agent Workflow (`saw-*`) suite.

This system decouples agent rules, authoritative project specifications, persistent global skills, and transient implementation plans. By leveraging **Hierarchical Context Indexing** and **Progressive Disclosure**, it eliminates monolithic context bloat and prevents agent hallucinations.

---

## Architecture & Mental Model

```text
Level 0: AGENTS.md                   = Constitution & high-level agent rules
Level 1: .spec/README.md             = Master specification map
Level 2: .spec/<component>/README.md = Domain index (maps subcomponents)
Level 3: .spec/<component>/*.md      = Granular, authoritative truth
Level 4: .spec/plans/                = Transient implementation plans
Level 5: Persistent SDLC Skills      = saw-* skills in .agents/skills/ or global skills
Level 6: Source Code                 = Actual codebase implementation
```

---

## Skill Package Structure

```text
saw-init-project/
|-- README.md
|-- SKILL.md
|-- scripts/
|   `-- init-project.ps1
|-- skills/
|   |-- engineering/
|   |   |-- api/SKILL.md
|   |   |-- architecture/SKILL.md
|   |   |-- database/SKILL.md
|   |   |-- git/SKILL.md
|   |   |-- security/SKILL.md
|   |   `-- testing/SKILL.md
|   `-- workflows/
|       |-- code-review/SKILL.md
|       |-- debugging/SKILL.md
|       |-- implementation/SKILL.md
|       |-- planning/SKILL.md
|       `-- release/SKILL.md
`-- templates/
    |-- AGENTS.md
    |-- README.md
    |-- api/
    |-- architecture/
    |-- diagrams/
    |   |-- README.md
    |   |-- use-case.md
    |   `-- system-flow.md
    |-- data-model/
    |-- legal-documents/
    |   |-- README.md
    |   |-- privacy-policy.md
    |   `-- terms-of-service.md
    |-- decisions/
    |-- development/
    `-- requirements/
```

---

## Prerequisite Verification
Before initialization begins, the executing agent checks if optimization skills are present:
1. Workspace check: `.agents/skills/caveman` and `.agents/skills/ponytail`.
2. Global check: `~/.agents/skills/{caveman,ponytail}`.
3. If absent, the agent alerts the user or downloads them via the Skills CLI (`npx skills add <source>`).

---

## Key Features & Constraints

1. **Caveman Mode Execution**: Outputs are ultra-compressed to conserve context tokens.
2. **Legal Document Precision**: Caveman mode is strictly disabled when drafting `privacy-policy.md` and `terms-of-service.md` to preserve formal legal validity.
3. **Ponytail Planning**: Upfront enforcement of YAGNI and standard-library/native implementations before speculative abstractions are introduced.
4. **Environment Security**: AI agents are forbidden from opening private `.env` files and must rely solely on `.env.example`.
5. **No Emojis**: Emojis are strictly avoided in code, comments, diagrams, and documentation.
