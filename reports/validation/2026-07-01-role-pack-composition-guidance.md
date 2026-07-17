---
name: role-pack-composition-guidance
description: Validation record for adding role-pack composition guidance to LLM-Wiki.
date_updated: 2026-07-01
status: accepted
---

# Role Pack Composition Guidance Validation

## Scope

Added reusable guidance for composing skills, knowledge packs, domain packs,
security/privacy rules, source freshness, and formal/math knowledge into
role-based agents.

This is planning/governance guidance only. No domain pack such as customs/tax
and no math pack was created in this pass.

## Decision

Use this model:

```text
Skill = workflow / procedure
Knowledge Pack = reusable knowledge
Role Pack = composed role: required packs + domain boundaries + freshness rules
Project docs = source of truth for the active project
```

Role packs are appropriate when the same cross-domain role recurs across
projects, such as customs technology agent, tax technology agent, education
platform agent, CMS content agent, or AI/RAG product agent.

Mathematics should support coding and algorithms as formal/analytical knowledge
when a task needs proof, complexity, probability/statistics, optimization,
numerical precision, evaluation, or domain calculations. A future `math/` pack
is recommended, but not created until there is a concrete trigger.

## Updated

- `wiki/knowledge/project-docs/role_packs.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `wiki/knowledge/README.md`
- `TICK.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## Validation

- LLM-Wiki lint/link check: `bash harness/feedback-loop-lint.sh` passed with
  0 failures and 0 warnings.
