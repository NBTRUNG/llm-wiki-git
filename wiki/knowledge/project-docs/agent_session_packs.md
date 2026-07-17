---
name: agent-session-packs
description: Canonical packing lists for agent sessions. Defines required and conditional knowledge packs by work type, with always-on security baseline and trigger-based deep security review.
date_ingested: 2026-06-27
status: active
---

# agent session packs

## purpose

Use this guide when assigning, starting, or reviewing an agent session.

An agent pack is the bounded set of repo files and LLM-Wiki knowledge a session
must load before work. Packs prevent two failure modes:

- reading too little and missing required behavior, security, or proof rules;
- reading the whole wiki and losing the Token Economy benefit.

Agent skill files should not duplicate this knowledge. Skills should classify
the session type, load the relevant pack from this file, report what was loaded,
and stop when a required pack is missing or conflicts with the active repo.

For domain-heavy work, use [role_packs.md](role_packs.md) to compose delivery
packs with domain knowledge, security/privacy rules, source freshness, and
human expert escalation. Role packs do not replace the session packs below;
they declare which packs a role normally loads.

For cache/context control, use
[knowledge_cache_discipline.md](knowledge_cache_discipline.md): agents keep a
mandatory base literacy layer, load conditional packs by trigger, state the
active knowledge set, and release stale knowledge when the goal changes.
When the work-unit context pilot is explicitly enabled, also use
[work_unit_context_budget.md](work_unit_context_budget.md) for provider-counter
semantics, file-backed checkpoints, and provisional warning/restart signals.

Before selecting packs, apply
[agent_capability_tiers.md](agent_capability_tiers.md). Capability routing
decides whether the agent receives a `P0 Capsule`, `P1 Bounded Packet`, or `P2
Map-First` projection and which autonomy ceiling applies.

## pack rules

- Every session uses the default
  [Human-Agent Hybrid Control](human_agent_hybrid_control.md) baseline. Human
  intent/judgment/permission/acceptance and agent analysis/execution/evidence
  remain coupled; neither side may abdicate its responsibility.
- Every `P0/P1/P2` delivery preserves a named human/Lead/integration owner,
  separate capability/autonomy/permission/impact/reversibility decisions,
  explicit scope and stop conditions, a human gate for consequential actions,
  and outcome evidence before acceptance. Lower projections receive these as
  packet fields rather than reading the full guide.
- The active repo remains source of truth for current implementation state.
- Every real-repo session starts with the **Repo Base Pack** in the projection
  allowed by its capability note and task packet.
- Every code-facing session uses the canonical **Coding Pack** either directly
  or through an approved `P0/P1` projection named by the task. A lower-tier
  agent must not create its own summary or load the higher-tier full-pack flow.
  If no validated projection preserves mandatory coding/security/output/test
  rules, the lower-tier agent is not eligible for the task.
- `P1-BOUNDED-CODING` is the canonical cross-repo `P1` projection for eligible
  `C2-C3` bounded coding work. It lives at
  `wiki/knowledge/coding/bounded-coding-core.md`. Repo maps, profiles, capsules,
  or task summaries are coordinates around it, not substitutes for it.
- The Coding Pack includes the always-on **Security Baseline**.
- Trigger the **Security Deep Pack** only when security posture, sensitive data,
  trust boundaries, or risky implementation surfaces are involved.
- Add architecture, web, UI, data, contracts, and operations packs by session intent.
- Add the **AI / Agent / RAG / MCP Pack** when the session touches LLM-backed
  workflows, RAG, MCP/tool access, prompt/template behavior, generated-code
  execution, or agent-to-agent handoff.
- Add the **Agent Error / Token Budget Pack** when a task involves agent
  workflow failure, token/quota overuse, repeated grep/log loops, missed
  human checkpoints, or deciding whether internet search should have been used.
- Add the **Security Deep + Privacy Pack** when trust boundaries, sensitive
  data, privacy, identity/access, supply chain, or incident-sensitive work is
  involved.
- Add the **Platform / Infrastructure Pack** when runtime, deployment substrate,
  containers, config/secrets, networking, CI/CD, IaC, or cloud/platform
  services are changed or selected.
- Add the **Reliability / SRE Pack** when availability, latency, capacity,
  resilience, health/readiness, incident/runbook, or production operability is
  part of the task.
- Add the **Content / CMS / SEO / i18n Pack** when public content, CMS schema,
  editorial workflow, SEO, structured data, redirects, search, or multilingual
  behavior is involved.
- Add the **Data Knowledge Pack** when choosing storage or changing meaningful
  data architecture, ownership, modeling, migration, or performance posture.
- Add the **Data Knowledge Pack** plus **Math / Formal Analysis Pack** when
  migration sizing, reconciliation sampling, shard distribution, hot-key skew,
  or capacity estimates affect correctness or rollout risk.
- Add the **Algorithms / Math Pack** when selecting algorithms, proving
  complexity/correctness, optimizing hot paths, or implementing search,
  ranking, matching, scheduling, parsing, numerical, or statistical behavior.
- Add the **Math / Formal Analysis Pack** when the task needs formulas,
  invariants, probability/statistics, optimization models, vector math,
  numerical precision, domain calculations, or explicit reasoning discipline
  for definitions, assumptions, candidate-path search, backtracking,
  counterexamples, proof obligations, verifier feedback, and stop/escalation.
- Do not read unrelated packs "just in case."
- Check assigned tier, task minimum, required capability dimensions, projection,
  autonomy, verifier, and reviewer before pack loading. Missing/expired evidence
  means `C0`; mismatch means smaller packet, lower projection, tool/verifier
  support, or higher-tier handoff.
- Keep an active knowledge set: base files stay active; triggered packs stay
  active only while their task/subproblem is live.
- When the user changes goals, summarize reusable facts and release stale
  task-specific knowledge before loading the next pack set.
- When a repo entry route, workflow catalog route, or session-pack rule changes,
  check subordinate operating guides for read-order drift. At minimum compare
  the repo entry file, repo rules, current-state/TICK file, operating guide, and
  task packet instructions. The highest-priority entry may still be clear, but
  one stale subordinate guide creates avoidable ambiguity for new agents.
- Result reports must record loaded packs, security impact, and LLM-Wiki
  knowledge effectiveness when any pack or reusable guide was used.
- Result reports must record capability tier, task minimum, assigned projection,
  eligibility decision, any self-downgrade, and handoff/escalation.
- Every substantive suggestion in a result, handoff, review, or user response
  must include objective/constraints, a baseline or alternative, mathematical
  pros and cons, evidence/uncertainty, and a sensitivity or revision trigger.
  Use `wiki/knowledge/math/functions-rates-and-measurement.md` for measured or
  multi-objective comparisons; do not invent aggregate scores or weights.

## Human-Agent Hybrid Baseline

Always active for agent work. Read the full guide for `P2` architecture,
orchestration, security/trust, high-risk, autonomy, or permission decisions.
For `P0/P1`, use the validated task/control-card projection.

Required packet/result evidence for normal or high-risk work:

```text
Human sponsor and acceptance owner:
Action-risk lane:
Autonomy and permission grant:
Human approval events:
Grant expiry/review trigger:
Interrupt/stop route:
Rollback/recovery route:
Human over-delegation/rubber-stamp check:
Agent over-escalation/under-execution check:
```

The baseline does not imply a runtime identity system, kill switch, immutable
remote audit log, or policy gateway. Report those controls as manual,
unverified, unavailable, or implemented with evidence.

## Repo Base Pack

Use for every real-repo session.

Read:

```text
repo/AGENTS.md
repo/REPO_RULES.md
repo/TICK.md when present
repo/LEAD_STATE.md, AI_CODEX.md, or equivalent lead state file when doing Lead work
repo/agents/<agent>/AGENT.md when doing delegated work
current task packet or current assignment
task-specific required read files
```

Do not read full repo history, full docs folders, or unrelated LLM-Wiki
knowledge unless the task intent requires it or the Knowledge Lookup Metric
requires consultation.

When `TICK.md` or the task board has claim fields, confirm the task is unclaimed
or claimed by the current session before implementation. Release the claim when
the task is done, blocked, paused, or reassigned.

## Coding Pack

Use when the session may write, review, refactor, test, validate, or accept
repo code.

`P2 Map-First` agents read once per session or assignment:

```text
wiki/knowledge/coding/agent-coding-workflow.md
wiki/knowledge/coding/karpathy-guidelines.md
wiki/knowledge/coding/repo-code-rules.md
wiki/knowledge/coding/code-quality.md
wiki/knowledge/coding/output-quality.md
wiki/knowledge/coding/implementation-quality-matrix.md
wiki/knowledge/coding/security-baseline.md
wiki/knowledge/coding/testing-strategy.md
wiki/knowledge/coding/agent-coding-risks.md
```

Eligible `C2-C3` agents assigned the exact `P1-BOUNDED-CODING` projection read:

```text
wiki/knowledge/coding/bounded-coding-core.md
repo base in the task-assigned projection
repo-owned profile/capsules named by the task
task-specific required read files
```

This is a complete approved `P1` delivery of the Coding Pack constraints, not a
partial full-pack read. Do not create project-specific copies. Add triggered
specialist packs or hand off to `P2` when its eligibility/escalation gate fires.

The Coding Pack includes the **Security Baseline**. Every coding result must
state security impact, even when the answer is `none`.
`P0/P1` agents receive only an approved task-named projection, but that
projection must preserve Security Baseline, write boundaries, output quality,
tests/evidence, and stop/handoff rules.
It also includes **Agent Coding Risks**. Every non-trivial coding result must
state context-injection/tool/data/dependency evidence risk and whether
human/Lead review is required.
It also includes the Output Quality recommendation contract. Whenever the agent
suggests an option, it must fill the recommendation/trade-off fields even when
the Math Pack was not otherwise triggered.

## Security Baseline

Always active inside the Coding Pack.

For every coding result, report:

```text
Security impact: none | low | medium | high
Areas touched: auth | authorization | input | secrets | logging | dependencies | data | external service | config | none
Risk found: none | <summary>
Human review needed: no | yes, because <reason>
```

`none` is acceptable for a truly unrelated task, but it must be explicit.

## Security Deep Pack

Add this pack when the task touches any of these triggers:

- authentication, authorization, permissions, roles, ownership, or tenant data;
- admin paths, private data, PII, payment, upload, or external callbacks;
- secrets, tokens, cookies, sessions, CORS, CSP, headers, or production config;
- raw SQL, raw HTML, script injection, external scripts/CDNs, or deserialization;
- dependency addition/upgrade or new external service/trust boundary;
- background jobs, workers, events, or service-to-service calls that mutate state;
- performance changes that weaken validation, authorization, logging, isolation,
  rate limiting, or audit evidence.

Read:

```text
wiki/knowledge/coding/security-baseline.md
wiki/knowledge/security-privacy/README.md
wiki/knowledge/security-privacy/threat-modeling.md
wiki/knowledge/security-privacy/auth-identity-access.md when identity/session/tenant access is involved
wiki/knowledge/security-privacy/privacy-data-protection.md when PII/privacy/logging/analytics/AI context is involved
wiki/knowledge/security-privacy/supply-chain-dependencies.md when dependencies/tools/models/plugins are involved
wiki/knowledge/security-privacy/incident-response.md when detection/recovery/incident work is involved
wiki/knowledge/architecture-patterns/zero-trust-security.md
wiki/concepts/security/stride.md
wiki/concepts/security/owasp-top-10.md
repo/docs/security.md if present
repo/docs/contracts.md when API/data/boundary behavior changes
repo/docs/decisions.md when security posture changes
```

Require human review before implementation when a security trade-off changes
posture, usability, compatibility, performance, logging/audit, credential
lifetime, data exposure, or trust boundary.

## AI / Agent / RAG / MCP Pack

Use when a session touches LLM-backed features, AI agents, RAG, embeddings,
retrieval, MCP tools/resources, prompt templates, generated-code execution,
agent skills, or agent-to-agent handoff.

Read:

```text
Repo Base Pack
Coding Pack if implementation/review/test/validation is involved
Security Deep Pack when tools/data/private context/mutations are involved
wiki/knowledge/ai-agent-rag-mcp/README.md
wiki/knowledge/ai-agent-rag-mcp/okf-knowledge-substrate.md
wiki/knowledge/ai-agent-rag-mcp/rag-pipeline.md when retrieval/grounding is involved
wiki/knowledge/ai-agent-rag-mcp/retrieval-evaluation.md when RAG quality/evals are involved
wiki/knowledge/ai-agent-rag-mcp/mcp-tool-resource-contracts.md when tools/resources are involved
wiki/knowledge/ai-agent-rag-mcp/agent-protocol-boundaries.md when another agent/service is involved
wiki/knowledge/ai-agent-rag-mcp/trust-safety-permissions.md
```

AI work must report knowledge source of truth, retrieval/tool boundary,
permissions/consent, prompt/context injection risks, unsupported inference
controls, evaluation evidence, audit/privacy notes, and human approval gates.

## Agent Error / Token Budget Pack

Use when a session reviews an agent failure, token/quota issue, repeated
debugging loop, broad grep/log output problem, or missed human checkpoint.

Read:

```text
Repo Base Pack when the evidence comes from a real repo
wiki/knowledge/agent-errors/README.md
wiki/knowledge/agent-errors/internet-search-and-token-budget.md
workflows/bug-fix-investigation.workflow.md when investigating or fixing a bug
wiki/knowledge/agent-errors/incident.template.md when filing a new case
wiki/knowledge/coding/agent-coding-risks.md when tool/context risk is involved
wiki/knowledge/operations/deployment-diagnostics.md when build/publish/package/smoke troubleshooting is involved
```

Reports must include token usage when available, whether the issue exceeded the
expected budget band, whether internet search should have been used, and the
human checkpoint that should have happened.

## Web App Implementation Pack

Use for pages, routes, components, browser workflows, React/Next.js, UI state,
CSS/layout, accessibility, and frontend performance.

Read:

```text
Repo Base Pack
Coding Pack
repo/docs/design_system.md or repo/ui_map/* when present and task-relevant
wiki/knowledge/project-docs/design_system.md
wiki/knowledge/frontend/README.md
wiki/knowledge/frontend/react-performance.md when React is involved
wiki/knowledge/frontend/nextjs-performance.md when Next.js is involved
wiki/knowledge/frontend/web-vitals.md when UX/performance is affected
wiki/knowledge/ui/accessibility.md
wiki/knowledge/ui/visual-quality.md
repo/docs/test_matrix.md when proof rows must be updated
```

For UI-only copy or visual changes with no behavior, use the narrowest relevant
UI files and still report accessibility and visual validation.

## Software / Backend Implementation Pack

Use for services, APIs, jobs, integrations, domain logic, data access,
migrations, queues, and server-side behavior.

Read:

```text
Repo Base Pack
Coding Pack
repo/docs/contracts.md when API/schema/event/data contract is touched
repo/docs/data_map.md when database/CMS/import/reporting/data ownership is touched
repo/docs/database_inventory.md only by named anchor when raw schema/query verification is needed
repo/docs/decisions.md when architecture or dependency choice is touched
wiki/knowledge/contracts/README.md when integration contracts are affected
wiki/knowledge/contracts/api-design.md when API behavior changes
wiki/knowledge/contracts/data-contracts.md when data/schema/migration changes
wiki/knowledge/contracts/event-contracts.md when async events change
wiki/knowledge/architecture-patterns/pattern-selection-matrix.md only when boundary/pattern changes
```

Do not load architecture patterns for a local bug fix unless the fix changes
module boundaries, data ownership, deployment shape, or cross-boundary behavior.

For data work, start from the project data map, not from broad database grep.
The expected trace is workflow ID -> code-map ID -> data-map ID -> raw inventory
anchor. Full schema inventory is not a default read.

## Data / Database Map Pack

Use when the session touches database/CMS schema, content types, data
ownership, imports/exports, reporting, migration/backfill, ORM/entity mapping,
raw SQL, or data correctness.

Read:

```text
Repo Base Pack
Coding Pack if implementation is involved
repo/docs/data_map.md
repo/docs/code_map.md for the workflow/code IDs named by the data map
repo/docs/contracts.md or repo/ui_map/_CONTRACTS.md when shared aliases, DTOs, routes, or field contracts are touched
repo/docs/database_inventory.md only for the raw anchor named by data_map/task
wiki/knowledge/contracts/data-contracts.md when schema/field/data contract changes
wiki/knowledge/operations/rollback.md when migration/backfill/restore risk exists
wiki/knowledge/coding/security-baseline.md when sensitive/private data or raw SQL is involved
```

Do not read full raw inventories just because the project has a database. Open
only the relevant raw anchor or query. If the data map lacks the needed
workflow/entity/field mapping, mark that as a documentation gap instead of
inventing the data path from memory.

## Data Knowledge Pack

Use when the session chooses a database/storage engine, changes data ownership,
designs important data models, plans migration/backfill/restore, introduces
analytics/lake/warehouse/search/streaming storage, or reviews data performance
and scale posture.

Read:

```text
Repo Base Pack
repo/docs/data_map.md when a repo exists
repo/docs/code_map.md for workflow/code IDs named by the data map
repo/docs/contracts.md when shared schema/DTO/API/data contracts are touched
wiki/knowledge/data/README.md
wiki/knowledge/data/database-selection.md when choosing storage/database
wiki/knowledge/data/data-modeling.md when modeling entities/schema/content types
wiki/knowledge/data/data-architecture-governance.md when ownership/governance/source-of-truth is involved
wiki/knowledge/data/migrations-operations.md when migration/backfill/restore/import is involved
wiki/knowledge/data/performance-scale.md when performance, partitioning, cache, replicas, or scale are involved
wiki/knowledge/math/README.md when migration sizing, reconciliation sampling, shard distribution, or capacity math is involved
wiki/knowledge/contracts/data-contracts.md when schema/field/data contract changes
wiki/knowledge/operations/rollback.md when production data can be changed
```

For database selection, output options and trade-offs before implementation.
Do not choose a database until workflow owner, access patterns, consistency,
transaction boundary, scale, security, operations, and rollback constraints are
named.
For sharding/partitioning work, require a shard key, routing-map owner, hot-key
analysis, cross-shard query/transaction policy, rebalance plan, and
distribution proof before implementation.

## Algorithms / Math Pack

Use when the session formalizes non-trivial logic, selects or designs an
algorithm/data structure, changes or compares a performance hot path,
implements search/ranking/matching/recommendation/vector
retrieval, scheduling/routing/allocation/optimization, parsing/deduplication,
concurrency/idempotency logic, numerical precision, scoring, statistics, or ML
evaluation metrics.

Read:

```text
Repo Base Pack
Coding Pack if implementation/review/test/validation is involved
repo/docs/code_map.md for the affected workflow/code IDs when a repo exists
repo/docs/data_map.md when algorithm behavior depends on data shape or scale
wiki/knowledge/algorithms/README.md
wiki/knowledge/algorithms/algorithm-selection.md when choosing an approach
wiki/knowledge/algorithms/complexity.md when runtime/memory/scale matters
wiki/knowledge/algorithms/search-ranking-matching.md when search/ranking/matching/vector retrieval is involved
wiki/knowledge/algorithms/optimization-scheduling.md when scheduling/routing/allocation/optimization is involved
wiki/knowledge/algorithms/parsing-deduplication.md when parsing/normalization/deduplication is involved
wiki/knowledge/algorithms/numerical-statistics.md when numeric precision/scoring/statistics are involved
wiki/knowledge/data/performance-scale.md when database/query/index/cache scale is involved
```

For algorithmic work, output the problem statement, input constraints,
correctness condition, chosen approach, alternatives, complexity, edge cases,
library/custom decision, and benchmark/proof. Prefer proven libraries for
domains such as optimization, vector search, numerical linear algebra,
cryptography, date/time rules, and established parsers.

## Math / Formal Analysis Pack

Use when a task needs proof, formal reasoning, probability/statistics,
optimization, vector math, numerical precision, formula-driven domain
calculations, or explicit reasoning discipline before coding/debugging. This
pack supports Coding, Algorithms, Data, AI/RAG evaluation, and domain role
packs.

Read:

```text
Repo Base Pack
Coding Pack if implementation/review/test/validation is involved
Algorithms / Math Pack when implementation algorithm choice is involved
Data Knowledge Pack when the math depends on data shape, statistics, or domain data
AI / Agent / RAG / MCP Pack when evaluating retrieval/model quality
wiki/knowledge/math/README.md
wiki/knowledge/math/reasoning-navigation.md when the task needs method selection, bounded candidate search, verifier feedback, backtracking, or an explicit stop/escalation decision
wiki/knowledge/math/classical-mathematical-thinking.md when definitions, assumptions, hypotheses, counterexamples, or proof obligations need to be made explicit
wiki/knowledge/math/proof-techniques.md when a claim must be expressed precisely or correctness/invariants/equivalence/termination are involved
wiki/knowledge/math/functions-rates-and-measurement.md when functions, finite differences/derivatives, sensitivity, metrics, baselines, or efficiency comparisons are involved
wiki/knowledge/math/discrete-math.md when graphs/sets/counting/state machines are involved
wiki/knowledge/math/probability-statistics.md when evidence updates, metrics, experiments, evaluation, uncertainty, calibration, causal claims, or correlated trials are involved
wiki/knowledge/math/linear-algebra.md when embeddings/vectors/similarity/ranking are involved
wiki/knowledge/math/optimization.md when allocation/scheduling/routing/objectives/constraints are involved
wiki/knowledge/math/numerical-methods.md when precision/rounding/floating point/money/scoring are involved
wiki/knowledge/math/domain-calculations.md when tax/customs/finance/compliance formulas are involved
```
Math-heavy work must report the statement/decision question, definitions and
quantifiers, formula/quantity, assumptions, units, valid input range,
invariant/correctness condition, proof method or comparison design,
precision/rounding policy, counterexample search, edge cases, and test/evidence.

Pair Coding Pack and Math Pack whenever these triggers occur, regardless of
developer seniority. Keep routine code with no formal/measurement question on
the Coding-only path.
## Architecture Decision Pack

Use when choosing or changing architecture, module boundaries, service splits,
deployment shape, data ownership, major dependencies, auth/security
architecture, or platform approach.

Read:

```text
Repo Base Pack
repo/docs/architecture.md
repo/docs/decisions.md
repo/docs/contracts.md when boundary/API/data is involved
wiki/knowledge/data/database-selection.md when choosing or changing database/storage
wiki/knowledge/data/data-architecture-governance.md when data ownership/source-of-truth changes
wiki/knowledge/project-docs/architecture_skill.md
wiki/knowledge/project-docs/architecture_approach_selection.md
wiki/knowledge/architecture-patterns/pattern-selection-matrix.md
the relevant architecture pattern file(s)
wiki/knowledge/architecture-patterns/zero-trust-security.md when trust boundaries or sensitive data are involved
```

Output options and trade-offs first. Do not implement a new pattern or scaffold
an architecture before a human, Lead, or accepted ADR confirms the decision.

## Contracts Pack

Use when APIs, DTOs, schemas, events, external integrations, routes, permissions,
or data ownership contracts change.

Read:

```text
Repo Base Pack
Coding Pack if implementation is involved
repo/docs/contracts.md
repo/docs/decisions.md when contract strategy changes
wiki/knowledge/contracts/README.md
wiki/knowledge/contracts/api-design.md for API contracts
wiki/knowledge/contracts/data-contracts.md for schemas/migrations
wiki/knowledge/contracts/event-contracts.md for async/event contracts
```

Contract-changing work must report compatibility, consumer impact, validation,
and rollback or migration path.

## Operations / Release Pack

Use for deployment, CI/CD, config, observability, rollback, environment changes,
release readiness, production troubleshooting, or test-server rollout.

Read:

```text
Repo Base Pack
repo/docs/deployment.md or runbook when present
repo/docs/test_matrix.md
repo/docs/decisions.md when runtime/deployment posture changes
wiki/knowledge/operations/README.md
wiki/knowledge/operations/deployment-readiness.md
wiki/knowledge/operations/deployment-diagnostics.md when build/publish/package/smoke troubleshooting is involved
wiki/knowledge/operations/observability.md
wiki/knowledge/operations/rollback.md
wiki/knowledge/coding/output-quality.md
```

Add the Coding Pack when implementation, scripts, config, build files, or code
are changed.

## Platform / Infrastructure Pack

Use when selecting or changing runtime, deployment substrate, containerization,
networking, config/secrets, CI/CD, IaC, cloud/platform services, or public edge.

Read:

```text
Repo Base Pack
Operations / Release Pack
Coding Pack when implementation/scripts/config/build files change
Security Deep Pack when secrets, network exposure, identity, or production access changes
wiki/knowledge/platform-infrastructure/README.md
wiki/knowledge/platform-infrastructure/runtime-deployment-models.md when choosing/reviewing substrate
wiki/knowledge/platform-infrastructure/containers-runtime.md when containers/images/runtime are involved
wiki/knowledge/platform-infrastructure/configuration-secrets-environments.md when env/config/secrets are involved
wiki/knowledge/platform-infrastructure/networking-edge.md when DNS/TLS/proxy/firewall/CORS/CDN is involved
wiki/knowledge/platform-infrastructure/cicd-iac.md when pipeline/IaC/deploy automation is involved
```

Load vendor/technology overlays such as SQL Server, Linux, Windows Server, AWS,
Azure, GCP, Docker, or Kubernetes only when the active project uses that stack
and a corresponding overlay exists.

## Reliability / SRE Pack

Use when the task affects availability, latency, error rates, capacity,
resilience, graceful degradation, health/readiness, incidents, or production
supportability.

Read:

```text
Repo Base Pack
Operations / Release Pack
wiki/knowledge/reliability-sre/README.md
wiki/knowledge/reliability-sre/slo-sli-error-budgets.md when reliability targets are involved
wiki/knowledge/reliability-sre/health-readiness.md when health/readiness/smoke checks are involved
wiki/knowledge/reliability-sre/resilience-patterns.md when retries/timeouts/queues/fallbacks are involved
wiki/knowledge/reliability-sre/capacity-performance.md when load/capacity/performance limits are involved
wiki/knowledge/platform-infrastructure/networking-edge.md when load balancing, public edge, DNS/TLS/proxy, or traffic routing is involved
wiki/knowledge/reliability-sre/incident-runbooks.md when incident/runbook work is involved
```

Load-balancing work must report traffic type, public/private scope,
regional/global scope, backend type, health check, connection draining,
session-state requirement, bottleneck, and rollback/traffic-shift path.

## Content / CMS / SEO / i18n Pack

Use when the task affects public content, CMS schema/content types, editorial
workflows, metadata, SEO, structured data, redirects, internal/public search,
or multilingual/localized behavior.

Read:

```text
Repo Base Pack
Data / Database Map Pack when CMS schema/content/data movement is involved
Web App Implementation Pack when routes/templates/UI are involved
wiki/knowledge/content-cms-seo-i18n/README.md
wiki/knowledge/content-cms-seo-i18n/content-modeling.md when CMS/content schema is involved
wiki/knowledge/content-cms-seo-i18n/editorial-workflows.md when authoring/publish workflow is involved
wiki/knowledge/content-cms-seo-i18n/seo-metadata-structured-data.md when indexing/metadata/structured data is involved
wiki/knowledge/content-cms-seo-i18n/i18n-localization.md when multilingual/localized behavior is involved
wiki/knowledge/content-cms-seo-i18n/content-migration-search.md when content migration/redirect/search is involved
```

## result-report requirement

Every non-trivial result report should include:

```text
Packs loaded:
- Repo Base: yes | no | n/a
- Coding: yes | no | n/a
- Security Baseline: yes | no | n/a
- Security Deep: yes | no | n/a
- Web/UI: yes | no | n/a
- Architecture: yes | no | n/a
- Contracts: yes | no | n/a
- Data map: yes | no | n/a
- Data Knowledge: yes | no | n/a
- Algorithms/Math: yes | no | n/a
- Platform/Infrastructure: yes | no | n/a
- Reliability/SRE: yes | no | n/a
- AI/Agent/RAG/MCP: yes | no | n/a
- Operations: yes | no | n/a
- Content/CMS/SEO/i18n: yes | no | n/a

Security impact:
Areas touched:
Risk found:
Human review needed:

Agent coding risk:
Context injection/tool risk:
Data/migration risk:
Dependency/contract risk:
Evidence gap:
Human/Lead review needed:

LLM-Wiki knowledge effectiveness:
- Packs used:
- Most useful file(s):
- What changed because of the knowledge:
- Usefulness score:
- Missing/stale/unclear knowledge:
- Improvement action:
```

If a required pack was not loaded, mark the report `blocked` or `needs-review`
instead of pretending the work is complete.

## relationship to LLM-Wiki

- Coding Pack: [[../coding/agent-coding-workflow.md]]
- Frontend knowledge: [[../frontend/README.md]]
- UI knowledge: [[../ui/README.md]]
- Architecture patterns: [[../architecture-patterns/README.md]]
- Contract knowledge: [[../contracts/README.md]]
- Operations knowledge: [[../operations/README.md]]
- Knowledge effectiveness reports: [[knowledge_effectiveness.md]]
- Result report template: [[../../../templates/agent_result_report.template.md]]
