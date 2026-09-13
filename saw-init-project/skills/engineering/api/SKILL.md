---
name: api
description: Procedure for designing, modifying, and maintaining REST/gRPC/GraphQL API contracts.
---

# API Engineering Skill

## Purpose
Guide the AI agent in designing clean, consistent, and backward-compatible APIs.

## Design Rules
1. **Resource-Oriented Nouns**: Use plural nouns for endpoints (`/api/tasks`, `/api/users`).
2. **Standard HTTP Verbs**:
   - `GET`: Read resources (idempotent, safe).
   - `POST`: Create resource.
   - `PUT`: Full update (idempotent).
   - `PATCH`: Partial update.
   - `DELETE`: Remove resource.
3. **Explicit Schemas & Validation**: Define request bodies, query parameters, headers, and standard response wrappers.
4. **Status Codes**:
   - `200 OK`, `201 Created`, `204 No Content`
   - `400 Bad Request`, `401 Unauthorized`, `403 Forbidden`, `404 Not Found`, `409 Conflict`, `422 Unprocessable Entity`
   - `500 Internal Server Error`
5. **Contract Maintenance**: Update `.spec/api.md` whenever an endpoint, query parameter, or payload schema changes.
