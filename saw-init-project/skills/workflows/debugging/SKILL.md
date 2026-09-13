---
name: debugging
description: Systematic 9-step evidence-based debugging loop for resolving bugs and regressions.
---

# Debugging Workflow

## Purpose
Enforce a disciplined, empirical debugging loop to find and fix root causes without guessing or introducing collateral regressions.

## 9-Step Debugging Loop
1. **Reproduce**: Create a minimal, reliable reproduction test case or command.
2. **Gather Evidence**: Fetch and read full, un-truncated logs and stack traces. Never guess without reading logs.
3. **Identify Boundary**: Find the exact boundary where actual execution diverges from `.spec/` expectation.
4. **Form Hypotheses**: Form explicit, testable hypotheses based strictly on log evidence.
5. **Test Hypotheses**: Add targeted temporary logging or assertions to test the hypothesis.
6. **Identify Root Cause**: Trace upstream data flows to isolate the fundamental contract breach.
7. **Implement Minimal Fix**: Apply the smallest appropriate surgical fix addressing the root cause.
8. **Add Regression Test**: Create an automated regression test that fails without the fix and passes with it.
9. **Verify System Integrity**: Run the complete test suite to ensure no secondary failures were introduced.
