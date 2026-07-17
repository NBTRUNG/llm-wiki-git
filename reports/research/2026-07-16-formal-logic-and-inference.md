---
name: formal-logic-and-inference-review
description: Bounded primary-source review for a compact classical formal-logic and verifier-routing extension to Math Pack.
date_updated: 2026-07-16
status: promoted
---

# Formal Logic and Inference Review

Topic: Classical formal logic and inference for Math Pack

Date: 2026-07-16

Owner: Codex

Cadence reason: ad hoc; LLMWIKI-092 and FLQ-006

Status: promoted

## decision need

- Decide whether Math Pack needs one compact formal-logic guide, no change, or
  a broader logic folder.
- If promoted, define only the syntax/semantics, validity/satisfiability,
  propositional/first-order inference, fallacy, countermodel, and verifier
  routing needed by real reasoning consumers.
- Target docs: `wiki/knowledge/math/formal-logic-and-inference.md` and the Math
  Pack README.
- Exclusions: temporal, modal, deontic, non-monotonic, many-valued, fuzzy, and
  logic-programming systems; advanced proof theory; solver rankings.

## search/tool bounds

- Budget: four web queries in one batch, then targeted opening/find/click reads
  of returned primary or official sources.
- Source priority: Open Logic Project for classical definitions, SMT-LIB 2.7
  for solver semantics, and official Lean documentation for proof checking.
- Source log expectation: retain complete snapshots and checksums in Agent
  Platform raw; record all four queries and all sources used below.

Queries:

1. `site:builds.openlogicproject.org open logic complete propositional logic validity satisfiability consequence natural deduction first-order logic PDF`
2. `site:lean-lang.org theorem proving in Lean propositions quantifiers tactics official`
3. `site:smt-lib.org official SMT-LIB standard logic satisfiability models`
4. `site:plato.stanford.edu logical consequence validity satisfiability first order logic`

The Stanford query did not add a necessary primary/official source. Research
stopped after the first three source families covered every promotion claim.

## sources checked

| Source | Type | Published/accessed | Relevance | Decision |
| --- | --- | --- | --- | --- |
| [Open Logic Project, complete text](https://builds.openlogicproject.org/open-logic-complete.pdf) | primary open textbook | release 2026-07-12 / accessed 2026-07-16 | Defines syntax/semantics, validity, entailment, satisfiability, soundness/completeness, capture-free substitution, and eigenvariable conditions. | promote stable classical distinctions and guards |
| [SMT-LIB Standard 2.7](https://smt-lib.org/papers/smt-lib-reference-v2.7-r2025-04-09.pdf) | official standard | 2025-04-09 / accessed 2026-07-16 | Defines many-sorted first-order solver language, theories, models, satisfiability, and validity reduction. | promote SMT routing and theory boundary |
| [SMT-LIB examples](https://smt-lib.org/examples.shtml) | official examples | accessed 2026-07-16 | Demonstrates models, unsat, unsat cores, and software-state encodings. | promote evidence shapes, not a solver ranking |
| [Lean: Propositions and Proofs](https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/) | official documentation | Lean 4.26.0 docs / accessed 2026-07-16 | Shows propositions-as-types, introduction/elimination rules, proof terms, and kernel checking. | promote proof-assistant boundary |
| [Lean: Quantifiers and Equality](https://lean-lang.org/theorem_proving_in_lean4/Quantifiers-and-Equality/) | official documentation | Lean 4.26.0 docs / accessed 2026-07-16 | Covers universal/existential constructions and equality in Lean. | promote verifier routing with constructive/classical caveat |

Raw record and snapshots:
`/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-formal-logic-and-inference-sources.md`.

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Syntax, model semantics, semantic consequence, and proof derivation need explicit separation. | high | candidate-update | Formalizing or reviewing a logical claim. | Ordinary prose with no correctness or inference obligation. |
| `Gamma |= phi` can be attacked by seeking a model of `Gamma and not phi`; unsatisfiability supports entailment inside the encoded logic/theory. | high | candidate-update | Truth-table, SAT, SMT, or complete proof-system work. | When the encoding or selected theory is unreviewed. |
| Quantifier rules need scope, capture-free substitution, and fresh/arbitrary witness guards. | high | candidate-update | First-order requirements, policies, contracts, and proofs. | As an excuse to load advanced proof theory. |
| Verifier routing should distinguish truth tables/SAT, SMT, proof assistants, bounded state exploration, executable tests, and human semantic review. | high | candidate-update | A claim has a formal or executable acceptance path. | As a claim that one tool proves every layer. |
| A new folder and specialized logic-family guides are justified now. | low | reject | No demonstrated independent consumers. | Current task. |

## claim-support checks

| Claim | Importance | Source | Accessible | Relevant | Supports stated strength | Conflict/freshness | Decision |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Validity, entailment, and satisfiability are model-theoretically distinct. | high | Open Logic Project; SMT-LIB 2.7 | yes | yes | yes | stable classical definitions | promote |
| Derivability and entailment are linked by soundness/completeness, not identical by notation alone. | high | Open Logic Project | yes | yes | yes | depends on selected proof system | promote with qualification |
| Validity can be reduced to unsatisfiability of the negation in the selected theory. | high | SMT-LIB 2.7 | yes | yes | yes | requires negation-closed class and faithful theory | promote with boundary |
| Quantifier introduction/elimination can ignore witness freshness and substitution capture. | high | Open Logic Project; Lean quantifier docs | yes | yes | no | sources explicitly retain conditions/construction obligations | reject unsafe claim; promote guards |
| Proof-assistant acceptance proves the real-world requirement. | high | Lean docs plus existing Math Pack boundary | yes | yes | no | kernel checks the encoded proposition, not intent | reject; require semantic review |
| Math Pack needs multiple new logic subpacks. | medium | none | n/a | no | no | no demonstrated consumers | reject |

## stop record

- Unresolved decision before the final probes: whether SMT and proof-assistant
  routing needed separate guides or could live in one bounded file.
- What the final probes could have changed: incompatible semantics or enough
  independent workflow detail could have justified multiple files.
- Why research stopped: Open Logic, SMT-LIB, and Lean agreed on the key layer
  boundaries; targeted reads added no second independent consumer or reason to
  create a folder. All promotion claims had direct support.
- Remaining uncertainty: actual reporting cost and whether agents apply the
  quantifier/countermodel guards correctly remain unmeasured.

## decision analysis

- Objective: reduce invalid inference and verifier misuse while keeping Math
  Pack small and trigger-based.
- Constraints/assumptions: one file, classical propositional/FOL scope, primary
  or official sources, no solver benchmark, and no advanced-logic consumer.
- Baseline: `proof-techniques.md` handles proof structure and
  `reasoning-navigation.md` handles bounded search, but neither owns a compact
  syntax/semantics/inference/verifier contract.
- Promoted option: add one `formal-logic-and-inference.md` guide and one README
  route.
- Pros: closes a specific gap; gives agents countermodel queries and quantifier
  guards; routes tools without duplicating full proof guidance.
- Cons: adds another conditional read and some overlap in claim normalization;
  static guidance may not prevent modeling mistakes without real-task use.
- Alternative: extend `proof-techniques.md`. It avoids a file, but would mix
  proof-writing with model semantics, invalid inference, and solver selection,
  making both routes broader.
- Evidence/uncertainty: definitions and tool boundaries are strongly supported;
  usefulness and reporting cost remain empirical.
- Sensitivity/revision trigger: merge or shorten the guide if 3-5 real tasks do
  not use its distinct checks; add a specialized logic guide only when a named
  consumer, formal semantics, and verifier contract require it.

## impact on LLM-Wiki

- Canonical doc added: `wiki/knowledge/math/formal-logic-and-inference.md`.
- Router updated: `wiki/knowledge/math/README.md`.
- Project state affected: feedback-loop queue, task ledger, test matrix,
  project status/current direction, active/TICK, report indexes.
- No real repo, runtime, solver integration, or new template is changed.

## reviewer decision

- Decision: promote.
- Reason: one bounded file fills a demonstrated logic/verifier gap with direct
  primary/official support and preserves explicit exclusions.
- Validation report:
  `reports/validation/2026-07-16-formal-logic-and-inference.md`.

## next review

- Review after 3-5 real formalization/correctness tasks, a quantified-inference
  failure, or a demonstrated consumer for an excluded logic family.
- Watchlist row: none; empirical follow-up remains in project task/status state.
