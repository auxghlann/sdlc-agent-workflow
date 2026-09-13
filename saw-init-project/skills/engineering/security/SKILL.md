---
name: security
description: Procedure for secure coding practices, authentication, authorization, input validation, and secret hygiene.
---

# Security Engineering Skill

## Purpose
Enforce security standards across application code, environment configurations, and external integrations.

## Fundamental Rules
1. **Zero Secret Leaks**: Never commit `.env` files, API keys, private keys, or passwords. Store secrets strictly in environment variables.
2. **Parameterized Queries**: Always use parameterized queries or ORMs to prevent SQL Injection. Never concatenate untrusted strings into SQL.
3. **Sanitize & Validate Input**: Validate all incoming payloads against strict DTO schemas. Escape output to prevent XSS.
4. **Auth & Least Privilege**: Enforce explicit authentication and role-based/resource-based authorization checks on all non-public endpoints.
5. **CORS & Security Headers**: Configure CORS policies tightly to allowed origins. Enforce HSTS, CSP, and X-Content-Type-Options headers.
6. **Safe Logging**: Never log passwords, tokens, API keys, or personally identifiable information (PII).
