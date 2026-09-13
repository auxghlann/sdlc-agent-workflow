# Project Specification Map

Welcome to the project specification root. This directory serves as the single source of truth for requirements, architecture, diagrams, API contracts, data models, legal specifications, development workflows, and architectural decisions.

## Specification Hierarchy

To avoid context bloat and ensure precise retrieval, project truth is structured into dedicated component directories. Each directory includes a `README.md` index that maps its subcomponents.

| Component Directory | Domain & Scope | Root Index |
| :--- | :--- | :--- |
| `requirements/` | Product vision, user stories, functional/non-functional scope, acceptance criteria | [requirements/README.md](./requirements/README.md) |
| `architecture/` | System topology, tech stack, component responsibilities, data flow, security | [architecture/README.md](./architecture/README.md) |
| `diagrams/` | Use-case diagrams, sequence diagrams, visual interaction flows | [diagrams/README.md](./diagrams/README.md) |
| `api/` | API conventions, auth contracts, common response/error formats, endpoints | [api/README.md](./api/README.md) |
| `data-model/` | Domain entities, relationships, database schema, migrations, data lifecycle | [data-model/README.md](./data-model/README.md) |
| `legal-documents/` | Terms of service, privacy policies, data retention, erasure rights | [legal-documents/README.md](./legal-documents/README.md) |
| `development/` | Local setup, environment templates, build/test commands, git workflow, DoD | [development/README.md](./development/README.md) |
| `decisions/` | Architectural Decision Records (ADRs) tracking foundational design choices | [decisions/README.md](./decisions/README.md) |
| `plans/` | Active and historical implementation plans for scoped feature work | [plans/](./plans/) |

## Agent Guidelines for Navigating Specifications
1. **Locate the relevant domain**: Identify which component directory corresponds to your current task.
2. **Read the component index**: Open `<component>/README.md` to see the subcomponents and summaries.
3. **Open only targeted files**: Load only the specific subcomponent markdown files needed for the task.
4. **Preserve truth**: When requirements or implementations change, update the corresponding subcomponent file.
