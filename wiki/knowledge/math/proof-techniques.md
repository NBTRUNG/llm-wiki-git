---
name: proof-techniques
description: Guidance for expressing precise claims, selecting proof methods, writing auditable arguments, and connecting proofs to program correctness.
date_ingested: 2026-07-01
status: active
source_type: web-research-plus-distilled-practice
source_urls:
  - https://ocw.mit.edu/courses/6-1200j-mathematics-for-computer-science-spring-2024/
  - https://builds.openlogicproject.org/open-logic-complete.pdf
  - https://lean-lang.org/theorem_proving_in_lean4/
  - https://softwarefoundations.cis.upenn.edu/current/lf-current/index.html
confidence: medium
confidence_reviewed: 2026-07-10
revision_trigger: Review after a failed proof/correctness task, a formal-verification project, or evidence that agents still hide assumptions or skip proof obligations.
---

# proof techniques

Use this guide when an agent must turn an informal requirement into a precise
claim, explain why a conclusion follows, prove a program property, or review
someone else's argument.

A proof is not long reasoning-shaped prose. It is a checkable dependency from
accepted premises to a scoped conclusion.

## two-layer output

Keep two layers distinct:

1. **Proof core**: definitions, assumptions, quantified claim, lemmas, justified
   steps, and conclusion.
2. **Explanation layer**: motivation, intuition, examples, diagrams, and why the
   selected method fits the reader's problem.

The explanation may make a proof easier to understand, but it cannot replace a
missing proof step. Conversely, a formally valid skeleton may still need plain
language that names the objects and purpose.

For AI output, expose the auditable argument and evidence. Do not treat hidden
chain-of-thought, model confidence, or length as proof.

## normalize the statement first

Before proving anything, write:

```text
Universe/domain:
Objects and types:
Definitions and equality rule:
Units or dimensions:
Given facts:
Assumptions:
Quantifiers:
Claim/goal:
Scope and exclusions:
```

If any field changes during the proof, stop and restate the claim. Proving a
nearby easier statement is not proving the original requirement.

### common logical forms

| Informal wording | Logical obligation | Proof consequence |
| --- | --- | --- |
| For every valid `x`, `P(x)` holds | `forall x in D, P(x)` | Let `x` be arbitrary; do not use a property absent from `D`. |
| There is an `x` with `P(x)` | `exists x in D, P(x)` | Give a witness and verify it belongs to `D` and satisfies `P`. |
| If `P`, then `Q` | `P -> Q` | Assume `P`; derive `Q`. The converse is a different claim. |
| `P` only if `Q` | `P -> Q` | `Q` is necessary for `P`. Do not reverse it. |
| `P` if `Q` | `Q -> P` | `Q` is sufficient for `P`. |
| `P` if and only if `Q` | `P <-> Q` | Prove both `P -> Q` and `Q -> P`. |
| Not every `x` satisfies `P` | `exists x, not P(x)` | One valid counterexample is enough. |
| No `x` satisfies `P` | `forall x, not P(x)` | Rule out every valid witness. |

Name whether a condition is necessary, sufficient, or both. Many incorrect
arguments prove a converse, silently change `forall` to `exists`, or test a few
examples and claim universality.

## claim hierarchy

Use small named claims so dependencies remain visible:

| Claim type | Role |
| --- | --- |
| Definition | Fixes the meaning of a term or relation. |
| Assumption/axiom | Accepted starting point for this argument. |
| Lemma | Reusable intermediate result. |
| Main proposition/theorem | Exact result being established. |
| Corollary | Immediate consequence of an established result. |
| Conjecture/hypothesis | Plausible but not yet proved. |
| Counterexample | Valid object that falsifies a universal claim. |

Never label a conjecture as a lemma just because examples support it.

## choose the proof method from the claim

| Method | Use when | Required obligations |
| --- | --- | --- |
| Direct proof | Definitions and known facts lead to the goal. | Each transformation preserves meaning and cites its premise. |
| Construction | Existence is claimed. | Build a witness, prove validity, then prove the required property. |
| Contrapositive | `not Q -> not P` is simpler than `P -> Q`. | State that the contrapositive is logically equivalent. |
| Contradiction | Assuming the negation creates an impossible result. | Identify the exact contradiction and the rule it violates. |
| Cases | The domain splits into distinct categories. | Prove coverage and handle every case; overlaps are allowed only when harmless. |
| Induction | Claim ranges over natural steps, recursion, or structures. | Base case, induction hypothesis with scope, and preservation step. |
| Strong/structural induction | A step depends on several earlier cases or substructures. | Use only smaller/well-founded cases and prove termination of the dependency. |
| Equivalence | Two descriptions or implementations should mean the same thing. | Prove both directions or a shared canonical form. |
| Bounds | Exact value is unnecessary but a safe range is needed. | State lower/upper bounds and when equality can occur. |
| Invariant | State evolves through a loop or workflow. | Initialization, preservation, and implication at termination. |
| Well-founded descent | A process must terminate. | Give a measure that is bounded below and strictly decreases. |

Do not select contradiction merely because it sounds rigorous. Prefer the
method that makes assumptions and obligations easiest to inspect.

## proof-writing protocol

1. State one precise claim.
2. Expand definitions needed by the claim.
3. Separate givens from assumptions introduced for the proof method.
4. Select a method and list its proof obligations.
5. Prove small lemmas before the main dependency chain becomes crowded.
6. Justify every non-obvious step from a definition, premise, earlier result,
   valid algebraic transformation, or checked computation.
7. Search for a counterexample at domain boundaries and outside each used
   assumption.
8. Close the proof by restating exactly what was established and under which
   assumptions.
9. Mark remaining conjectures, unverified computations, or domain questions.

Use this compact proof ledger when the argument is complex:

| Step | Claim | Justification | Depends on | Status |
| --- | --- | --- | --- | --- |
| 1 | | definition / assumption / lemma / computation | | proved / tested / open |

The ledger is not mandatory prose. It is a tool for exposing dependency gaps.

## counterexample discipline

Try to falsify the claim before polishing the proof.

- For a universal claim, test empty, singleton, boundary, maximal, malformed,
  adversarial, and reordered cases.
- For an implication, look for `P` true and `Q` false.
- For an equivalence, attack both directions separately.
- For uniqueness, search for two distinct valid witnesses.
- For monotonicity, compare adjacent and boundary inputs.
- For an invariant, inspect initialization, every transition type, error paths,
  retries, cancellation, and concurrent interleavings.

A failed counterexample search is evidence of effort, not proof. A valid single
counterexample is a proof that a universal statement is false.

## program-correctness translation

Translate a software claim into:

```text
Input domain:
Precondition:
State and transition relation:
Invariant:
Postcondition:
Termination measure:
Failure behavior:
Observable side effects:
```

### loop and workflow invariants

To establish total correctness:

1. **Initialization**: the invariant holds before the first transition.
2. **Preservation**: every allowed transition keeps it true.
3. **Termination**: a bounded measure progresses toward completion.
4. **Exit implication**: invariant plus exit condition implies the
   postcondition.

Tests should map to these obligations. A happy-path test may show one execution;
it does not prove preservation across all valid states.

### refactor equivalence

For a behavior-preserving refactor, define the observation boundary:

```text
same accepted inputs
same returned values/errors
same persistent state changes
same externally visible ordering where required
same permission and audit behavior
```

Internal steps may differ. Prove equivalence at the named boundary rather than
requiring identical implementation traces.

## worked software proof skeleton

Claim: a stable deduplication function returns the first occurrence of every
distinct input value, in original order, exactly once.

```text
Definition: equality is the domain's canonical equality relation.
Precondition: input is a finite sequence.
Invariant after processing prefix i:
  output contains exactly the distinct values in input[0:i],
  ordered by their first occurrence.
Initialization:
  for the empty prefix, output is empty, so the invariant holds.
Preservation:
  if next value was seen, output is unchanged;
  otherwise append it, preserving uniqueness and first-occurrence order.
Termination:
  i increases by one and is bounded by input length.
Conclusion:
  at i = len(input), the invariant is the required postcondition.
```

This argument still depends on the implementation using the same equality
relation and updating `seen` and `output` consistently. Tests should target
those assumptions and the empty/repeated/all-unique cases.

## review checklist

- Are all terms, domains, units, and equality rules defined?
- Does the conclusion keep the same quantifiers and scope as the claim?
- Are necessary and sufficient conditions oriented correctly?
- Does every case split cover the full domain?
- Is any step circular or dependent on the desired conclusion?
- Does algebra divide by a value that might be zero, change inequality
  direction, lose precision, or ignore units?
- Does induction prove a valid base and use only the stated hypothesis?
- Does a program proof cover failures, side effects, and termination?
- Are computed or benchmarked facts reproducible and separated from deductive
  steps?
- Are proof-assistant statements faithful to the real requirement?
- Is the final claim stronger than the evidence permits?

## verification ladder

Use the strongest practical independent check:

```text
type/schema checker
unit and negative tests
property-based or fuzz tests
symbolic/algebraic checker
model checker or proof assistant
independent implementation/solver
domain-expert or human mathematical review
```

These checks complement the proof. A verifier can confirm a formal statement
while the formal statement still models the wrong requirement.

## anti-patterns

- Starting a proof before defining the claim and domain.
- Replacing a universal proof with several examples.
- Assuming the converse of a proved implication.
- Hiding a critical premise behind words such as "obvious" or "clearly."
- Changing definitions or equality halfway through an argument.
- Proving partial correctness while claiming termination.
- Treating comments, tests, model confidence, or majority vote as formal proof.
- Producing a long explanation whose individual steps have no cited premise.
- Using formal notation to make an unsupported claim look rigorous.

