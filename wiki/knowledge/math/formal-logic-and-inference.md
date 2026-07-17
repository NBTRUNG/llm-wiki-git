---
name: formal-logic-and-inference
description: Compact classical-logic guide for formalizing claims, checking propositional and first-order inference, finding countermodels, and routing verifier work.
date_ingested: 2026-07-16
status: active
source_type: primary-and-official-web-research-plus-distilled-practice
source_urls:
  - https://builds.openlogicproject.org/open-logic-complete.pdf
  - https://smt-lib.org/papers/smt-lib-reference-v2.7-r2025-04-09.pdf
  - https://smt-lib.org/examples.shtml
  - https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/
  - https://lean-lang.org/theorem_proving_in_lean4/Quantifiers-and-Equality/
raw_sources:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-formal-logic-and-inference-sources.md
confidence: medium-high
confidence_reviewed: 2026-07-16
revision_trigger: Review after 3-5 real formalization/correctness tasks, a quantifier or solver-semantics failure, or a demonstrated consumer for an excluded logic family.
---

# formal logic and inference

Use this guide when an informal requirement must become a checkable logical
claim, when an inference may be invalid despite sounding plausible, or when a
task needs the right countermodel, solver, or proof checker.

This is a compact classical propositional and first-order logic guide. It does
not create a general logic encyclopedia. Temporal, modal, deontic,
non-monotonic, many-valued, fuzzy, and logic-programming systems stay out of
scope until a real consumer demonstrates the need.

## keep four layers separate

| Layer | Question | Typical artifact |
| --- | --- | --- |
| Syntax | Is the expression well formed, typed, scoped, and capture-free? | Signature, terms, formulas, parser/type-checker output |
| Semantics | What domain, interpretation, assignment, and background theory give the symbols meaning? | Structure/model and valuation |
| Semantic consequence | Is the conclusion true in every model of the premises? | `Gamma |= phi`, validity, satisfiability, countermodel |
| Derivation | Does a named proof system derive the conclusion from the premises? | `Gamma |- phi`, proof term, derivation, checked certificate |

Do not move silently between these layers. A well-formed formula need not be
true. A satisfying model shows possibility, not validity. A derivation is
reliable only relative to a sound proof system. A checked proof can still
formalize the wrong real-world requirement.

### core semantic terms

| Term | Meaning | Operational check |
| --- | --- | --- |
| Satisfiable `phi` | At least one allowed model makes `phi` true. | Find a model/witness. |
| Unsatisfiable `phi` | No allowed model makes `phi` true. | Produce an unsat proof/certificate when the tool supports it. |
| Valid `phi` | Every allowed model makes `phi` true. | Check whether `not phi` is unsatisfiable. |
| Entailment `Gamma |= phi` | Every model satisfying all premises in `Gamma` also satisfies `phi`. | Check whether `Gamma and not phi` is unsatisfiable. |
| Countermodel | A model satisfying `Gamma and not phi`. | It disproves the claimed entailment. |
| Consistent premises | The premises do not derive contradiction in the selected proof system. | For sound and complete classical first-order systems, satisfiability is the semantic counterpart. |

Soundness gives `Gamma |- phi` only if `Gamma |= phi`. Completeness gives the
converse for the selected logic and proof system. Never assume that a specific
automation tactic is complete merely because the underlying logic has a
complete calculus.

## formalization contract

Before proving or solving, record:

```text
Decision or exact natural-language claim:
Logic and background theory:
Domain and whether it is non-empty:
Constants, functions, predicates, sorts/types:
Equality meaning:
Premises Gamma:
Conclusion phi:
Quantifier scope and variable dependencies:
Assumptions/axioms:
Intended observation or policy boundary:
Countermodel query: Gamma and not phi
Verifier and accepted evidence:
```

Then perform these checks:

1. Give each non-logical symbol one stable meaning and arity.
2. Parenthesize connective and quantifier scope; do not rely on prose rhythm.
3. Distinguish a free variable from a universally quantified variable.
4. Substitute only capture-free terms and rename bound variables when needed.
5. Separate premises from the conclusion instead of hiding assumptions inside
   the intended result.
6. State the selected logic, types/sorts, arithmetic, overflow, equality, and
   domain assumptions that a verifier will use.
7. Try `Gamma and not phi` before polishing a proof. A model localizes a gap;
   unsatisfiability supports the entailment within the encoded boundary.

## propositional inference floor

These classical patterns are safe when their premises are established:

| Pattern | Form | Obligation |
| --- | --- | --- |
| Modus ponens | `P -> Q`, `P`, therefore `Q` | Both premises use the same `P` and `Q`. |
| Modus tollens | `P -> Q`, `not Q`, therefore `not P` | `Q` is exactly the consequent, not a stronger neighboring claim. |
| Conjunction introduction | `P`, `Q`, therefore `P and Q` | Both conjuncts hold in the same scope/context. |
| Conjunction elimination | `P and Q`, therefore `P` (or `Q`) | No extra conclusion is imported. |
| Disjunction introduction | `P`, therefore `P or Q` | The disjunction is inclusive unless explicitly modeled otherwise. |
| Cases/disjunction elimination | `P or Q`, `P -> R`, `Q -> R`, therefore `R` | The cases cover the disjunction and reach the same scoped conclusion. |
| Conditional proof | Derive `Q` under assumption `P`, then conclude `P -> Q` | Discharge the temporary assumption and its dependencies. |
| Biconditional | `P <-> Q` | Prove/use both `P -> Q` and `Q -> P`; one direction is insufficient. |

An implication is false only when its antecedent is true and its consequent is
false. Therefore, `P -> Q` being true does not show that `P` occurred, that
`Q` occurred because of `P`, or that `Q -> P`.

## quantified inference floor

| Operation | Safe form | Guard |
| --- | --- | --- |
| Universal elimination | From `forall x, P(x)`, infer `P(t)`. | `t` belongs to the domain and substitution is capture-free. |
| Existential introduction | From `P(t)`, infer `exists x, P(x)`. | `t` is a valid witness in the declared domain. |
| Universal introduction | Prove `P(a)` for an arbitrary/fresh `a`, then infer `forall x, P(x)`. | `a` must not depend on an undischarged special-case assumption. |
| Existential elimination | From `exists x, P(x)`, reason with a fresh witness `a` to a conclusion independent of `a`. | Do not let the witness escape or acquire properties not supplied by `P`. |

Quantifier order records dependency:

```text
forall x, exists y, R(x, y)   # y may depend on x
exists y, forall x, R(x, y)   # one y must work for every x
```

The second statement implies the first under the usual non-empty-domain
semantics, but not conversely. Do not swap the order for readability.

Under classical logic:

```text
not (forall x, P(x))  <->  exists x, not P(x)
not (exists x, P(x))  <->  forall x, not P(x)
```

When using a constructive proof assistant, check whether the desired classical
direction needs an explicit classical principle.

## invalid-inference and countermodel checks

| Suspect pattern | Invalid move | Minimal countermodel idea |
| --- | --- | --- |
| Affirming the consequent | `P -> Q`, `Q`, therefore `P` | Set `P = false`, `Q = true`. |
| Denying the antecedent | `P -> Q`, `not P`, therefore `not Q` | Set `P = false`, `Q = true`. |
| Reversing necessary/sufficient | Treat `P -> Q` as `Q -> P` or as `P <-> Q`. | Seek a case with `Q` true and `P` false. |
| Unlicensed disjunct | `P or Q`, therefore `P` | Set `P = false`, `Q = true`. |
| Examples-to-universal | `P(a1)...P(an)`, therefore `forall x, P(x)` | Search outside the sampled objects. |
| Existential-to-universal | `exists x, P(x)`, therefore `forall x, P(x)` | Use a domain with one satisfying and one failing object. |
| Quantifier swap | `forall x exists y R(x,y)` to `exists y forall x R(x,y)` | Let each `x` require a different `y`. |
| Witness escape | Give an existential witness an identity or property not in the premise. | Build two models with different witnesses but the same premise. |
| Scope drift | Move `not`, `forall`, `exists`, `and`, or `or` across a formula without an equivalence. | Parenthesize both readings and seek a separating valuation/model. |
| Explosion from hidden inconsistency | Accept any conclusion because premises are contradictory. | Check satisfiability of `Gamma` before treating an entailment as useful. |

A failed countermodel search is not itself a proof. Record whether the search
was exhaustive, complete for the selected fragment, or only bounded testing.

## verifier routing

| Claim shape | First verifier | Evidence and boundary |
| --- | --- | --- |
| Small finite propositional formula | Exhaustive truth table | Every valuation checked; exponential growth limits scale. |
| Larger propositional constraint | SAT solver | `sat` gives a model; `unsat` is stronger with a checkable proof/certificate. |
| Typed arithmetic, arrays, bit-vectors, strings, or uninterpreted functions | SMT solver using the smallest correct SMT-LIB logic | Model, unsat core, or proof is relative to the declared theories; integers, reals, bit-vectors, and floating point are not interchangeable. |
| First-order or mathematical theorem needing an auditable proof | Proof assistant/theorem prover | Kernel-checked proof or checked certificate; inspect axioms and match the statement to the requirement. |
| Finite transition invariant or reachability claim | Bounded/exhaustive state exploration or model checker | State encoding, bounds, fairness, and coverage remain explicit. |
| Executable business rule | Type/schema checks plus unit, property, and negative tests | Tests sample executable behavior; they do not establish an unbounded universal claim. |
| Policy, legal, domain, or human-intent meaning | Domain-owner review in addition to a formal verifier | A tool cannot decide whether the symbols capture the intended policy or values. |

For SMT, prefer the smallest logic that faithfully models the problem. Check
validity of `phi` by asking whether `not phi` is satisfiable; check entailment by
asserting `Gamma` and `not phi`. Treat `unknown`, timeouts, unsupported theory,
and bounded search as unresolved—not as `sat`, `unsat`, or proof.

For proof assistants, distinguish:

```text
statement elaborated and type-correct
proof term accepted by the kernel
axioms/classical principles inspected
formal statement reviewed against the real requirement
```

Only the last line closes the formalization gap.

## compact logic handoff

```text
Claim and logic:
Signature/domain/theory:
Premises Gamma and conclusion phi:
Quantifier and substitution guards:
Invalid pattern checked:
Countermodel query and result:
Verifier, version/configuration, and evidence:
Formalization-to-requirement review:
Status: valid | invalid | satisfiable | unsatisfiable | proved | unresolved
Residual uncertainty and revision trigger:
```

## relationship to the rest of Math Pack

- Use [reasoning-navigation.md](reasoning-navigation.md) to choose and bound the
  reasoning path, probes, backtracking, and stopping rule.
- Use [proof-techniques.md](proof-techniques.md) to structure a human-auditable
  proof, invariant, induction, or program-correctness argument.
- Use [discrete-math.md](discrete-math.md) for sets, relations, graphs, state
  transitions, and finite structures.
- Use [probability-statistics.md](probability-statistics.md) when evidence is
  uncertain or statistical; probability is not a substitute for validity.

## anti-patterns

- Treating true, satisfiable, valid, entailed, and derivable as synonyms.
- Omitting the domain, theory, equality, or quantifier scope.
- Claiming validity from one satisfying example or one successful test.
- Claiming an implication proves causation, occurrence, or its converse.
- Reusing an existential witness as though it were arbitrary.
- Accepting `unsat` without checking the asserted formula and selected theory.
- Treating solver timeout or `unknown` as evidence for either side.
- Using a proof assistant result without reviewing imported axioms and the
  correspondence between the formal statement and the intended requirement.
- Expanding into a specialized logic family before a real consumer and
  verifier contract exist.
