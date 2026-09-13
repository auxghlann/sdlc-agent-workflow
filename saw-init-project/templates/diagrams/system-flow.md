# System Sequence & Data Flow Diagram

This document illustrates the sequence of interactions, boundaries, and data transformations across client, server, background workers, and persistent stores.

---

## 1. Request Lifecycle Sequence

```mermaid
sequenceDiagram
    autonumber
    actor User as End User
    participant Client as Client Application
    participant Proxy as Auth / Proxy Middleware
    participant Server as Application Server / Action
    participant Ext as External Service / LLM
    participant DB as Database (RLS)

    User->>Client: Submit action form / Click event
    Client->>Proxy: Dispatch authenticated request
    Proxy->>Proxy: Validate session cookie / JWT
    alt Invalid Session
        Proxy-->>Client: 401 Unauthorized
        Client-->>User: Prompt sign-in
    else Valid Session
        Proxy->>Server: Forward request with user context
        Server->>Server: Validate payload schema
        opt External Integration Required
            Server->>Ext: Invoke API call
            Ext-->>Server: Return structured response
        end
        Server->>DB: Query / Mutate records (Scoped to user_id)
        DB-->>Server: Return affected rows
        Server-->>Client: Return success payload
        Client-->>User: Render optimistic / updated UI state
    end
```

---

## 2. Key Data Flow Guarantees
- **Tenant Scoping**: All database mutations require explicit user identifier binding or Row Level Security policy evaluation.
- **Input Sanitization**: Client-side validation is accompanied by strict server-side schema verification.
- **Error Propagation**: Unhandled exceptions are logged with scrubbed PII, returning non-leaking user-safe error codes.
