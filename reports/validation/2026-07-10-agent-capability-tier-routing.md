# LLMWIKI-080 Agent Capability Tier Routing Validation

Date: 2026-07-10
Scope: Add evidence-backed agent capability envelopes and context projections
that prevent lower-capability agents from entering higher-autonomy workflows.
Task/story: LLMWIKI-080
Validator: Codex

## source

- Project: LLM-Wiki
- Human approval: the current user explicitly accepted capability-aware
  LLM-Wiki routing and required agents to know their limit and avoid higher-tier
  flows.
- Architecture decision: ADR-0008 in
  `wiki/projects/llm-wiki/docs/decisions.md`.
- Canonical knowledge:
  `wiki/knowledge/project-docs/agent_capability_tiers.md`.
- Research brief:
  `reports/research/2026-07-10-agent-capability-tier-routing.md`.
- Raw source record:
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-10-agent-capability-tier-routing-sources.md`,
  SHA-256
  `859f5fa2901b0dd442cbc13eb174f26d93fb7268ba41f05986ddb1ef5047e8ca`.
- Commit/build/version: local Markdown workspace; no Git repository detected at
  `/home/admindebian/LLM-Wiki`.

## architecture contract

```text
one canonical LLM-Wiki
  -> evaluated capability vector for frozen model+harness+tools+context+verifier
  -> C0-C6 autonomy envelope
  -> P0 Capsule | P1 Bounded Packet | P2 Map-First
  -> task component-wise fit + safety/permission/claim/human gates
  -> eligible work OR smaller packet/support/higher-tier handoff
```

Hard rules:

- unrated or expired configuration is `C0`;
- agent may self-downgrade but cannot self-assign or self-upgrade;
- provider/parameter count/fluent prose/single demo is not capability evidence;
- higher tiers may use smaller projections; lower tiers cannot use larger ones;
- mandatory capability weaknesses are not averaged away;
- high tier never bypasses destructive, security, permission, or human gates.

## changed surfaces

- Knowledge: capability-tier guide, session packs, knowledge-cache discipline,
  role packs, agent evaluation, coding workflow/rules, session start, agent
  local work, multi-agent coordination, and knowledge maps.
- Workflow/harness: capability calibration, session start, real-repo work,
  workflow catalog, read workflow, task packet, project bootstrap, operating
  guide, and lint.
- Templates: AGENTS, REPO_RULES, agent control card, capability profile, tasks,
  legacy agent tasks, session start, result report, and agent work plan.
- Architecture/maps: ADR-0008, architecture, change impact map, workflow map,
  data map, projection registry, change queue, project/root indexes.
- Evidence/live state: research/validation catalogs, tasks, test matrix,
  project/current status, active, and TICK.

## commands and checks

```text
bash harness/feedback-loop-lint.sh
rg tier rows C0-C6 and projection rows P0-P2
rg capability gate/profile/result fields across workflow, harness, and templates
rg unconditional full-Coding-Pack instructions outside immutable history
sha256sum Agent Platform capability-routing source record
wc -l capability guide, workflow card, and profile template
```

## results

| Check | Result | Notes |
| --- | --- | --- |
| Tier taxonomy | passed | Exactly `C0` through `C6` are defined with academic analogy, operating shape, nonbinding orientation, and autonomy ceiling. |
| Capability vector | passed | Instruction/source precedence, retrieval, reasoning, tool/schema use, verification/uncertainty, and horizon are separate dimensions. |
| Context projections | passed | `P0`, `P1`, and `P2` have explicit intended tiers, contents, and forbidden behavior. |
| Unrated/self-upgrade boundary | passed | Unrated/expired defaults to `C0`; self-downgrade allowed; self-upgrade forbidden and Lead-owned fields protected. |
| Task fit | passed | Task packet/templates require minimum tier, dimensions, projection, autonomy, verifier, reviewer, evidence, and fallback. |
| Start gate | passed | Session/read/real-repo workflows stop or hand off before broad reads/tools on mismatch. |
| Coding Pack contradiction | passed | Unconditional full-pack rule was replaced: eligible `P2` reads full canonical pack; `P0/P1` needs a validated task-named projection preserving hard gates. Historical project-status prose remains history. |
| Agent note and handoff evidence | passed | Control card owns the envelope; result report records tier, projection, fit, downgrade/handoff, and no-self-upgrade confirmation. |
| Impact/projection tracking | passed | Change impact row, workflow/data entities, capability baseline, and five known projections are recorded. |
| Line budgets | passed | Canonical guide 267 lines; workflow card 73; profile template 60, within their guidance bands. |
| Source integrity | passed | External source record exists and hash is recorded above. |
| Wiki lint/link validation | passed | Final run: `0 failure(s), 0 warning(s)`; 513 active wikilinks and 503 Markdown links resolved. |

## recommendation and mathematical trade-offs

- **Recommendation:** retain one canonical wiki and generate/evaluate tier-
  appropriate projections instead of giving all agents the full flow or
  maintaining separate wikis.
- **Objective/constraints:** maximize accepted work per cost/time while safety,
  source precedence, permission, and human approval remain hard constraints.
- **Baseline:** all agents navigate the same Map-First/full-pack workflow.
- **Pros:** lower context entropy; deterministic eligibility and escalation;
  bounded local models can contribute; frontier capacity is reserved for
  ambiguity, integration, and research; one source of truth remains.
- **Cons:** profiles/projections/evaluations add maintenance; projection drift
  can omit nuance; tier labels can create false confidence; reviewers and
  deterministic fixtures are required.
- **Evidence/uncertainty:** external studies support model+harness evaluation,
  tool benefit, and model-class disparity, but LLM-Wiki has no controlled cross-
  tier result yet.
- **Sensitivity/revision trigger:** first same-task pilot, a false-eligibility
  incident, projection drift, or changes to model, quantization, prompt,
  harness, tools, context, verifier, or permissions.
- **Dominance/Pareto note:** selected design dominates separate tier wikis on
  source-of-truth duplication and dominates one full flow on capability safety;
  it incurs higher projection/evaluation maintenance than one full flow.

## rollout boundary and gaps

- No agent has been assigned an evidence-backed operational tier by this task.
- No local 1B-35B or hosted/frontier same-task benchmark was run.
- No active real repo was backfilled. Canonical templates and new/renewed
  packets adopt the contract; each repo requires explicit rollout approval.
- No automatic compiler from canonical knowledge to `P0/P1` exists. Until a
  projection is validated and named by a task, a lower-tier code agent is not
  eligible for that task.
- A tier is domain/configuration-specific and can expire; it is not a permanent
  model leaderboard label.

## decision

- implemented as canonical forward contract; empirical calibration and repo
  rollout remain separate follow-up work.
