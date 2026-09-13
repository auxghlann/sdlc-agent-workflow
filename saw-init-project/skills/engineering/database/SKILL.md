---
name: database
description: Procedure for schema design, entity relationships, query performance, constraints, and migrations.
---

# Database Engineering Skill

## Purpose
Guide the AI agent in persistent data model design, schema migrations, and query safety.

## Directives
1. **Data Integrity**: Enforce constraints (Foreign Keys, NOT NULL, UNIQUE, CHECK) at the database level rather than application code alone.
2. **Indexing Strategy**: Index primary keys, foreign keys, and frequently queried/sorted columns. Avoid redundant indexes.
3. **Migration Hygiene**: Write idempotent, versioned database migration scripts (e.g. Liquibase, Flyway, Alembic, Prisma). Always include rollback steps.
4. **Deletion Lifecycle**: Clearly define CASCADE vs SOFT-DELETE policies in `.spec/data-model.md`.
5. **Specification Sync**: Update `.spec/data-model.md` and ER diagrams whenever entities or tables are modified.
