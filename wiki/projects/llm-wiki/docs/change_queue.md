---
type: Change Queue
project: LLM-Wiki
status: active
date_updated: 2026-07-10
---

# Change Queue

This queue tracks proposed changes for the LLM-Wiki evidence/test-matrix auditor
pilot. WAP proposal files remain the detailed proposal records.

## Queue

| change id | source | workflow | summary | status | proposal | decision |
| --- | --- | --- | --- | --- | --- | --- |
| CHG-LLMWIKI-2026-07-06-001 | auditor run | WF-LLMWIKI-EVIDENCE-001 | Review implemented rows with `manual review` still pending and unreferenced validation reports | proposed | `/home/admindebian/Agent-Platform/wap/proposals/2026-07-06T035039Z-llm-wiki-evidence-audit.md` | pending human review |
| CHG-LLMWIKI-2026-07-06-002 | human-requested research refresh | WF-LLMWIKI-KNOWLEDGE-REFRESH-001 | Promote current-source reusable knowledge for math, coding-agent risk, agentic retrieval, AI/RAG reliability, architecture boundaries, and model-vs-RAG rule | applied | `/home/admindebian/Agent-Platform/wap/proposals/2026-07-06-knowledge-refresh-math-coding-algorithms-system-architecture-rag.md` | applied from direct user instruction; future refreshes require proposal-before-publish unless explicitly approved |
| CHG-LLMWIKI-2026-07-06-003 | platform migration | WF-LLMWIKI-SOT-001 | Move Agent Platform runtime out of LLM-Wiki into `/home/admindebian/Agent-Platform` with raw namespaced under `raw/projects/<project-id>/` | applied | `reports/validation/2026-07-06-agent-platform-externalization.md` | applied from direct user instruction |
| CHG-LLMWIKI-2026-07-10-004 | direct human boundary correction | WF-LLMWIKI-SOT-001 | Move active LLM-Wiki research source records to Agent Platform and classify local `raw/` as legacy-only | applied | `wiki/decisions/DEC-0002-agent-platform-owns-active-raw.md` | accepted and applied from direct user instruction; validated by LLMWIKI-079 |
| CHG-LLMWIKI-2026-07-10-005 | direct human agent-rule request | WF-LLMWIKI-KNOWLEDGE-REFRESH-001 | Require every substantive recommendation to state mathematical pros/cons, baseline, uncertainty, and sensitivity | applied | `reports/validation/2026-07-10-raw-boundary-recommendation-tradeoffs.md` | applied from direct user instruction |
| CHG-LLMWIKI-2026-07-10-006 | direct human capability-routing request | WF-LLMWIKI-CAPABILITY-001 | Add evidence-backed `C0-C6` capability envelopes and `P0-P2` knowledge projections so lower agents cannot enter higher-autonomy flows | applied | `reports/research/2026-07-10-agent-capability-tier-routing.md`; `wiki/projects/llm-wiki/docs/decisions.md#adr-0008-route-agents-by-evaluated-capability-envelope-and-knowledge-projection` | applied from direct user acceptance; validated by LLMWIKI-080 |

## Status Values

| status | meaning |
| --- | --- |
| proposed | proposal exists, not accepted |
| accepted | human/integration owner approved |
| rejected | human/integration owner rejected |
| applied | accepted proposal was applied to source-of-truth |
| superseded | replaced by a newer proposal |

## Rules

- Do not treat a queue row as accepted source-of-truth.
- Apply changes only after approval.
- Link any applied change to validation evidence and an audit event.
