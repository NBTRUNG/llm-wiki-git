# Validation Report: Knowledge Cache Discipline

Date: 2026-07-08

## scope

Implemented LLMWIKI-069: add a reusable knowledge-cache discipline for agents.

The rule keeps a mandatory base literacy layer active, uses maps before details,
loads specialist/depth packs only when triggered, asks agents to state the
active knowledge set, and releases stale task knowledge when the goal changes.

It also records the preferred agent model as generalist plus conditional depth:
one mapped agent can work across domains when it knows when to activate deeper
packs and when human/Lead review is required.

## changed files

- `wiki/knowledge/project-docs/knowledge_cache_discipline.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/knowledge/README.md`
- `harness/read-workflow.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## contract checks

| contract | result | evidence |
| --- | --- | --- |
| Guide defines base literacy, map-first lookup, load-on-demand, active knowledge set, and release-on-goal-change | pass | `wiki/knowledge/project-docs/knowledge_cache_discipline.md` |
| Guide keeps mandatory base packs separate from conditional specialist depth | pass | `knowledge_cache_discipline.md`; `agent_session_packs.md` |
| Session pack guidance links to cache discipline and active knowledge set rules | pass | `wiki/knowledge/project-docs/agent_session_packs.md` |
| Read workflow clarifies minimal reads still need base literacy | pass | `harness/read-workflow.md` |
| Knowledge indexes link the new guide | pass | `wiki/knowledge/project-docs/README.md`; `wiki/knowledge/README.md` |
| Live state updated, not report-only | pass | `active.md`; `TICK.md`; `tasks.md`; `test_matrix.md`; `reports/validation/README.md` |

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 1 warning(s)
```

Warning:

```text
raw holding areas contain 2 file(s); review queue/evidence gate before filing
```

This warning is inherited from the source records intentionally placed under
`raw/research/` in LLMWIKI-068.

## closeout

Next step: evaluate U17 with this discipline in mind. A good session should
start from base literacy, name triggered packs, avoid loading unrelated
knowledge, and release stale pack context when the task goal changes.
