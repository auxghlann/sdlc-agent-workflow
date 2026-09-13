---
name: testing
description: Procedure for behavior-driven testing across unit, integration, API, and E2E test suites.
---

# Testing Engineering Skill

## Purpose
Guide the AI agent in creating effective, maintainable test suites focused on real system behavior and boundaries.

## Test Pyramid Guidelines
- **Unit Tests**: Test pure business logic, calculations, and domain validators in isolation.
- **Integration Tests**: Verify interaction between application services, repositories, and real databases/caches.
- **API Tests**: Verify HTTP status codes, error payloads, and endpoint contracts against `.spec/api.md`.
- **E2E Tests**: Test critical end-to-end user workflows.

## Principles
1. **Behavior Over Coverage Percentage**: Write tests that verify real user stories and edge cases rather than gaming coverage metrics.
2. **Deterministic & Isolated**: Tests must not rely on external network dependencies or unseeded local state. Clean up test data after execution.
3. **Regression Testing**: Whenever fixing a bug, write a reproducing test first before applying the fix.
