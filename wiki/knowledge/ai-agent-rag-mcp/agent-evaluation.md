---
name: agent-evaluation
description: Outcome-first, trajectory-aware evaluation guidance for tool-using agents and MCP workflows.
date_ingested: 2026-07-10
status: active
source_type: current-source research + distilled practice
source_project: llm-wiki
source_urls:
  - https://developers.openai.com/api/docs/guides/agent-evals
  - https://openai.github.io/openai-agents-python/tracing/
  - https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents
  - https://platform.claude.com/docs/en/test-and-evaluate/develop-tests
  - https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-agents
  - https://arxiv.org/abs/2406.12045
  - https://arxiv.org/abs/2506.07982
  - https://arxiv.org/abs/2602.00933
  - https://arxiv.org/abs/2505.20411
  - https://arxiv.org/abs/2603.26137
  - https://arxiv.org/abs/2606.07297
  - https://metr.org/time-horizons/
  - https://metr.org/hcast.pdf
  - https://www.swebench.com/SWE-bench/guides/evaluation/
  - https://arxiv.org/abs/2506.11763
  - https://arxiv.org/abs/2508.15804
  - https://arxiv.org/abs/2602.11685
  - https://arxiv.org/abs/2605.06635
  - https://deepmind.google/research/evals/
confidence: medium
confidence_reviewed: 2026-07-16
revision_trigger: Recheck quarterly, before a production agent release, or when the agent harness, model, tool schemas, policy, or benchmark methodology changes.
---

# Agent Evaluation

Use this guide to evaluate an agent that selects tools, calls MCP servers,
changes external state, coordinates with a user, or produces an answer from
tool results. Retrieval-only evaluation remains in
[retrieval-evaluation.md](retrieval-evaluation.md).

## core rule

An agent run has more than one observable result:

```text
task input
  -> model and agent harness
  -> trajectory: messages, tool calls, results, approvals, handoffs
  -> outcome: final files, rows, records, permissions, audit events
  -> final response
```

Do not declare success because the final response sounds correct. Verify the
external outcome and mandatory safety invariants first, then use trajectory and
response graders to explain quality and failure modes.

## evaluation contract

Freeze or record these fields before comparing runs:

```text
Eval suite and version:
Task and expected outcome:
Initial fixture/state:
Task origin, repository snapshot, and information cutoff:
Prompt/task-construction method and information granularity:
Allowed and forbidden side effects:
Required policy/permission checks:
Agent harness and version:
Model/provider/version and generation settings:
Tool/MCP server schemas and versions:
Tool and turn budgets:
Grader versions and thresholds:
Trial count and isolation/reset method:
Trace redaction and retention:
Contamination status and search/network policy:
```

Changing a model while also changing the prompt, harness, tool descriptions,
or budgets does not isolate model quality. Treat the full model-plus-harness
configuration as the system under test.

## evaluation layers

| Layer | Preferred proof | Typical failure |
| --- | --- | --- |
| Outcome/state | Deterministic query, file hash/schema check, invariant, or unit/integration test | Agent claims success but no valid state change exists. |
| Policy and safety | Deterministic authorization, approval, scope, and audit assertions | Unauthorized read/write or missing confirmation. |
| Trajectory/tool use | Structured trace checks and required-call assertions | Wrong tool, invalid arguments, missing prerequisite, retry loop. |
| Final response | Grounding checks, claims rubric, or calibrated model/human review | Correct state but misleading, incomplete, or unsupported response. |
| Reliability | Repeated isolated trials | One lucky pass hides inconsistent behavior. |
| Efficiency | Latency, tokens, cost, turns, calls, retries, and error rate | Correct result is too slow, costly, or fragile to operate. |

For mutating workflows, outcome plus policy/safety are hard gates. A high
average score must not compensate for an unauthorized mutation, data leak, or
missing audit event.

## grader order

Choose the simplest reliable grader for each assertion:

1. Use code-based outcome and invariant checks when the state is inspectable.
2. Use deterministic tool-call checks for schemas, required approvals,
   forbidden calls, and mandatory ordering.
3. Use trajectory similarity metrics only when several paths need comparison.
4. Use a model grader for open-ended quality that code cannot judge.
5. Calibrate model graders against human or domain-expert labels and repeat
   that calibration after rubric or judge-model changes.
6. Use human review for ambiguous, high-stakes, novel, or disputed cases.

Keep grader outputs separate. A single blended score can conceal a policy
failure behind response quality or partial credit.

## research-agent evaluation

Deep-research agents need an evaluation slice that separates research process
from polished report quality. Reuse the general layers above, then grade these
dimensions independently:

| Dimension | Preferred evidence | Failure hidden by a polished report |
| --- | --- | --- |
| Scope and plan | Required subquestions, exclusions, source families, and budget recorded before search | Agent answers an easier or broader question. |
| Acquisition | Coverage of decision-relevant subquestions and primary-source preference | Many sources repeat one viewpoint while a key issue is missing. |
| Claim support | Claim-to-source checks for accessibility, relevance, support strength, freshness, and conflicts | URLs work and look relevant but do not entail the claims. |
| Synthesis | Accuracy, completeness, objectivity, explicit uncertainty, and apply/avoid conditions | Fluent prose hides omissions, overstatement, or unresolved conflict. |
| Control | Correct clarification, interruption, abstention, and human-promotion behavior | Agent continues browsing or publishes despite insufficient evidence. |
| Efficiency | Useful new evidence per search/call, latency, tokens, and cost | Extra retrieval increases volume without changing the decision. |

Evaluate cited and uncited substantive claims. Keep citation accessibility,
relevance, factual support, and coverage as separate measures; do not compress
them into citation count or one blended score. For open-ended reports, use a
task-specific rubric and human-calibrated review where deterministic checks
cannot judge completeness or objectivity.

Do not infer that a larger search budget improves research quality. Compare
matched configurations at more than one budget and inspect whether additional
calls resolve important gaps or merely add redundant sources. Public deep-
research benchmarks are useful task-shape references, but local release still
needs representative questions, current sources, source-access checks, and a
human-owned promotion gate.

## trajectory grading

Select the metric from the workflow contract:

| Contract shape | Suitable check |
| --- | --- |
| One mandatory call sequence | Exact trajectory match. |
| Mandatory prerequisites with optional extra work | In-order required-call match plus an unnecessary-call limit. |
| Required calls may occur in any order | Any-order match or required-call recall. |
| Many valid strategies reach the same result | Outcome/invariant grading; use trajectory only for diagnostics. |
| A tool should not be used | Forbidden-call assertion and tool-selection precision. |

Exact matching is intentionally strict. Do not use it when equivalent call
orders or a more efficient valid strategy are acceptable. Conversely, do not
accept an equivalent final answer when policy requires a specific prerequisite
such as authentication, approval, or proposal-before-commit.

Useful trajectory diagnostics include:

- schema-valid call rate;
- correct tool selection and argument rate;
- required-call recall and unnecessary-call rate;
- execution error and timeout rate;
- retry/recovery success after a controlled failure;
- turns, tool calls, tokens, latency, and cost per successful task;
- handoff, clarification, approval, and refusal correctness.

## repeated-trial reliability

Agent behavior is non-deterministic even when the task is fixed. Run multiple
isolated trials when reliability matters and report the distribution, not only
the best attempt.

- `pass@1`: first-attempt task success.
- `pass@k`: at least one of `k` attempts succeeds; useful when trying several
  candidates is an accepted workflow.
- `pass^k`: all `k` attempts succeed; useful when users expect the workflow to
  work consistently.
- per-task success rate: successful trials divided by trials for that task.

Choose `k` from user risk and evaluation cost; there is no universal value.
Report the observed result directly. Do not infer `pass^k` by raising an
average success rate to a power unless trial independence is justified.
Shared state, cached artifacts, rate limits, and resource exhaustion can make
failures correlated.

## dataset shape

A small task-specific suite is more useful than a broad benchmark that does
not match the deployed workflow. Include:

- common successful reads and writes;
- no-tool questions and cases where a tempting tool must not be called;
- missing or ambiguous information that requires clarification;
- invalid arguments, missing required fields, and unknown tools;
- permission denials and approval-required operations;
- tool errors, timeouts, partial results, and retry limits;
- stale, conflicting, malicious, or prompt-injected tool/resource content;
- distractor tools and overlapping tool descriptions;
- multi-tool and conditional workflows;
- repeated requests, idempotency, and duplicate-write prevention;
- production failures converted into regression tasks.

Keep separate suites for:

- **capability:** hard tasks that show what the agent may learn to do;
- **regression:** previously supported tasks expected to remain near the
  release threshold;
- **safety:** adversarial and forbidden actions that must not regress.

Balance trigger and non-trigger cases. Testing only when a tool should be used
can optimize the agent into calling it for everything.

## harness and fixture controls

- Start every trial from a known snapshot and reset all mutable state.
- Isolate files, databases, caches, sessions, and credentials between trials.
- Use synthetic or approved data; do not put secrets in eval fixtures.
- Pin tool schemas, protocol/SDK versions, prompts, graders, and environment
  dependencies for comparisons.
- Record complete traces for debugging, but redact credentials and sensitive
  tool inputs/outputs and set an explicit retention policy.
- Store outcome evidence separately from the model's self-report.
- Prove at least one reference solution can pass every task and grader.
- Review zero-pass tasks for broken fixtures or ambiguous criteria before
  blaming the agent.

## coding-agent validity controls

Repository coding evaluations need controls beyond a reproducible container.

### temporal and information separation

- Record the repository snapshot, issue/change creation and merge dates, model
  or system cutoff, and every source of repository-derived context.
- Build task context only from artifacts that would have been available at the
  declared snapshot. Keep later patches, tests, issue resolution, and generated
  hints out of the agent-visible environment.
- Prefer fresh rolling tasks, post-cutoff tasks, private held-out instances, or
  generated variants when public static tasks may have entered training data.
- Label contamination risk rather than claiming a suite is contamination-free
  from dates alone. Model training corpora and retrieval caches are usually not
  fully observable.
- If web or repository search is allowed during the run, log the search
  trajectory and prevent access to the benchmark answer, gold patch, future
  commit, and public solution artifacts. Search-time answer leakage is a test
  failure, not agent reasoning success.

Temporal freshness trades manual curation quality for lower contamination
risk. Validate task clarity, solvability, installation, tests, and reference
solutions before accepting automatically mined tasks into a release suite.

### prompt and harness as first-class variables

Freeze the task generator, prompt template, information granularity, model,
harness, tools, budgets, and environment for a comparison. A more guided task
description can reveal file or solution information and materially change the
measured result.

When evaluating a context pack, repository map, or retrieval layer, use a
matched comparison: the same task, snapshot, agent configuration, prompt
construction, budget, and grader, with only the candidate context mechanism
changed. Report the full system configuration rather than attributing the
delta to the model alone.

### repository exploration diagnostic

End-to-end executable outcome remains the release gate. When a coding agent
fails before editing or consumes excessive context, add a diagnostic task that
asks it to rank relevant code regions under a fixed visible-line or token
budget. Keep these dimensions separate:

- coverage or recall of relevant/core regions;
- ranking quality and whether useful evidence appears early;
- context efficiency: relevant visible lines divided by all visible lines;
- noise, missed files/regions, and downstream repair success.

Do not turn exploration similarity to one successful trajectory into a hard
correctness gate. Several evidence paths may support an equivalent valid fix,
and ground truth derived from prior successful trajectories can omit valid
alternatives.

## task difficulty and autonomy horizon

Aggregate success can hide that an agent works reliably only on short or
well-scoped tasks. Stratify results by a locally relevant difficulty measure,
such as qualified-human completion time, dependency breadth, or workflow step
count, and report success plus uncertainty within each stratum.

A task-completion time horizon is the human task duration at which a fitted
model predicts a chosen success probability, such as 50% or 80%. It is not the
wall-clock time the agent can run autonomously. Use this metric only when:

- qualified humans and agents receive comparable instructions and affordances;
- human duration predicts agent difficulty on the chosen task population;
- the task suite covers the range being reported;
- the fit, weighting, trial policy, uncertainty interval, and failed-task
  treatment are disclosed.

Report both the reliability level and the uncertainty. A 50% horizon can be
useful for capability research but is too weak for workflows that require
consistent success; use a higher reliability target or direct per-stratum
release thresholds for those workflows. Do not extrapolate beyond task-suite
coverage or compare horizons from different suites as if they were the same
measurand.

## minimum MCP workflow suite

For a local MCP operations lab, start with deterministic fixtures for:

```text
read-only count -> exact backend result, no mutation
report request -> valid file under the allowed output root
write request -> proposal created, source state unchanged
unauthorized commit -> denial plus audit event, no mutation
authorized commit -> expected state transition plus audit event
invalid arguments -> schema rejection, no side effect
tool timeout -> bounded recovery or explicit failure
no-tool request -> direct answer without an unnecessary call
```

Run each critical task more than once across the exact local-model and harness
configuration being considered. A public MCP benchmark may reveal useful task
shapes, but it does not replace project fixtures, permissions, data, latency,
or hardware measurements.

## release record

Report at least:

```text
Suite/version and task count:
System configuration:
Snapshot, cutoff, contamination status, and prompt-construction version:
Trials per task:
Outcome pass rate and pass@1:
Consistency metric and chosen k:
Success by task-difficulty stratum; horizon and interval if justified:
Policy/safety violations:
Tool selection/argument failures:
Exploration coverage/ranking/context efficiency if used diagnostically:
Recovery failures:
Latency/token/cost distribution:
Known flaky tasks or grader disagreements:
Compared baseline and confidence:
Decision and rollback/review trigger:
```

Do not release solely from an aggregate score. Define blocking invariants and
thresholds before the run, compare against a pinned baseline, inspect failure
traces, and retain a rollback path for model, prompt, harness, or tool-schema
changes.

## capability-tier use

When evaluation assigns an operational capability envelope, follow
[../project-docs/agent_capability_tiers.md](../project-docs/agent_capability_tiers.md):

- freeze model, serving, harness, tools, context projection, and verifier;
- keep capability dimensions and hard gates separate;
- assign the maximum safe tier from the weakest mandatory task dimension;
- treat public/vendor benchmarks as task-shape orientation, not local authority;
- require human/integration-owner acceptance for upgrades;
- downgrade or expire the profile when the evaluated configuration changes.

The evaluated agent may produce evidence and report uncertainty, but it cannot
accept its own upgrade.

## anti-patterns

- Grading only the final prose for a workflow that changes state.
- Treating one successful demo as reliability evidence.
- Selecting the best of many attempts while reporting it as first-pass
  behavior.
- Requiring one exact trajectory when multiple valid strategies exist.
- Allowing response quality to offset a permission or safety violation.
- Using an uncalibrated model judge as the only release gate.
- Sharing mutable fixtures across trials or leaking prior answers through
  caches, files, or history.
- Comparing models with different harnesses, tools, prompts, or budgets and
  attributing the full difference to the model.
- Treating a public benchmark score as proof for the local workload.
- Counting citations, working links, or tool calls as a proxy for factual
  support or research completeness.

## evidence boundary

Official vendor guidance agrees on separating final-response evaluation from
trace/trajectory evaluation and using repeatable datasets. Research benchmarks
support outcome checks, repeated-trial reliability, controlled environments,
and realistic multi-tool tasks. Their task distributions and scores are
volatile, however, so this guide promotes the evaluation structure rather than
any leaderboard result or universal threshold.
