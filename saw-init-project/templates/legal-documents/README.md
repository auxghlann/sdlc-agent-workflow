# Legal Specifications Index

This directory maintains authoritative specifications for project legal compliance, user terms, privacy requirements, and data governance.

## Subcomponents

| Document | Purpose | Audience |
| :--- | :--- | :--- |
| [privacy-policy.md](./privacy-policy.md) | Privacy Policy defining data collection, storage, encryption, tenant isolation, and deletion rights | Users, Compliance Auditors, Legal Counsel |
| [terms-of-service.md](./terms-of-service.md) | Terms of Service outlining acceptable use, account obligations, liability limitations, and licensing | Users, Service Operators |

## Governance Rules
- **Explicit and Uncompressed**: Unlike engineering code workflows where token compression (e.g., Caveman mode) may be applied, legal specifications must remain formal, exhaustive, and precise.
- **Security-Spec Alignment**: Architectural security measures (encryption at rest, Row Level Security, session cookie attributes) must accurately mirror statements in the privacy specification.
- **Zero Ambiguity**: Ensure terms regarding data ownership, retention periods, and deletion procedures are explicitly defined.
