---
type: Current Direction Map
project: LLM-Wiki
status: active
date_updated: 2026-07-17
---

# Current Direction

Use this file before reconstructing LLM-Wiki direction from archives, old
reports, or long conversation history.

This file is the librarian checkpoint: it tells a returning human, supervisor,
or new agent where we are, what already exists, what is not built yet, and which
short checkpoint to open next.

Do not read `tasks_archive.md` or old validation reports end-to-end to recover
current direction. Open linked evidence only when proof is needed.

When the human asks a broad or ambiguous question, do not immediately implement.
Ask a clarifying question first and offer likely directions from this map.
`6 khung` or `6 tầng` now defaults to the canonical **LLM-Wiki Agent Delivery
Workflow** unless the user explicitly names a different architecture, security,
ingestion, audit, or supervision model.

## current model

Human-Agent Hybrid Control is the default invariant across every workflow:
humans own purpose, consequential permission, accountability, and substantive
acceptance; agents own bounded analysis, execution, uncertainty disclosure,
and evidence. Neither side may offload its core responsibility to the other.
Canonical definition:
`wiki/knowledge/project-docs/human_agent_hybrid_control.md`.

The working architecture is the **LLM-Wiki Agent Delivery Workflow**, a
six-layer, human-governed agentic workflow:

```text
Evidence / Agent Platform raw truth
  -> Approval / WAP and human gates
  -> Knowledge / LLM-Wiki
  -> Guidance / shared workflows + repo-local workflows
  -> Orchestration / human now, Gateway/API when justified
  -> Execution / worker -> MCP adapter -> services/tools
```

Canonical definition:
`wiki/knowledge/project-docs/agent_delivery_workflow.md`.

Human continuity projection:

- `human/README.md` is the short Vietnamese-first navigation map.
- `human/workflows.md` links one-to-one to active canonical workflow cards.
- `RECOVERY.md` routes manual recovery to the system that owns the incident.
- Agents self-route by default and disclose `Workflow used` plus actual
  deviations at handoff; the human does not need to remember or choose from a
  full workflow menu.
- Every new project also owns one manual operator entrypoint: repo `HUMAN.md`
  by default or pre-repo `docs/human_workflow.md`; established equivalents must
  be declared by the repo README.

Small, clear, low-risk repo changes may use `Bounded Change Fast Path` inside
Real Repo Work. It is not a new menu workflow: LLM-Wiki owns the shared
targeted-read/escalation/evidence invariant, while each repo owns a thin local
profile. Existing repos require explicit local rollout.

Current implementation:

| Layer | Current owner | Status |
| --- | --- | --- |
| Raw truth | `/home/admindebian/Agent-Platform/raw/projects/<project-id>/` | filesystem pilot |
| WAP / approval proposals | `/home/admindebian/Agent-Platform/wap/` | proposal-only |
| Wiki tinh + maps | `/home/admindebian/LLM-Wiki` | canonical Markdown |
| Workflow / Skill guidance | `workflows/`, `harness/`, `wiki/knowledge/`, session packs | active |
| Gateway / orchestration | `/home/admindebian/Agent-Platform/gateway/llmwiki_auditor.py` | local Python script |
| Worker / model execution | current agent session / Codex tools | not a separate runtime |

## active themes

| Theme | Checkpoint | Status | Next decision |
| --- | --- | --- | --- |
| Project human operator workflow | `wiki/knowledge/project-docs/human_workflow.md`; `/home/admindebian/TAO-CE-Evaluation/human.md` | bootstrap/template/lint contract implemented; TAO projection ready | human executes TAO browser/password/checkpoint path and reports ambiguity before any broader old-repo rollout |
| TAO / ILIAS education platform evaluation | `/home/admindebian/TAO-CE-Evaluation/STATUS.md`; `wiki/concepts/education-platforms/README.md` | TAO CE `2025.10-v1.5-rc` installed and portal-smoked; browser/password checkpoint and all scenarios pending; ILIAS not installed | add local hostname, rotate bootstrap passwords, take clean checkpoint, then run TAO-01..10; resume ILIAS only on user direction |
| Human-Agent Hybrid Control | `wiki/knowledge/project-docs/human_agent_hybrid_control.md` | canonical default and thin projections implemented | exercise on 3-5 natural hybrid work units before changing fields or adding automation |
| Agent Platform boundary | `checkpoints/architecture-agent-platform.md` | pilot implemented | define small schemas before adding API/MCP |
| Workflow audit layer | `checkpoints/workflow-audit-layer.md` | Phase 1 evaluated; contract v0 experiment completed | decide whether a lighter drift checklist is enough or a tiny checker has ROI |
| Agent errors and token budget | `checkpoints/agent-errors-token-budget.md` | guidance implemented | enforce project-local pointers for risky workflows |
| Project librarian pattern | `checkpoints/project-librarian-checkpoint.md` | guidance added | apply to active repos when useful |
| Bug/fix investigation funnel | `checkpoints/agent-errors-token-budget.md` | evaluated in U17 | use in future bug/error work |
| Math-Coding companion | `wiki/knowledge/math/README.md` | formal logic/inference, countermodel and verifier routing, proof, rates, measurement, bounded reasoning navigation, uncertainty/causal controls, recommendation trade-offs, and pack routing implemented | exercise the logic guide and reasoning controller on 3-5 real tasks; retain or simplify based on invalid inference caught, verifier value, and reporting cost |
| Agent capability routing | `wiki/knowledge/project-docs/agent_capability_tiers.md` | `C0-C6` autonomy envelopes, `P0-P2` projections, task/control-card/template gates implemented | run same-task cross-tier pilot, then assign evidence-backed profiles; do not mass-backfill repos yet |
| P1 bounded coding floor | `wiki/knowledge/coding/bounded-coding-core.md` | one canonical cross-repo `P1-BOUNDED-CODING` projection; repo profiles are coordinates, not pack replacements | exercise on comparable bounded tasks and review drift whenever full Coding Pack hard constraints change |
| MCP operations lab | `mcp_operations_lab_brief.md` | concept and brief implemented; MCP server and agent-evaluation knowledge added | choose whether to prototype; if approved, define fixtures, trial protocol, and hard outcome/policy gates before model comparison |
| Agent Delivery Workflow | `wiki/knowledge/project-docs/agent_delivery_workflow.md` | canonical six-layer model and naming accepted | exercise with U17 small UI tasks; measure during execution, then add human review |
| Work-unit context budget | `wiki/knowledge/project-docs/work_unit_context_budget.md` | provider-aware checkpoint pilot active; thresholds unvalidated | collect at least 5 sessions/10 work units and a natural `150k` crossing before revision or promotion |
| Codebase navigation | `wiki/knowledge/project-docs/codebase_navigation.md` | semantic-map/derived-index ownership guidance implemented | test on 3-5 U17 tiny tasks before schema change or indexing automation |
| Stable panel anchors | `wiki/knowledge/project-docs/codebase_navigation.md`; `/home/admindebian/UniversityWeb-U17/docs/tasks.md#U17-PANEL-INDEX-B-016` | approved standard and U17 Homepage execution packet ready | run DeepSeek packet, review before A/C/D rollout; no indexing proposal before evidence gate |

## already done

- `workflows/` exists as a short audit/control layer above `harness/`.
- Agent Platform owns raw source records, snapshots, derived indexes, WAP
  proposals, gateway scripts, and audit events. Local `LLM-Wiki/raw/` is
  legacy-only.
- LLM-Wiki keeps canonical knowledge/workflow Markdown and project maps.
- `DEC-0003` names the canonical six-layer model **LLM-Wiki Agent Delivery
  Workflow**. Shared cross-project workflows stay in LLM-Wiki; project-specific
  workflows and live state stay in real repos; MCP is a runtime capability
  adapter rather than a workflow or source-of-truth owner.
- U17 has Phase 1 workflow routing in repo entry/session docs.
- U17 deploy docs now point future deploy agents to token-budgeted diagnostics
  and human uncertainty checkpoints.
- Agent error cases have a dedicated knowledge folder.
- Agents are explicitly allowed to say "not sure" / "do not know yet" when
  evidence is weak so the human can join the search.
- Bug-fix work now has a debugging funnel: anchor the failure, localize scope,
  state hypotheses, run narrow probes, use `rg`/logs only with a target, search
  official/current sources for vendor/version behavior, and checkpoint when
  evidence stops improving.
- Debug-funnel, classical-math, and MCP source records now live under
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/`.
- Math Pack now includes classical mathematical thinking for agent reasoning:
  definitions, assumptions, constructions, counterexamples, invariants, and
  proof/test obligations before risky coding or debugging escalation.
- Math Pack now includes one bounded classical formal-logic guide. It separates
  syntax, semantics, entailment, and derivation; guards quantified inference;
  uses countermodels; and routes truth-table/SAT/SMT/proof-assistant/human
  verification without adding specialized logic families prematurely.
- Math Pack is now an explicit companion to Coding Pack when the problem has a
  formal or measurement trigger. `proof-techniques.md` covers precise claims,
  quantifiers, proof methods, program correctness, and review;
  `functions-rates-and-measurement.md` covers finite differences/derivatives,
  sensitivity, baselines, uncertainty, and fair efficiency comparisons.
- Every substantive agent recommendation now includes objective/constraints,
  a status quo or alternative, mathematical pros and cons, evidence/uncertainty,
  and a sensitivity or revision trigger; multi-objective decisions expose
  Pareto trade-offs instead of invented aggregate scores.
- Capability-managed agents now use a Lead-owned, evidence-backed capability
  vector and `C0-C6` autonomy envelope. Tasks declare a minimum and `P0-P2`
  projection; unrated/expired agents default to `C0`, cannot self-upgrade, and
  stop or hand off rather than follow a higher-tier flow.
- Knowledge cache discipline now formalizes base literacy, map-first lookup,
  triggered depth packs, active knowledge set reporting, release-on-goal-change,
  and generalist-plus-conditional-depth agent behavior.
- U17 fresh-session evaluation passed with minor cleanup. The only drift found:
  U17 `agents/OPERATING_GUIDE.md` has an older Standard Read Order that omits
  the workflow catalog and real-repo workflow step. That drift has now been
  patched in U17 as `U17-WORKFLOW-DRIFT-013`.
- LLMWIKI-061 workflow-contract v0 experiment exists under
  `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/`. It detects the
  U17 read-order drift, but the decision is revise before promotion; contracts
  are not canonical workflow obligations.
- The workflow-contract experiment now has a repeatable empirical procedure,
  report template, and limitations/mitigations base. Key unresolved risks are
  update burden after workflow changes, stale contract drift, false positives,
  false negatives, overfitting to U17, and accidental promotion into ordinary
  agent read paths.
- `change_impact_map.md` now provides a deeper update-impact layer beyond
  surface navigation maps. It maps change types to canonical, projection,
  derived, and evidence artifacts, with a U17 read-order impact test case.
- Workflow projection registries now separate impact rules from projection
  instances. LLM-Wiki owns `workflow_projection_registry.md` for wiki-owned
  projections; U17 owns its repo-local
  `/home/admindebian/UniversityWeb-U17/docs/workflow_projection_registry.md`.
- U17 deploy/token guidance now records the later deploy session where the user
  had to checkpoint that a publish failure was already fixed once. Deployment
  diagnostics now requires prior-fix lookup before expensive publish variants.
- U17 fresh-session no-drift projection check passed. The report classified the
  route as true negative and exposed a taxonomy issue: `unchecked but aligned`
  registry metadata is not a false-positive drift. Projection registry guidance
  now records `registry metadata stale` as the correct label.
- Workflow route maintenance-cost test passed. U17 registry metadata now marks
  `PROJ-U17-SESSION-START` aligned, and the simulated governance route change
  did not justify a checker.
- MCP operations lab planning exists as `mcp_operations_lab_brief.md` and the
  temporary concept note under `wiki/concepts/ai-agent-rag-mcp/`. It captures
  local AI as a natural-language router over deterministic backend tools for
  asset, attendance, Excel/import-export, report, proposal, permission, and
  audit workflows.
- A dedicated `wiki/knowledge/mcp-server/` pack now exists for MCP server
  architecture, tool/resource/prompt design, transports/auth, security,
  permissions, testing, and operations.
- `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md` now defines
  outcome-first, policy-gated, trajectory-aware, repeated-trial evaluation for
  tool-using agents. It routes MCP lab model comparison through local fixtures
  and cost/privacy evidence instead of public leaderboard scores.

## not built yet

- No web API gateway.
- No MCP server for Agent Platform.
- No persistent worker runtime.
- No canonical machine-readable workflow contracts.
- No automated token incident extractor.
- No general project `current_direction.md` backfill across all repos.
- No automated impact checker or repo-wide projection inventory.
- No automated prior-fix lookup checker for deploy/publish sessions.
- No MCP operations lab prototype, sample workbook, service layer, or tool-call
  reliability measurement.
- No project-specific agent evaluation suite, baseline run, or accepted local
  model/harness configuration.
- No real-repo result yet measures whether the expanded Math/Coding reasoning
  packet improves correctness or performance decisions.
- No multi-session evidence yet validates the work-unit context pilot's
  provisional `150k` warning or `300k` restart recommendation.
- No U17 result yet validates the semantic-map/derived-index split across 3-5
  comparable tiny tasks; no file watcher or shared symbol index is built.
- No DeepSeek result yet validates the U17 comment-only Homepage B1-B6 packet.

## do not repeat

- Do not reconstruct current architecture from `tasks_archive.md`.
- Do not re-read old validation reports unless proof for a specific claim is
  needed.
- Do not move canonical Markdown knowledge into Agent Platform.
- Do not turn `workflows/` into long runbooks; keep detailed rules in
  `harness/` or `wiki/knowledge/`.
- Do not let agents keep grepping/log-reading when they are uncertain; use the
  bug-fix funnel and ask the human to join the search when probes stop adding
  evidence.

## next likely steps

1. Use the Change Impact Map before durable workflow/source-of-truth/template
   changes.
2. For U17 deploy/publish sessions, use prior-fix lookup before broad
   diagnostics.
3. Keep the current manual map plus projection registry approach. Do not build a
   checker unless repeated drift or maintenance misses appear.
4. Decide later whether workflow contracts should stay experiment-only or become
   optional auditor input.
5. Do not promote workflow contracts broadly unless a real Agent
   Platform/auditor consumer is identified.
6. Apply the project librarian/current-direction pattern to active repos when
   a supervisor or new contributor needs fast orientation.
7. For the MCP operations lab, decide whether to start a real repo/prototype.
   If yes, start from `mcp_operations_lab_brief.md` and load
   `wiki/knowledge/mcp-server/README.md` plus
   `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md` before implementation.
8. On the next non-trivial proof, debugging, evaluation, or performance task,
   load Math Pack beside Coding Pack; use reasoning navigation when several
   candidate paths exist and record which proof, verifier, backtrack,
   uncertainty, or stopping field changed the decision.
9. Collect work-unit context observations without runtime enforcement or
   manufactured token use; review only after the pilot sample gate is met.
10. Test stable semantic anchors on U17 tiny tasks before changing its code-map
    schema or building derived-index automation.
11. Run and review `U17-PANEL-INDEX-B-016`; open later panel groups only after
    comment/map accuracy, read cost, build evidence, and unknown handling pass.

## evidence

- `reports/validation/2026-07-06-workflow-catalog-audit-layer.md`
- `reports/validation/2026-07-06-u17-phase1-repo-standardization.md`
- `reports/validation/2026-07-07-deployment-diagnostics-token-budget-file-back.md`
- `reports/validation/2026-07-07-agent-error-cases-token-budget.md`
- `reports/validation/2026-07-07-human-checkpoint-u17-deployment-pointer.md`
- `reports/validation/2026-07-08-bugfix-debugging-funnel.md`
- `reports/validation/2026-07-08-classical-math-agent-reasoning.md`
- `reports/validation/2026-07-08-knowledge-cache-discipline.md`
- `reports/validation/2026-07-08-u17-phase1-effectiveness-evaluation.md`
- `reports/validation/2026-07-09-workflow-contract-pilot.md`
- `reports/validation/2026-07-09-workflow-contract-experimental-procedure.md`
- `reports/validation/2026-07-09-change-impact-map.md`
- `reports/validation/2026-07-09-workflow-projection-registry.md`
- `reports/validation/2026-07-09-u17-deploy-token-fileback.md`
- `reports/validation/2026-07-09-u17-no-drift-taxonomy-fileback.md`
- `reports/validation/2026-07-09-workflow-route-maintenance-cost.md`
- `reports/validation/2026-07-10-mcp-operations-lab-brief.md`
- `reports/validation/2026-07-10-mcp-server-knowledge-pack.md`
- `reports/validation/2026-07-10-tool-agent-evaluation-knowledge.md`
- `reports/validation/2026-07-10-math-coding-companion-reasoning.md`
