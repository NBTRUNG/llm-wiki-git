# U17 Read-Order Drift Fixture

Source:
`/home/admindebian/UniversityWeb-U17/reports/agent/session-20260707-2217/U17-phase-1-effectiveness-evaluation-result.md`

## Expected Route

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

## Drifted Route

The subordinate `agents/OPERATING_GUIDE.md` Standard Read Order omitted:

```text
/home/admindebian/LLM-Wiki/workflows/catalog.md
/home/admindebian/LLM-Wiki/workflows/real-repo-work.workflow.md
```

## Manual Check Result

The real-repo-work contract drift check
`read-order-includes-workflow-route` catches this fixture because
`workflows/catalog.md` and `workflows/real-repo-work.workflow.md` are required
tokens in `must_include` but absent from the drifted route.

The remediation named by the contract matches the U17 fix recorded in:

`/home/admindebian/UniversityWeb-U17/reports/agent/session-20260707-2217/U17-WORKFLOW-DRIFT-013-result.md`

