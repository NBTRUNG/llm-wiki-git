# REPO_RULES

Guide before filling: `wiki/knowledge/coding/agent-coding-workflow.md`

This is the short mandatory rule file for agents working in this repo.

## Source Of Truth

1. Current user/Codex assignment.
2. Safety/privacy constraints.
3. `AGENTS.md`.
4. `REPO_RULES.md`.
5. Lead state file (`LEAD_STATE.md`, `AI_CODEX.md`, or equivalent) for Lead work only.
6. Assigned agent control card (`agents/<agent>/AGENT.md`) for delegated work.
7. Repo docs listed in the task `Required read files`.
8. Existing code and config.

## Capability Gate

- Canonical rule:
  `${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/project-docs/agent_capability_tiers.md`.
- Use only the Lead-assigned tier, domain qualifications, autonomy, and context
  projection. Unrated/expired configurations are `C0`.
- The task minimum and every required capability dimension must fit before
  broad reading, tool use, or implementation.
- An agent may self-downgrade but may not self-upgrade or edit its capability
  evidence. On mismatch, stop for a smaller packet, deterministic support, or
  higher-tier/human handoff.

## Human-Agent Hybrid Baseline

- Canonical rule:
  `${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/project-docs/human_agent_hybrid_control.md`.
- Human/Lead/integration owner retains intent, risk appetite, consequential
  permission, accountability, and acceptance.
- Agent retains bounded analysis/execution, verification support, uncertainty
  disclosure, and evidence; it must not push routine qualified work back to the
  human merely to avoid ownership.
- Keep capability, autonomy, permission, impact, and reversibility separate.
- Consequential or hard-to-reverse actions require a human-owned gate at the
  action boundary. Done still requires outcome evidence and substantive review.
- Do not claim runtime interruption, identity, audit immutability, or rollback
  unless the repo has implemented and verified those controls.

## Working Style

- Think before coding: surface unclear scope and risky assumptions.
- Simplicity first: use the smallest clear change that satisfies the task.
- Surgical changes: touch only allowed targets and match existing style.
- Goal-driven execution: define success criteria and verify before reporting done.

## Bounded Change Profile

For small, clear, low-risk tasks, use the shared Bounded Change Fast Path only
through this repo's profile. Do not invent separate Tiny UI/API/Data workflows.

- Shared invariant:
  `${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/project-docs/bounded_change_fast_path.md`
- Repo profile: `<repo-path-to-bounded-change-profile.md>`
- If no repo profile exists, use standard Real Repo Work unless the task packet
  supplies an approved bounded projection.
- A local profile may be stricter but may not weaken shared escalation,
  security, source-of-truth, or evidence rules.

## Operating Capsules

These capsules are mandatory short rules. They exist so agents do not need to
read all of LLM-Wiki for every task, but also do not operate from vague memory.
Task packets may require one or more capsules by name.

For coding sessions, agents first check capability fit. Eligible `P2` agents
read the canonical full Coding Pack once; `P0/P1` agents use only the approved
task-named projection. Qualified bounded `C2-C3` tasks use the shared
`P1-BOUNDED-CODING`; repo capsules remain local coordinates and stricter rules,
not project-specific Coding Pack projections:

```text
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/project-docs/agent_session_packs.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/bounded-coding-core.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/agent-coding-workflow.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/karpathy-guidelines.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/repo-code-rules.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/code-quality.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/output-quality.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/security-baseline.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/testing-strategy.md
```

Do not re-read the assigned pack/projection per micro-task unless the session was interrupted,
handed to a new agent, the pack changed, or exact wording is needed.

Every coding result must report security impact. The Security Baseline is
always part of the Coding Pack. Use the Security Deep Pack from
`agent_session_packs.md` when the task touches auth, permissions, sensitive
data, secrets, uploads, callbacks, deployment, dependencies, raw SQL/HTML,
external services, or performance/security trade-offs.

### Code Capsule

- Define the invariant or expected postcondition before editing non-trivial code.
- Use existing repo helpers/services/contracts before inventing new ones.
- Keep behavior in one source of truth; do not duplicate filtering, parsing,
  fallback, media, or mapping logic across view/service/diagnostic paths.
- Catch specific expected failures or document/log an intentional fallback.
- Verify with the smallest relevant build/test/manual check before handoff.

### UI Capsule

- Identify canonical route/workflow/contract docs before changing UI behavior.
- Keep template/markup, CSS, client state, and API/data rules separated unless
  the task explicitly allows a fused surface.
- Preserve accessibility basics: semantic controls, labels, keyboard access,
  focus visibility, responsive states, and no text overlap.
- For UI-heavy repos, read the relevant `ui_map/` section named by the task, not
  the whole UI map.

### API/Service Capsule

- Public inputs are boundary inputs: validate, normalize, and return predictable
  errors/results.
- DTO/API routes are contracts; do not change them unless the task says so.
- Keep cache keys explicit and debuggable.
- Keep data/CMS fallback logic in services/adapters rather than views/templates.

### Data Capsule

- Start data/backend/migration/import/reporting work from `docs/data_map.md`,
  not from broad database or repo grep.
- Follow the map coordinates: workflow ID -> code-map ID -> data-map ID -> raw
  inventory/query anchor.
- Open `docs/database_inventory.md` only by the anchor named in the task or data
  map; do not read a full schema dump by default.
- Keep field mappings one-to-one where practical: logical field -> source
  alias/column -> code property/DTO -> raw table/column -> type.
- Use LLM-Wiki data/security/rollback knowledge only when the map trigger
  applies; ordinary data reads should be solved from repo maps and code.
- Load the Data Knowledge Pack from `wiki/knowledge/data/README.md` when
  choosing storage/database, changing data ownership/model/schema, planning
  migration/backfill/import, or reviewing data performance/scale.
- Load the Algorithms Pack from `wiki/knowledge/algorithms/README.md` when
  selecting algorithms, proving complexity/correctness, optimizing hot paths,
  or implementing search/ranking/matching/scheduling/parsing/numerical logic.

### Architecture Capsule

- Use the repo's accepted architecture before consulting generic patterns.
- Do not add a new framework, service, package, cross-cutting abstraction, or
  architecture style without an explicit task/ADR path.
- For monoliths, prefer clear in-repo module boundaries before distribution.
- Record meaningful architecture/security/product trade-offs in decisions/ADRs.

### Security Capsule

- Treat public/API/CMS/user inputs as untrusted until validated or normalized.
- Do not add login, upload, payment, permission, external callback, or sensitive
  data flows unless the task explicitly allows them.
- Do not introduce `innerHTML`, raw HTML rendering, SQL string interpolation,
  broad CORS, public secrets, or external scripts/CDNs without a security reason
  and review path.
- Preserve existing auth, authorization, validation, encoding, and environment
  guards unless the task explicitly changes them.

### Output Quality Capsule

- Prove the delivered behavior against the task's exact output and acceptance
  criteria; do not report done because code was edited.
- Check design/boundary fit: the behavior belongs in the edited layer/module and
  uses the repo's existing source of truth rather than duplicate logic.
- Record correctness evidence for important success, empty, error, permission,
  and data-shape cases based on task risk.
- Record security/privacy impact and performance/operability impact, even when
  the answer is "no material change".
- Keep changes reviewable: one coherent unit, no unrelated formatting/refactor
  churn, and specialist review requested for security/privacy/concurrency/
  accessibility/internationalization or other areas outside the agent's scope.
- Document residual risks, skipped checks, and rollback/recovery notes for
  production-impacting changes.

## Large Surface Policy

Large files are governed by operational risk, not aesthetics. A large fused file
can remain as-is when security is verified, performance is acceptable or
improved, ownership is clear, and the file is stable.

Avoid creating new large mixed-concern files. Before adding behavior to a large
view/component/page, stop and raise a blocker or split plan when:

- one file mixes server-side data lookup, markup, CSS, and client-side JS;
- API/service/filter/formatting logic is duplicated in a view/template;
- the change would push a new file beyond about 300 lines or materially extend
  an inherited file beyond about 500 lines.

For server-rendered web apps, prefer:

```text
template/Razor = shell and semantic markup
service/API/adapter = data lookup, normalization, filtering, DTOs, fallback
CSS/static asset = presentation
JS/static asset = client state, search/filter/drawer/fetch behavior
```

If a fused surface has just fixed a performance issue, let it stabilize for the
agreed window before considering structural refactor. After stabilization,
leave it alone unless there is payoff: security issue, performance regression,
recurring bugs, difficult review/debugging, duplicate behavior drift, conflict
rate, or a new task materially extending that surface. Any extraction must keep
API routes, DTOs, visual design, copy, and user-visible behavior unchanged.

## Delegated Agent Read Order

1. `agents/<agent>/AGENT.md` capability envelope and task capability gate
2. Stop/handoff on mismatch; unrated/expired is `C0`
3. Read only assigned `P0`, `P1`, or `P2` projection
4. Full Coding Pack for eligible `P2`; approved task projection for `P0/P1`
5. Files listed in the assigned task `Required read files`

Delegated agents do not read Lead state, repo-wide rollups, or per-agent
task/status/archive files by default.

Delegated agents report to the review target named in their `AGENT.md`
`Coordination mode`. Human-orchestrated work reports directly to the named
human review target and waits for an integration owner before merge or rollup.

In Human-orchestrated mode, shared-file writes are allowed only with explicit
shared-file write delegation in `AGENT.md`: file, section/rows, operation, lock
owner, review target, and rollback note. Without that delegation, shared
rollup/contract/status files remain forbidden.

If agents propose edits to the same section/row, store proposals in Markdown
handoffs/reports and let the integration owner merge. Retired cache/index
systems must not be used as the draft content store.

## LLM-Wiki Lookup Rule

The active repo is the source of truth. LLM-Wiki is a reference knowledge base only.

Before consulting LLM-Wiki, use `docs/knowledge_lookup_metric.md` if this repo has it.

Agents must record the lookup score in their task result report when the task involves architecture, scope, contracts, security, production, deployment, dependencies, external services, or reusable blueprints.

## Knowledge Pack Gate

Every session starts with Repo Base. Code-facing sessions load the full Coding
Pack once. Other LLM-Wiki packs are trigger-based through:

```text
/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/agent_session_packs.md
```

Required trigger checks:

- Web/UI Pack for UI, route, layout, accessibility, visual quality, or frontend
  performance work.
- Contracts Pack for APIs, DTOs, route contracts, CMS fields, events, external
  integrations, permissions, or cross-module data behavior.
- Data / Database Map Pack for database, CMS schema, imports/exports, raw SQL,
  reporting, migration/backfill, or data correctness.
- Data Knowledge Pack for storage/schema/migration/import architecture,
  ownership, modeling, or scale posture.
- Algorithms / Math Pack for search, ranking, matching, parsing, deduplication,
  optimization, scheduling, hot paths, numerical, statistical, or ML-evaluation
  behavior.
- Architecture Decision Pack for module boundaries, major dependencies,
  platform/deployment shape, ADRs, or architecture posture.
- Operations / Release Pack for deployment, rollback, observability, runtime
  config, incidents, release readiness, or test-server rollout.
- Security Deep Pack for auth, authorization, private data, uploads, secrets,
  cookies/sessions, CORS/CSP, raw SQL/HTML, external scripts, dependencies, or
  new trust boundaries.

Result reports must record packs loaded and LLM-Wiki knowledge effectiveness:

```text
/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/knowledge_effectiveness.md
```

If required knowledge is missing, stale, or unclear, report the gap and queue
file-back through the post-task distillation gate instead of silently working
from memory.

## TICK / Claim Rule

If this repo has `TICK.md`, read it before implementation to confirm current
task, intent, context, knowledge route, and active claims.

When `TICK.md`, `docs/tasks.md`, or the task packet has claim fields:

- claim before implementation;
- do not work on another active session's claim;
- release when done, blocked, paused, or reassigned;
- ask the human, Lead, or integration owner to resolve stale or conflicting
  claims.

## Write Rules

- Stay inside `Allowed write targets`.
- Do not touch `Forbidden write targets`.
- Do not introduce forbidden side effects.
- Do not change shared names unless the task explicitly allows it.
- Do not update repo-wide rollup docs unless Lead, human, or integration owner
  explicitly assigns shared-file write delegation.

Default forbidden rollup docs for delegated agents:

```text
docs/tasks.md
docs/project_status.md
docs/test_matrix.md
docs/contracts.md
docs/agent_status.md
```

## Checkpoint And Reports

- Update the agent-owned checkpoint sections of `agents/<agent>/AGENT.md` after meaningful work.
- Create `reports/agent/<agent>/<task-id>-result.md` before asking for review.
- Codex/main reviews, validates, and rolls accepted state into repo-wide docs.
- After review passes and before Done, run the Post-Task Distillation Gate:
  record skipped/required, file reusable knowledge or queue deferred candidates,
  and update wikilinks/indexes when distillation is required.

## Coding Pack Rule

Use the canonical LLM-Wiki Coding Pack at session/assignment start when work is
code-facing: directly for eligible `P2`, or through the approved task-named
`P0/P1` projection. Narrow non-code exceptions:

- status/report-only work;
- catalog/index/link cleanup with no implementation guidance change;
- docs-only edits unrelated to implementation behavior;
- typo/copy fixes that do not touch behavior, contracts, UI layout, command
  semantics, or validation evidence.

If an exception starts touching behavior, tests, runtime config, security,
performance, contracts, or implementation acceptance, stop and load the
capability-appropriate projection before continuing.

Reference:

```text
/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/agent_session_packs.md
/home/admindebian/LLM-Wiki/wiki/knowledge/coding/agent-coding-workflow.md
```
