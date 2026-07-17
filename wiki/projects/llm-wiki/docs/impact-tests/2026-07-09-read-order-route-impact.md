# Impact Test: Real-Repo Read-Order Route Change

Date: 2026-07-09
Test id: IMPACT-READ-ORDER-001
Status: pass

## Question

If the canonical real-repo read order changes to include the workflow catalog
and `real-repo-work.workflow.md`, does `change_impact_map.md` identify the
downstream docs that must be checked?

## Fixture

Real evidence:

- Before/drift:
  `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260707-2217/U17-phase-1-effectiveness-evaluation-result.md`
- After/fix:
  `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260707-2217/U17-WORKFLOW-DRIFT-013-result.md`

Known drift:

```text
agents/OPERATING_GUIDE.md omitted:
  /home/admindebian/LLM-Wiki/workflows/catalog.md
  /home/admindebian/LLM-Wiki/workflows/real-repo-work.workflow.md
```

Expected route:

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

## Procedure

1. Classify the change type.
   Result: `Workflow route/read-order change`.

2. Read the map row for that change type.
   Result: the row names workflow files, LLM-Wiki projections, repo
   projections, workflow-contract fixtures, and validation evidence.

3. Apply the read-order route dependency chain.
   Result: the chain includes repo `AGENTS.md`, repo `REPO_RULES.md`, repo
   `TICK.md`, and repo `agents/OPERATING_GUIDE.md or equivalent`.

4. Compare with U17 drift.
   Result: the map would have directed the evaluator to inspect
   `agents/OPERATING_GUIDE.md`, which is where the actual drift was found.

## Result

Pass. The impact map identifies the downstream artifact that drifted in U17:

```text
<repo>/agents/OPERATING_GUIDE.md or equivalent
```

It also identifies the experiment artifacts that need checking after such a
change:

```text
workflow-contract JSON
workflow-contract fixtures
empirical evaluation report template
```

## Gaps Found

- The map is still manual; it does not prove all active repos were checked.
- The map names classes of repo files, not an inventory of every repo currently
  using the route.
- A future checker would need a repo registry or explicit rollout list before
  claiming full coverage.

## Follow-Up

Before automation, add a no-drift case using the fixed U17 route and a
maintenance-cost case that counts how many artifacts change after a real
workflow edit.

