---
name: reasoning-navigation
description: A bounded reasoning controller for selecting a method, exploring candidate paths, using verifier feedback, backtracking, and stopping or escalating with an auditable state.
date_ingested: 2026-07-12
status: active
source_type: official-research-plus-distilled-practice
source_urls:
  - https://deepmind.google/blog/ai-solves-imo-problems-at-silver-medal-level/
  - https://openai.com/index/improving-mathematical-reasoning-with-process-supervision/
  - https://ai.meta.com/research/publications/astro-teaching-language-models-to-reason-by-reflecting-and-backtracking-in-context/
  - https://ai.meta.com/blog/ai-math-theorem-proving/
  - https://www.microsoft.com/en-us/research/project/lean/
raw_sources:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-12-math-reasoning-navigation-sources.md
confidence: medium
confidence_reviewed: 2026-07-12
revision_trigger: Review after 3-5 reasoning-heavy tasks, a repeated search/backtracking failure, or evidence that the router adds cost without improving falsification, verification, or stopping decisions.
---

# reasoning navigation

Use this guide when an agent knows several reasoning tools but needs to choose
the next useful one, recover from a failed path, or decide that the current
evidence is enough.

This is an execution-time reasoning controller, not a model-training recipe and
not a request to expose private chain-of-thought. Record only the compact,
auditable claims, alternatives, probes, evidence, and decisions needed by a
reviewer.

## core loop

```text
define the decision or claim
  -> classify the problem shape
  -> choose a method and verifier
  -> create a small candidate frontier
  -> predict observable evidence for each live candidate
  -> run one discriminating probe
  -> compare result with prediction
  -> keep, revise, falsify, or backtrack
  -> verify the surviving result
  -> stop, decide, or escalate
```

The loop is bounded. More search is justified only when the next probe can
change the conclusion, eliminate a live alternative, or reduce material
uncertainty.

## classify before solving

| Problem shape | Primary method | Continue with |
| --- | --- | --- |
| A universal, existence, implication, equivalence, invariant, or termination claim | Deductive proof and counterexample search | [proof-techniques.md](proof-techniques.md) |
| Several plausible explanations for an observed failure | Abductive hypothesis comparison | This guide plus the bug-fix workflow |
| A noisy rate, forecast, evaluation, or uncertain observation | Statistical inference and measurement | [probability-statistics.md](probability-statistics.md) and [functions-rates-and-measurement.md](functions-rates-and-measurement.md) |
| A claim that one change caused an outcome | Causal model and controlled comparison | [probability-statistics.md](probability-statistics.md#causal-reasoning-guard) |
| A choice among feasible alternatives | Constraints, objective vector, sensitivity, and decision rule | [optimization.md](optimization.md) and [functions-rates-and-measurement.md](functions-rates-and-measurement.md) |
| Dependencies, ordering, state transitions, reachability, or cycles | Sets, relations, graphs, state machines, and invariants | [discrete-math.md](discrete-math.md) |
| Approximation, floating point, accumulated error, or numerical stability | Error model and precision analysis | [numerical-methods.md](numerical-methods.md) |

Some tasks need more than one mode. Name the transition, such as “deductive
contract first, empirical performance measurement second.” Do not use a
benchmark to prove a universal correctness claim or a proof of complexity to
claim measured production speed.

## normalize the live state

Before opening branches, record:

```text
Decision or exact claim:
Objects/domain and definitions:
Constraints and invariants:
Known facts with sources:
Assumptions:
Unknowns that could change the result:
Selected reasoning mode:
Verifier or observable acceptance evidence:
Search/probe budget and escalation boundary:
```

If the claim, domain, or acceptance evidence changes, restate the state. Do not
quietly solve an easier neighboring problem.

## candidate frontier

Keep a small explicit set of mutually distinguishable candidates. A candidate
may be a proof construction, bug hypothesis, causal explanation, model,
algorithm, or decision option.

```text
Candidate:
Why it is plausible:
Required assumptions:
Prediction if true:
Evidence that would weaken or falsify it:
Cheapest discriminating probe:
Status: live | supported | weakened | falsified | verified | blocked
```

Prefer candidates that make different predictions. Ten differently worded
versions of the same explanation are one branch, not ten independent ideas.
Expand the frontier only when current candidates fail to explain the evidence
or a new fact introduces a genuinely different mechanism.

## choose the next probe

A useful probe has decision value. Before running it, state:

```text
Question answered:
Candidate outcomes distinguished:
Expected observation under each candidate:
Cost, side effects, and reversibility:
Result that triggers stop, backtrack, or escalation:
```

Prefer, in order:

1. a deterministic verifier or invariant check;
2. a minimal counterexample or controlled reproduction;
3. a targeted observation that separates live candidates;
4. a broader search only after local discriminating probes are exhausted.

A probe that would produce the same interpretation under every live candidate
does not reduce uncertainty. Do not run it merely because the tool is
available.

## verifier feedback

Use verifier output as evidence about a named obligation:

- A proof assistant verifies the formalized statement, not automatically the
  real-world requirement.
- A unit or property test verifies sampled/executable behavior within its
  fixture and oracle.
- A compiler or type checker verifies its declared static properties.
- A benchmark measures a pinned workload and environment.
- Human/domain review checks meaning, assumptions, applicability, and values
  that tools cannot decide.

When a verifier rejects a candidate, localize the failed obligation. Revise the
candidate only if the failure exposes a repairable gap; otherwise mark it
falsified and backtrack. Never edit the verifier or weaken the acceptance rule
solely to make the candidate pass.

## backtracking discipline

Backtrack when:

- a required assumption is false;
- a predicted observation fails;
- a valid counterexample breaks the claim;
- the path violates a hard constraint;
- the verifier rejects a central obligation;
- the path consumes budget without producing new discriminating evidence.

On backtrack, preserve a compact record:

```text
Rejected path:
Failure evidence:
Assumption or step invalidated:
Reusable fact retained:
Next live candidate:
```

Do not restart from zero or revisit a rejected path unless new evidence changes
the invalidated premise.

## stopping and escalation

Stop successfully when the exact claim or decision has the required verifier,
all hard constraints hold, material counterexamples have been attempted, and
remaining uncertainty is below the decision’s stated tolerance.

Stop as disproved when one valid counterexample defeats a universal claim or a
hard constraint makes an option infeasible.

Stop as unresolved and escalate when:

- the remaining candidates cannot be distinguished with current access;
- the next probe needs new authority, data, runtime, budget, or domain review;
- sources or verifiers conflict and the conflict affects the decision;
- the search budget is exhausted without a new high-value probe;
- the cost or risk of being wrong exceeds the available evidence.

Report unresolved work precisely. “Unknown because X is unavailable” is more
useful than a forced conclusion.

## compact reasoning handoff

```text
Claim/decision:
Reasoning mode:
Verified facts:
Live assumptions:
Candidates considered:
Counterexample/falsification attempt:
Verifier and result:
Backtracks and retained facts:
Conclusion status: proved | measured | inferred | disproved | unresolved
Residual uncertainty:
Stop/escalation reason:
```

## relationship to large-scale mathematical AI

Research systems have demonstrated a recurring pattern: a learned model
proposes promising steps, search explores alternatives, a formal or executable
system verifies results, and feedback improves later proposals. LLM-Wiki uses
the operational lesson, not the training infrastructure:

- bounded candidate search rather than unlimited generation;
- verifier-backed progress rather than persuasive prose;
- explicit backtracking rather than silently replacing a failed argument;
- step-level audit artifacts without requiring hidden chain-of-thought;
- human review when formalization or domain meaning remains uncertain.

## anti-patterns

- Choosing a favorite solution before defining the claim or verifier.
- Generating many branches without predictions that distinguish them.
- Treating self-critique or majority vote as an independent verifier.
- Repeating broad search after it stops producing new evidence.
- Hiding a failed path and presenting the surviving path as inevitable.
- Changing the goal, fixture, prompt, or grader after seeing the result.
- Reporting model confidence as probability or proof.
- Continuing because budget remains rather than because a useful probe exists.

