# ADR-001: Baseline Modular AI Engineering Context System

**Status:** Accepted
**Date:** YYYY-MM-DD
**Deciders:** Engineering Team / AI Agent

## Context & Problem Statement
Monolithic context files (such as single `AGENTS.md` or `README.md` documents containing hundreds of lines of specs, schemas, and guidelines) overwhelm LLM context windows, cause attention degradation, produce hallucinated facts, and lead to fragile file-editing diffs.

## Decision
Establish the Modular AI Engineering Context System:
1. `.spec/` directory structured by component domains (`requirements/`, `architecture/`, `api/`, `data-model/`, `development/`, `decisions/`, `plans/`).
2. Every component directory contains a `README.md` navigation map for progressive disclosure.
3. `.agents/AGENTS.md` functions strictly as a concise constitution directing agents to `.spec/` and global persistent skills.

## Alternatives Considered
- Monolithic `AGENTS.md`: Low discoverability, rapid context exhaustion.
- Flat `.spec/*.md`: Unscalable as individual specs expand over time.

## Consequences
- Positive: Minimal token overhead, targeted retrieval, surgical file edits, modular growth.
- Negative: Requires adhering to directory structure conventions and keeping index tables synchronized.

## Related Specifications
- `.spec/README.md`
- `.spec/architecture/overview.md`
