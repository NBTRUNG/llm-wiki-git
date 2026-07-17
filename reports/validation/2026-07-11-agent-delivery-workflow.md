# Validation Report: LLM-Wiki Agent Delivery Workflow

Date: 2026-07-11

## intent

Adopt one stable name and canonical definition for the six-layer model that had
previously been distributed across current-direction, Agent Platform,
source-of-truth, workflow, and MCP documents.

Human approval was explicit in the 2026-07-11 session. No separate pending WAP
proposal was required; the current instruction authorized the canonical update.

## accepted model

Canonical name:

```text
LLM-Wiki Agent Delivery Workflow
Quy trình giao việc cho Agent của LLM-Wiki
```

Layers:

```text
Evidence -> Approval -> Knowledge -> Guidance -> Orchestration -> Execution
```

## changed artifacts

Canonical:

- `wiki/knowledge/project-docs/agent_delivery_workflow.md`
- `wiki/decisions/DEC-0003-agent-delivery-workflow.md`

Navigation and knowledge indexes:

- `index.md`
- `wiki/knowledge/README.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/projects/llm-wiki/docs/project_index.md`
- `wiki/decisions/_index.md`

Projection, state, and evidence:

- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/workflow_projection_registry.md`
- `wiki/projects/llm-wiki/docs/source_inventory.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## boundary checks

| Contract | Result | Evidence |
| --- | --- | --- |
| Agent Platform remains owner of active raw/evidence, WAP, gateway runtime, and audit | pass | canonical guide layer table; existing Agent Platform checkpoint unchanged |
| LLM-Wiki remains owner of reusable knowledge and shared workflows | pass | canonical guide source-of-truth section |
| Real repos remain owner of live state and project-specific workflows | pass | canonical guide shared/repo-local composition rule |
| MCP is a runtime capability adapter, not workflow/source/business-logic authority | pass | canonical guide MCP boundary |
| API Gateway remains future and ROI-gated | pass | canonical guide gateway/API evolution section |
| Small projects are not forced to create API/MCP/database infrastructure | pass | canonical guide small-project mode |
| Measurements are captured during execution and human acceptance is added after handoff | pass | canonical guide evaluation contract |
| No UniversityWeb-U17 source or repo-state file was changed | pass | change scope limited to `/home/admindebian/LLM-Wiki` |

## change-impact review

`change_impact_map.md` classified this as a canonical knowledge,
source-of-truth-boundary summary, and navigation change.

Direct projections were updated in the root index and current-direction map.
The LLM-Wiki projection registry now records the canonical baseline and both
known summaries. No real-repo backfill was performed because the new guide
links and consolidates existing source ownership without changing U17's active
read order or task rules.

## validation

Required checks:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

Documentation-only change; no application build or runtime smoke is required.

## residual risk and revision trigger

- The first U17 small-UI task set has not yet measured process overhead.
- Gateway API, database-backed raw storage, Agent Platform MCP runtime, and
  persistent workers are explicitly not implemented.
- Review the model after the U17 pilot or when one of those runtime components
  is proposed.
