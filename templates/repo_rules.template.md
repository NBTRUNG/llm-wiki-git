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

## Working Style

- Think before coding: surface unclear scope and risky assumptions.
- Simplicity first: use the smallest clear change that satisfies the task.
- Surgical changes: touch only allowed targets and match existing style.
- Goal-driven execution: define success criteria and verify before reporting done.

## Operating Capsules

These capsules are mandatory short rules. They exist so agents do not need to
read all of LLM-Wiki for every task, but also do not operate from vague memory.
Task packets may require one or more capsules by name.

For coding sessions, capsules are reminders, not the full rule load. Agents
assigned to write, review, refactor, test, validate, or accept repo code must
read the full LLM-Wiki Coding Pack once at session/assignment start:

```text
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/agent-coding-workflow.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/karpathy-guidelines.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/repo-code-rules.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/code-quality.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/output-quality.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/security-baseline.md
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/coding/testing-strategy.md
```

Do not re-read the pack per micro-task unless the session was interrupted,
handed to a new agent, the pack changed, or exact wording is needed.

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

1. `AGENTS.md`
2. `REPO_RULES.md`
3. Full Coding Pack once when the session is code/review/refactor/test/validation work
4. `agents/<agent>/AGENT.md`
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
handoffs/reports and let the integration owner merge. Hermes may warn about
overlap but must not be used as the draft content store.

## LLM-Wiki Lookup Rule

The active repo is the source of truth. LLM-Wiki is a reference knowledge base only.

Before consulting LLM-Wiki, use `docs/knowledge_lookup_metric.md` if this repo has it.

Agents must record the lookup score in their task result report when the task involves architecture, scope, contracts, security, production, deployment, dependencies, external services, or reusable blueprints.

## Optional Hermes Read Planner

If this repo enables Hermes, Hermes is a read-only context indexer and read
planner. It may recommend source files, anchors, and line ranges to read, but it
does not change the source-of-truth order above.

Hermes must not edit code, docs, rules, task state, or rollup files. If Hermes
output conflicts with repo files, the repo files win and Hermes must be treated
as stale until re-indexed.

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

## Coding Pack Rule

Read the full LLM-Wiki Coding Pack at session/assignment start when the work is
code-facing. Narrow exceptions:

- status/report-only work;
- catalog/index/link cleanup with no implementation guidance change;
- docs-only edits unrelated to implementation behavior;
- typo/copy fixes that do not touch behavior, contracts, UI layout, command
  semantics, or validation evidence.

If an exception starts touching behavior, tests, runtime config, security,
performance, contracts, or implementation acceptance, stop and load the pack
before continuing.

Reference:

```text
/home/admindebian/LLM-Wiki/wiki/knowledge/coding/agent-coding-workflow.md
```
