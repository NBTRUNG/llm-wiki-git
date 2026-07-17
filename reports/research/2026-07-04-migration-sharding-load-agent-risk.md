# research brief

Topic: Migration, sharding, load balancing, and agent coding risk knowledge refresh
Date: 2026-07-04
Owner: Codex
Cadence reason: ad hoc
Status: promoted

## decision need

- What decision or guideline may change: strengthen reusable knowledge for data
  migration proof, sharding/partitioning, load balancing, Math Pack routing,
  and AI coding-agent risk reporting.
- Target docs if promoted:
  - `wiki/knowledge/data/migrations-operations.md`
  - `wiki/knowledge/data/performance-scale.md`
  - `wiki/knowledge/reliability-sre/capacity-performance.md`
  - `wiki/knowledge/platform-infrastructure/networking-edge.md`
  - `wiki/knowledge/operations/rollback.md`
  - `wiki/knowledge/project-docs/platform_upgrade.md`
  - `wiki/knowledge/math/README.md`
  - `wiki/knowledge/coding/agent-coding-risks.md`
  - `wiki/knowledge/project-docs/agent_session_packs.md`
  - `templates/agent_result_report.template.md`

## sources checked

| Source | Type | Date published/accessed | Relevance | Notes |
| --- | --- | --- | --- | --- |
| https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Validating.html | official/vendor | accessed 2026-07-04 | migration validation | AWS DMS validates source/target rows, reports validation states/failures, and notes validation load/cutover use cases. |
| https://learn.microsoft.com/en-us/azure/architecture/best-practices/data-partitioning | official/vendor | accessed 2026-07-04 | partitioning/sharding | Azure guidance covers horizontal/vertical/functional partitioning, shard-key choice, hot partitions, rebalancing, and online/offline migration. |
| https://learn.microsoft.com/en-us/azure/architecture/patterns/sharding | official/vendor | accessed 2026-07-04 | sharding pattern | Used to confirm sharding as an architecture pattern with routing and operational complexity. |
| https://cloud.google.com/load-balancing/docs/choosing-load-balancer | official/vendor | accessed 2026-07-04 | load balancer selection | Google Cloud frames load balancer choice by traffic type, external/internal, global/regional, proxy/passthrough, and backend model. |
| https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview | official/vendor | accessed 2026-07-04 | load balancer choice | Azure provides load-balancing option framing by traffic and layer. |
| https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html | official/vendor | publication date 2024-11-06, accessed 2026-07-04 | reliability | Used as reliability/source context for capacity, change management, and failure recovery framing. |
| https://genai.owasp.org/llm-top-10/ | standard/project | accessed 2026-07-04 | AI/LLM app risk | OWASP 2025 list includes prompt injection, sensitive information disclosure, supply chain, excessive agency, improper output handling, and unbounded consumption. |
| https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/ | standard/project | published 2025-02-17, accessed 2026-07-04 | agentic AI risk | OWASP Agentic Security Initiative frames autonomous agent threats and mitigations. |
| https://csrc.nist.gov/pubs/sp/800/218/final | standard/government | published 2022-02, accessed 2026-07-04 | secure development | NIST SSDF supports integrating secure software practices into SDLC and reducing released vulnerabilities. |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Migration guidance should separate script execution from validation evidence, including source/target reconciliation, business invariants, and cutover/rollback limits. | high | urgent-update | production-affecting migration, backfill, import, CDC, CMS/content movement | trivial local/dev-only data reset |
| Sharding/partitioning guidance should require shard key, routing map, hot-key analysis, cross-shard policy, rebalance plan, and distribution proof. | high | candidate-update | data volume/load exceeds simpler query/index/cache/replica fixes | early CRUD systems without measured scale issue |
| Load balancing guidance should start from traffic type, public/private scope, regional/global scope, backend type, state/session need, health checks, and drain/failover. | high | candidate-update | capacity, availability, regional routing, or horizontal scale work | single-instance dev deployment |
| Math Pack should support migration sizing, reconciliation sampling, shard distribution, skew, and capacity estimates. | medium | candidate-update | estimates affect rollout risk or correctness | simple docs/status work |
| Coding agents need explicit risk reporting for context injection, excessive agency, destructive tool use, data damage, dependency/contract drift, and false evidence. | high | urgent-update | AI writes/reviews/tests/accepts repo code | non-code-facing query/report-only work |

## impact on LLM-Wiki

- Canonical docs to update: target docs listed above.
- Templates/harness files to update: `templates/agent_result_report.template.md`.
- Project docs affected: LLM-Wiki status, tasks, test matrix, active focus.
- Agent workflow affected: Coding Pack and session-pack reporting.

## proposed change

- Promote concise reusable guidance into existing knowledge files instead of
  adding vendor-specific overlays.
- Add `coding/agent-coding-risks.md` as an always-on Coding Pack file.
- Update session pack routing and result report template so agents can record
  new risks and loaded Platform/Reliability/AI/Content packs.

## validation plan

- Run `bash harness/feedback-loop-lint.sh`.
- Check links/catalogs by `rg` and file readback.

## reviewer decision

- Decision: promote
- Reason: human explicitly requested the knowledge update; official/current
  sources support concise pack-level changes.
- Validation report: `reports/validation/2026-07-04-migration-sharding-load-agent-risk.md`

## next review

- Next cadence trigger: re-check when a real project executes a production data
  migration, sharding design, load-balancer rollout, or agent-coded migration.
- Watchlist row: none added; use project-triggered current-source research.
