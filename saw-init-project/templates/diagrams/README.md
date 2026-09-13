# System Diagrams Index

This directory maintains visual diagrams documenting behavioral use cases, data flows, and system interactions.

## Subcomponents

| Document | Description | Format |
| :--- | :--- | :--- |
| [use-case.md](./use-case.md) | Behavioral and functional use cases, actor interactions, system boundaries | Mermaid `flowchart LR` |
| [system-flow.md](./system-flow.md) | End-to-end request lifecycle and sequence diagrams across layers | Mermaid `sequenceDiagram` |

## Diagramming Conventions
- Use standard Mermaid syntax.
- Quote node labels containing parentheses, brackets, or special characters (e.g., `id["Label (Context)"]`).
- Avoid raw HTML formatting inside node text.
- Strictly avoid emojis as icons or labels in diagrams.
- Keep diagrams updated when architectural flows or domain features change.
