---
name: architecture
description: Procedure for evaluating structural changes, component boundaries, and architectural decision records (ADRs).
---

# Architecture Engineering Skill

## Purpose
Guide the AI agent in making structural, component-level, and system boundary changes safely.

## Principles
1. **Separation of Concerns**: Keep domain boundaries explicit. Do not couple UI layers directly to database or persistence logic.
2. **Minimal Complexity**: Avoid over-engineering. Pick the simplest architectural pattern that meets requirements.
3. **Specification Alignment**: Read `.spec/requirements.md` and `.spec/architecture.md` before proposing changes.

## Workflow Procedure
1. **Analyze Requirements**: Determine if the change requires new services, modules, or boundary adjustments.
2. **Identify Trade-offs**: Evaluate scalability, maintainability, performance, and operational cost.
3. **Update Spec**: Modify `.spec/architecture.md` to reflect new components, technology additions, or Mermaid data flow diagrams.
4. **Log ADR**: For major decisions, append an ADR to `.spec/decisions.md` following standard format (Status, Date, Context, Decision, Alternatives, Consequences).
