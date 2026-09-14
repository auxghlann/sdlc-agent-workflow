---
name: saw-help
description: Quick-reference card, navigation guide, and cheatsheet for all SDLC Agent Workflow (saw-*) skills, lifecycle phases, commands, and rules. Trigger: /saw-help, "saw help", "how do I use saw", "how to use the workflow".
---

# SDLC Agent Workflow Quick Reference (`saw-help`)

## Goal
Display an immediate, one-shot reference guide and cheat sheet for the SDLC Agent Workflow (`saw-*`) suite. Use this skill when an agent or user needs to understand how the workflow functions, which skill to invoke for a given task, or the constitutional rules governing development.

---

## SDLC Lifecycle Phase Matrix

| Phase | Skill | Primary Purpose | Key Output |
| :--- | :--- | :--- | :--- |
| **Phase 1: Inception** | `saw-init-project` | Scaffolds `.spec/` hierarchy, `.agents/AGENTS.md`, and engineering skills | Modular `.spec/`, `AGENTS.md` |
| **Phase 2: Sync** | `saw-update-spec` | Synchronizes `.spec/` subcomponents against code changes to prevent drift | Updated `.spec/` docs |
| **Phase 3: Audit** | `saw-security-check` | Static security audit scanning diffs for secrets, injections, and RLS flaws | Vulnerability report & audit gate |
| **Phase 4: Review** | `saw-pr` | Runs security gate, branch creation, conventional commit, and GitHub PR | Clean PR (`gh pr create`) |
| **Phase 5: Retention** | `saw-quiz-me` | Generates self-contained HTML documentation & interactive recall quiz | `.docs/recall/recall_*.html` |
| **Reference** | `saw-help` | Quick-reference card and lifecycle navigation guide | This reference card |

---

## Decision Matrix: What Skill to Use When

| Situation / User Intent | Recommended Skill | Trigger / Command |
| :--- | :--- | :--- |
| Starting a new project or onboarding a repository without context structure | `saw-init-project` | `/init-project`, "initialize project context" |
| Finished implementing features, modifying routes, tables, or architecture | `saw-update-spec` | `/update-spec`, "update spec", "sync documentation" |
| Staging changes or checking for secrets, injection vectors, or auth flaws | `saw-security-check` | "run security check", "audit security" |
| Ready to commit changes, create a feature branch, and submit a pull request | `saw-pr` | `/pr`, "create a pr", "prepare pull request" |
| Ending a development session and wanting documentation plus a comprehension quiz | `saw-quiz-me` | `/quiz-me`, "quiz me", "create recall quiz" |
| Unsure which skill to run, need a workflow refresher, or viewing commands | `saw-help` | `/saw-help`, "saw help", "how to use workflow" |

---

## Lifecycle Flow & Safety Gates

```text
[Phase 1: saw-init-project]
           |
           v
[Development & Implementation] <------------------------+
           |                                            |
           v                                            |
[Phase 2: saw-update-spec] (Eliminate Doc Drift)        |
           |                                            |
           v                                            |
[Phase 3: saw-security-check] (Security Gate)           |
           |                                            |
     +-----+-----+                                      |
     |           |                                      |
   [Pass]      [Fail] -----------------------------> Fix Vulnerability
     |
     v
[Phase 4: saw-pr] (Branch -> Conventional Commit -> GitHub PR)
     |
     v
[Phase 5: saw-quiz-me] (HTML Summary & Recall Quiz)
```

### Safety Gate Rules:
1. **Mandatory Security Audit**: `saw-pr` unconditionally invokes `saw-security-check` before any commit or pull request. If any secret leak or high-severity vulnerability is detected, execution halts immediately.
2. **Push & Commit Guard**: Never run `git commit` or `git push` without explicit user review and authorization.
3. **Environment Security Guard**: Never open, read, or inspect `.env`, `.env.local`, or private credential files. Only read publicly tracked templates like `.env.example`.
4. **Zero Emojis**: Strictly avoid emojis as icons in code, commit messages, diagrams, and documentation.

---

## Context Navigation & Progressive Disclosure

When working in a repository scaffolded by `saw-init-project`, traverse context using the 7-level hierarchy:

```text
Level 0: AGENTS.md                   = Constitution & core agent directives
Level 1: .spec/README.md             = Master specification map
Level 2: .spec/<component>/README.md = Domain index (routes to specific subcomponents)
Level 3: .spec/<component>/*.md      = Granular, authoritative truth
Level 4: .spec/plans/                = Transient implementation plans
Level 5: Persistent SDLC Skills      = saw-* skills in .agents/skills/ or global skills
Level 6: Source Code                 = Active implementation files
```

Load only the specific subcomponent files needed for the task to conserve context tokens.

---

## Companion Optimization Skills

The SDLC Agent Workflow integrates two companion optimization skills:

### 1. Ponytail Suite (`ponytail`)
Enforces minimal code and YAGNI discipline upfront via the 7-Rung Decision Ladder:
1. **YAGNI**: Question if the abstraction needs to exist at all.
2. **Codebase Reuse**: Reuse existing utilities and patterns.
3. **Standard Library**: Prefer stdlib over new third-party libraries.
4. **Native Platform**: Use platform features before adding custom code.
5. **Installed Dependencies**: Use existing packages before adding new ones.
6. **One-Liner**: Simplify to a single line where appropriate.
7. **Minimal Code**: Write only the surgical code required.

Commands:
- `/ponytail [lite|full|ultra]`: Sets lazy intensity mode.
- `/ponytail-help`: Reference card for ponytail commands.
- `/ponytail-review`: Reviews diffs exclusively for bloat.
- `/ponytail-audit`: Whole-repository over-engineering scan.
- `/ponytail-debt`: Tracks deliberate shortcut comments.

### 2. Caveman Mode (`caveman`)
Cuts output tokens by communicating in terse, technically precise language without conversational filler.
- **Explicit Exemption**: Legal documents (`privacy-policy.md`, `terms-of-service.md`) must always remain fully formal, explicit, and uncompressed.

---

## Available Commands Summary

- `/saw-help`: Show this SDLC Agent Workflow reference guide.
- `/init-project` or `/init-project-v2`: Scaffold project context and specification hierarchy.
- `/update-spec`: Synchronize `.spec/` documents with active codebase changes.
- `/pr`: Run security audit, manage branches, create conventional commit, and open PR.
- `/quiz-me`: Synthesize session accomplishments into offline HTML docs and recall quiz.
- `/ponytail`: Activate Ponytail minimal coding mindset.
