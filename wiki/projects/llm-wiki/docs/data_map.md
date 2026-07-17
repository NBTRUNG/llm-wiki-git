---
type: Data Map
project: LLM-Wiki
status: active
date_updated: 2026-07-10
---

# Data Map

This data map traces the evidence-auditor workflow from business workflow to
canonical source files, derived machine-readable data, and audit artifacts.

## Data Entities

| data id | workflow | logical entity | canonical source | derived output | owner | sensitivity |
| --- | --- | --- | --- | --- | --- | --- |
| DATA-LLMWIKI-TEST-ROW | WF-LLMWIKI-EVIDENCE-001 | test matrix row | `wiki/projects/llm-wiki/docs/test_matrix.md` | `test_matrix_rows.jsonl` | LLM-Wiki | internal |
| DATA-LLMWIKI-VALIDATION-REPORT | WF-LLMWIKI-EVIDENCE-001 | validation report | `reports/validation/*.md` | `validation_reports.jsonl` | LLM-Wiki | internal |
| DATA-LLMWIKI-EVIDENCE-LINK | WF-LLMWIKI-EVIDENCE-001 | evidence path from test matrix | `wiki/projects/llm-wiki/docs/test_matrix.md` | `audit_findings.jsonl` when inconsistent | LLM-Wiki | internal |
| DATA-LLMWIKI-SNAPSHOT | WF-LLMWIKI-EVIDENCE-001 | raw snapshot | selected source files | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/snapshots/<timestamp>/` | Agent Platform | internal |
| DATA-LLMWIKI-MANIFEST | WF-LLMWIKI-EVIDENCE-001 | raw manifest record | generated from snapshot run | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/manifests/llm-wiki.jsonl` | Agent Platform | internal |
| DATA-LLMWIKI-WAP-PROPOSAL | WF-LLMWIKI-EVIDENCE-001 | proposed review/change | auditor findings | `/home/admindebian/Agent-Platform/wap/proposals/*.md` | Human/integration owner | internal |
| DATA-LLMWIKI-AUDIT-EVENT | WF-LLMWIKI-EVIDENCE-001 | audit event | gateway run events | `/home/admindebian/Agent-Platform/audit/events.jsonl` | Agent Platform | internal |
| DATA-LLMWIKI-IMPACT-ROW | WF-LLMWIKI-IMPACT-001 | change type to dependent artifact row | `wiki/projects/llm-wiki/docs/change_impact_map.md` | impact-test result when exercised | LLM-Wiki | internal |
| DATA-LLMWIKI-IMPACT-TEST | WF-LLMWIKI-IMPACT-001 | empirical impact test | `wiki/projects/llm-wiki/docs/impact-tests/*.md` | validation report summary | LLM-Wiki | internal |
| DATA-LLMWIKI-PROJECTION-ROW | WF-LLMWIKI-IMPACT-001 | known workflow projection instance | `wiki/projects/llm-wiki/docs/workflow_projection_registry.md` | impact-test or validation report when checked | LLM-Wiki | internal |
| DATA-LLMWIKI-RESEARCH-SOURCE | WF-LLMWIKI-KNOWLEDGE-REFRESH-001 | reviewed research source record or consulted-source log | source page/document at capture time | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/*.md` | Agent Platform | internal |
| DATA-LLMWIKI-RESEARCH-BRIEF | WF-LLMWIKI-KNOWLEDGE-REFRESH-001 | synthesized research findings and promotion decision | `reports/research/*.md` | canonical knowledge update after approval | LLM-Wiki | internal |
| DATA-LLMWIKI-CAPABILITY-PROFILE | WF-LLMWIKI-CAPABILITY-001 | frozen configuration, capability vector, tier, projection ceiling, autonomy, expiry | project `agents/<agent>/AGENT.md` Lead-owned capability envelope | `templates/agent_capability_profile.template.md` skeleton and evaluation report | Human/integration owner | internal |
| DATA-LLMWIKI-TASK-CAPABILITY-GATE | WF-LLMWIKI-CAPABILITY-001 | task minimum tier/dimensions/projection/autonomy/verifier/reviewer/fallback | active task packet | result-report capability-fit record | Task author / Lead | internal |
| DATA-LLMWIKI-CAPABILITY-EVIDENCE | WF-LLMWIKI-CAPABILITY-001 | versioned evaluation of one frozen agent configuration | project validation or agent-evaluation report | accepted profile update after human decision | Human/integration owner | internal |

## Field Trace

| field | source | derived field | notes |
| --- | --- | --- | --- |
| story/task | `test_matrix.md` matrix table | `story_task` | task ID for proof row |
| status | `test_matrix.md` matrix table | `status` | used to detect implemented rows |
| manual review | `test_matrix.md` matrix table | `manual_review` | pending implemented rows become low-severity findings |
| evidence | `test_matrix.md` matrix table | `evidence_paths` | Markdown paths extracted for existence checks |
| validation report path | `reports/validation/*.md` | `path` | indexed for link comparison |
| report checksum | `reports/validation/*.md` | `sha256` | proves what report version was indexed |
| snapshot checksum | selected source files | `sha256` in manifest | proves what the auditor saw |
| change type | `change_impact_map.md` | impact-test expected change type | selects dependent artifacts to inspect |
| dependent artifact | `change_impact_map.md` | impact-test expected dependent | used to check whether the map would catch known drift |
| projection status | `workflow_projection_registry.md` | validation report status summary | records aligned, unchecked, stale, experiment-only, or retired |
| research source path | Agent Platform project `research/*.md` | `raw_sources` or source-record reference | preserves traceability without duplicating active raw inside LLM-Wiki |
| capability tier/projection | evaluation report plus human decision | Lead-owned capability envelope and task/result fit fields | never derived from provider, parameter count, or agent self-report alone |

## Regeneration Rule

Derived JSONL files are not canonical. Regenerate them from canonical Markdown
and validation reports whenever source files change.
