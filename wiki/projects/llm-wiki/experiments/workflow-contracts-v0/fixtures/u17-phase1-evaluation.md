# U17 Phase 1 Evaluation Fixture

Source:
`/home/admindebian/UniversityWeb-U17/reports/agent/session-20260707-2217/U17-phase-1-effectiveness-evaluation-result.md`

## Reduced Findings

- Phase 1 workflow routing passed with one small U17 documentation drift.
- `AGENTS.md`, `REPO_RULES.md`, `TICK.md`, and the LLM-Wiki catalog agreed that
  real repo work starts at the repo entry file, routes through the workflow
  catalog and `real-repo-work.workflow.md`, then returns to repo
  source-of-truth files.
- `agents/OPERATING_GUIDE.md` had a shorter Standard Read Order that omitted
  `workflows/catalog.md` and `workflows/real-repo-work.workflow.md`.
- Recommended remediation was to update the operating guide read order to:

```text
AGENTS.md
-> /home/admindebian/LLM-Wiki/workflows/catalog.md
-> /home/admindebian/LLM-Wiki/workflows/real-repo-work.workflow.md
-> REPO_RULES.md
-> TICK.md
-> agents/OPERATING_GUIDE.md
-> assigned task packet in docs/tasks.md
-> Required Read Files
```

## Contract Test Use

This fixture checks whether the real-repo-work contract can name the required
read-order route and remediation without copying the full workflow runbook.

