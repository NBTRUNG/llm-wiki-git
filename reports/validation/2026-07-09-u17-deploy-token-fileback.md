# U17 Deploy Token File-Back Validation

Date: 2026-07-09
Task: LLMWIKI-072

## Scope

File back lessons from the U17 deploy/projection-test follow-up:

- deployment agents must check prior local reports and LLM-Wiki case notes
  before rediscovering known publish fixes;
- the U17 .NET 10 publish workaround
  `DisableTransitiveProjectReferences=true` should be treated as a bounded
  known probe;
- workflow projection reports should not label `unchecked but aligned`
  registry metadata as a false positive drift.

## Evidence

- `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260708-2257/U17-DEPLOY-SERVER-014-result.md`
- `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260709-impact/U17-read-order-no-drift-result.md`
- User-reported token usage:

```text
total=346,798
input=314,399 (+ 7,222,912 cached)
output=32,399
reasoning=10,641
```

## Files Changed

- `wiki/knowledge/operations/deployment-diagnostics.md`
- `wiki/knowledge/agent-errors/universityweb-u17-publish-token-overuse.md`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/templates/empirical-evaluation-report.template.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## Validation

- Deployment diagnostics now has a prior-fix lookup step before expensive
  publish diagnostics.
- U17 publish token-overuse case now records the later deploy result, the
  `DisableTransitiveProjectReferences=true` workaround, and the user checkpoint
  failure mode.
- Empirical report template distinguishes `registry metadata stale` from false
  positive drift.

## Verdict

Pass. Future deploy agents should search prior U17 reports and LLM-Wiki case
notes before repeating broad diagnostics for known publish failures.

