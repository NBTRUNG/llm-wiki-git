# AGENTS

Project: `{{project_name}}`
Last updated: `{{YYYY-MM-DD}}`

## Capability gate

Canonical guide:

```text
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/project-docs/agent_capability_tiers.md
```

- Read the Lead-owned capability note in `agents/<agent>/AGENT.md` before the
  normal read order. Unrated or expired configurations use the `C0` envelope.
- Compare assigned tier and capability dimensions with the task minimum before
  broad reads or tools.
- Use only the assigned `P0 Capsule`, `P1 Bounded Packet`, or `P2 Map-First`
  projection. Higher-tier agents may use a smaller projection; lower-tier
  agents must not enter a larger one.
- An agent may self-downgrade or stop. It must never assign or upgrade its own
  tier, authority, domain qualification, or evidence.
- On mismatch, request a smaller packet, deterministic support, or higher-tier
  handoff. Do not simulate a higher-capability workflow.

## Non-negotiables

- Human-Agent Hybrid Control is the default operating model. Human intent,
  judgment, consequential permission, accountability, and acceptance remain
  coupled to agent bounded analysis, execution, verification support, and
  evidence. Neither side may abdicate its responsibility.
- Keep capability, autonomy, permission, impact, and reversibility separate.
  High capability never implies broad privilege; human approval never replaces
  outcome verification.
- This file is the one-file session entry for this repo. Read it first, then
  open additional files only when the current intent requires them.
- `HUMAN.md`, or the equivalent declared by `README.md`, is the manual operator
  entrypoint. When access, runtime lifecycle, persistent storage, bootstrap
  credentials, smoke checks, or recovery change, update it in the same work
  unit; never store a real secret there.
- Active repo docs are source of truth for current implementation state.
- Start sessions from this repo for repo implementation/status/task work. Do not
  start from LLM-Wiki unless the task is to change LLM-Wiki itself or file back
  reusable knowledge.
- Token economy: default to minimal reads at session start. Each file read must
  trace to a current intent. Never re-read full project state at bootstrap.
- Coding sessions load the canonical LLM-Wiki Coding Pack directly only when
  their capability projection permits it. Lower tiers require an approved
  task-named projection that preserves security, output, test, boundary, and
  escalation rules; without one they are not eligible for coding work.
- Qualified `C2-C3` bounded coding tasks use the shared
  `P1-BOUNDED-CODING` projection; repo maps/profiles/capsules provide local
  coordinates and never replace or fork that projection.
- Data architecture/storage/schema/migration/performance sessions load the
  LLM-Wiki Data Knowledge Pack by trigger. Ordinary data tracing starts from
  repo `docs/data_map.md`; do not read all data knowledge by default.
- Algorithm/math sessions load the LLM-Wiki Algorithms Pack by trigger when
  selecting algorithms, proving complexity/correctness, optimizing hot paths,
  or implementing search/ranking/matching/scheduling/parsing/numerical logic.
- Agents classify the session pack before work. Coding sessions always include
  the Security Baseline; security-sensitive sessions add the Security Deep Pack
  and report whether human security review is needed.
- After review passes, agents run the Post-Task Distillation Gate before Done:
  record skipped/required, file reusable knowledge or queue deferred candidates,
  and update wikilinks/indexes when distillation is required.
- Respect task packet Allowed Write Targets and Forbidden Side Effects.
- Record evidence before marking work complete.
- A validation/report file is not live state. Before reporting Done, update this
  repo's current-state file, task row, test/evidence row, and report index when
  the work changes durable project state.
- Claim the task before implementation when `TICK.md`, `docs/tasks.md`, or the
  task packet has claim fields. Release the claim when done, blocked, paused, or
  reassigned.

## ROI Gate

Before changing workflow structure, templates, task layout, archive strategy,
source-of-truth rules, or session-start procedure, compare:

```text
ROI: benefit vs edit surface
Simplicity: can a new agent understand it in under 5 minutes?
Effectiveness: does it reduce real confusion or only make docs prettier?
Blast radius: how many templates, harness files, reports, and project docs must change?
Decision:
- If options produce the same operational behavior, choose the smaller change.
- If a larger change produces materially better effectiveness, present the
  options, ROI, and blast radius to the user or integration owner before
  choosing.
```

ROI is not a rule to always choose the cheapest edit. It is a decision gate:
smallest-equivalent-change by default; user/integration-owner choice when a
higher-cost option may be worth the better outcome. Record the ROI note in the
result or validation report.

## LLM-Wiki root

Use `${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}` when linking to LLM-Wiki
from portable docs or scripts.

## Agent Platform root

Use `${AGENT_PLATFORM_ROOT:-/home/admindebian/Agent-Platform}` for raw
snapshots, extracted indexes, WAP proposals, gateway scripts, and audit logs.
Project repos keep pointers to raw/platform locations; they do not store raw
evidence directly.

## Mandatory LLM-Wiki Knowledge Gate

Every AI-enabled repo must expose this gate in `AGENTS.md` so a new agent knows
which LLM-Wiki knowledge is mandatory and which knowledge is trigger-based.

Canonical selector:

```text
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/project-docs/agent_session_packs.md
```

Required for every session:

- Human-Agent Hybrid baseline: named sponsor/acceptance owner, bounded agent
  responsibility, action-risk lane, permission/stop boundary, human gate for
  consequential action, and evidence-based acceptance. Canonical depth:
  `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/human_agent_hybrid_control.md`.
- Capability fit: assigned tier/vector, task minimum, projection, autonomy,
  verifier, reviewer, and handoff route.
- Repo Base Pack: this file, `REPO_RULES.md`, `TICK.md` when present, current
  assignment/task packet, and task Required Read Files.
- Claim check when `TICK.md`, `docs/tasks.md`, or task packets have claim fields.

Required for code-facing work:

- Coding Pack directly or through the validated projection named by the task;
  use `P1-BOUNDED-CODING` for qualified `C2-C3` bounded code work.
- Security Baseline, already included in the Coding Pack.
- Result report security fields, even when security impact is `none`.

Trigger-based LLM-Wiki packs:

| Trigger | Pack |
| --- | --- |
| UI, route, layout, accessibility, visual quality, frontend performance | Web/UI Pack |
| APIs, DTOs, route contracts, CMS fields, events, integrations | Contracts Pack |
| Database/CMS/import/export/raw SQL/data correctness | Data / Database Map Pack |
| Storage/schema/migration/import architecture, data ownership, scale | Data Knowledge Pack |
| Search/ranking/matching/parsing/dedup/scheduling/numerical/statistical logic | Algorithms / Math Pack |
| Module boundaries, dependencies, platform, ADR, architecture posture | Architecture Decision Pack |
| Deployment, rollback, observability, runtime config, release readiness | Operations / Release Pack |
| Auth, authorization, secrets, private data, uploads, CORS/CSP, raw SQL/HTML, dependencies, trust boundaries | Security Deep Pack |

Do not read unrelated packs just in case. If a required pack was skipped, mark
the result `blocked` or `needs-review`.

Every non-trivial result report that used LLM-Wiki knowledge must include the
Knowledge Effectiveness fields from:

```text
${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}/wiki/knowledge/project-docs/knowledge_effectiveness.md
```

Report what helped, what changed because of it, and whether LLM-Wiki knowledge
was missing, stale, unclear, or worth filing back.

## Data Quickstart

Keep this short and non-secret. Read the full data map only when the task
touches data, schema, import/export, reporting, migrations, or backend reads and
writes.

- Local DB:
- Test DB:
- Production DB:
- Provider:
- Migration command:
- Seed/import flags:
- Never run destructive migration on:
- Data map: `docs/data_map.md`
- Full/raw inventory: `docs/database_inventory.md`
- Data Knowledge Pack trigger: `${LLM_WIKI_ROOT}/wiki/knowledge/data/README.md`
  when choosing storage/database, changing ownership/model/schema, planning
  migration/backfill/import, or reviewing data performance/scale.
- Algorithms Pack trigger: `${LLM_WIKI_ROOT}/wiki/knowledge/algorithms/README.md`
  when algorithmic correctness, complexity, search/ranking/matching,
  scheduling/optimization, parsing/deduplication, numerical precision, or
  statistics are material to the task.

## Bootstrap cheatsheets

### Lead L1 default

Read only:

1. `AGENTS.md`
2. `REPO_RULES.md`
3. `TICK.md` when present
4. `LEAD_STATE.md` or the repo's legacy Lead state file

Stop after L1 unless the current intent matches one of the sub-branches below.

| Branch | Intent | Extra reads |
|---|---|---|
| L1 | Just check state | none |
| L2 | Review delegated result | `agents/<agent>/AGENT.md` checkpoint + named result report |
| L3 | Plan a new packet | contested contract rows + code map + one task row + prior related reports |
| L4 | Resolve agent conflict | both agents' `AGENT.md` blocker/checkpoint sections + contested contract rows + referenced decisions |
| L5 | Accept and roll up | test-matrix row + task row + accepted report |
| L6 | Write new decision | last 5 decisions + triggering validation report |

### Delegated default

Read only:

1. The assigned capability note/capsule and `agents/<agent>/AGENT.md` capability
   envelope.
2. Confirm task/projection fit; stop on mismatch.
3. `AGENTS.md`, `REPO_RULES.md`, and `TICK.md` only when the assigned projection
   includes them.
4. LLM-Wiki `agent_session_packs.md` only for `P1/P2` classification.
5. Canonical Coding Pack directly for eligible `P2` work, or the approved
   task-named projection for lower tiers. Qualified bounded `C2-C3` coding uses
   `P1-BOUNDED-CODING`, not an agent-authored repo summary.
6. Files listed in the assigned task's Required Read Files.

Delegated agents do not read Lead state, project-wide rollups,
per-agent task/status/archive files, or unrelated LLM-Wiki knowledge unless the
task packet explicitly requires it or the Knowledge Lookup Metric scores high
enough.

Delegated agents follow the `Coordination mode` in their `AGENT.md`:

- `Lead-orchestrated`: report to Lead.
- `Human-orchestrated`: report to the named human review target.

If several agents contribute to one outcome, a human, Lead, or named integrator
must be assigned as integration owner before merge, rollup, or source-of-truth
updates.

If several agents propose edits to the same section/row, store proposals in
`AGENT.md` handoffs, `reports/agent/`, or
`reports/integration/<task-id>-merge-plan.md`. Do not use retired cache/index
systems as the draft content store.

## Role map

Current assignments live in `LEAD_STATE.md` and `docs/agent_status.md`; this
file defines roles, not which AI fills them.

| Role | Owns | Default write targets |
|---|---|---|
| Lead | repo-wide coordination, agent control cards, reviews, decisions, conflict resolution | `docs/`, Lead-owned sections of `agents/*/AGENT.md`, `LEAD_STATE.md`, validation reports |
| Delegated implementation | assigned implementation slice | packet Allowed Write Targets, agent-owned sections of own `AGENT.md`, own result report |
| Delegated findings | assigned review/findings slice | assigned findings/report paths, agent-owned sections of own `AGENT.md` |
| Unavailable | no active work | none |

## Required reports

- Default delegated handoff: `agents/<agent>/AGENT.md` `result handoff`
- Delegated result report, when threshold is met:
  `reports/agent/<agent>/<task-id>-result.md`
- Integration merge plan, when multiple agent outputs must be combined:
  `reports/integration/<task-id>-merge-plan.md`
- Validation report: `reports/validation/YYYY-MM-DD-<scope>.md`
- LWOE session measurement, when enabled: `reports/lwoe/YYYY-MM-DD-<project>-<session-id>.md`

## References

- `${LLM_WIKI_ROOT}/harness/read-workflow.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/open_knowledge_format.md`
- `${LLM_WIKI_ROOT}/harness/task-packet.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/agent_session_packs.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/agent_capability_tiers.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/post_task_distillation.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/project_closeout_distillation.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/coding/agent-coding-workflow.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/session_start.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/token-economy-bootstrap.md`
