---
name: bounded-change-fast-path
description: Shared low-risk execution mode for small, well-bounded changes inside Real Repo Work.
date_created: 2026-07-11
date_updated: 2026-07-11
status: active
---

# Bounded Change Fast Path

## purpose

Reduce reading, routing, and reporting cost for small well-defined repo changes
without weakening source-of-truth, capability, security, or evidence gates.

This is an execution mode inside `Real Repo Work`, not a new catalog workflow.
Use one shared rule plus a thin repo-owned profile; do not create separate Tiny
UI, Tiny API, Tiny Data, or Tiny Content workflows.

## composition

```text
LLM-Wiki shared invariant
  -> repo Bounded Change Profile
    -> exact task packet and local map anchors
      -> targeted execution and evidence
```

If there are `R` repos and `D` work domains, duplicating domain rules per repo
grows approximately as `R × D`. A shared invariant plus repo profiles grows
approximately as `R + D` and keeps local source ownership intact.

## entry predicate

Use the fast path only when all material conditions are true:

```text
FastPath = clear_scope
        AND low_risk
        AND bounded_surfaces
        AND stable_contracts
        AND simple_rollback
        AND cheap_decidable_validation
        AND capability_fit
```

Typical candidates are a small UI/copy/config/internal-code/test/docs change
with exact targets and acceptance criteria. `Tiny` is not sufficient by itself.

## required behavior

1. Start at repo `AGENTS.md` and apply its profile/capsules.
2. Confirm task ownership or that the human/Lead waived a claim.
3. State exact output, allowed writes, invariants, and validation.
4. Read local map anchors named by the task; do not read whole maps by default.
5. Search for exact symbols/selectors/routes first and read bounded surrounding
   regions. Read a whole large file only when a named trigger requires it.
   When the repo uses stable panel/component comments, search those markers;
   do not rely on manually maintained line offsets.
6. Load the capability-appropriate coding floor for code-facing work:
   `P1-BOUNDED-CODING` when the task assigns that approved projection, or the
   full Coding Pack for eligible `P2` work. Repo-local maps may replace broad
   source/domain exploration; they never replace the coding floor. Add only
   specialist packs triggered by the decision/risk.
7. Make the smallest coherent change and run the smallest meaningful verifier.
8. Report reads, escalation decisions, evidence, skipped checks, and residual
   risk. State `semantic map impact: none` or the exact stable ID/row changed.
   Distinguish direct LLM-Wiki knowledge, indirect projection, and repo-local
   knowledge.

## mandatory escalation

Exit to full Real Repo Work or a narrower specialist workflow when any of these
appears:

- architecture, public contract, data ownership/schema/migration, auth,
  permissions, sensitive data, secret, dependency, deployment, or live-system
  mutation;
- unclear source of truth, ownership, rollback, or acceptance criterion;
- cross-workflow/cross-module effects exceed the declared packet;
- unexpected failures, conflicting evidence, or repeated rework;
- the repo profile requires deeper reading or specialist/human review;
- the assigned capability/projection no longer fits.

Escalation is correct routing, not fast-path failure. Preserve the current
evidence and explain the trigger.

## budgets and measurement

LLM-Wiki does not impose one global line/file/time cap because repositories
differ. Every repo profile may define empirical warning thresholds. Until it
does, apply these invariants:

- targeted reads before full-file reads;
- record actual lines/files and real timestamps when available;
- explain every full read of a large surface;
- treat a budget overrun as a review signal, not proof of waste;
- never invent missing timing/token measurements.

Compare outcome acceptance, first-edit time, task-specific reads, rework,
scope violations, validation strength, and report cost across repeated similar
tasks. Keep the fast path only when resource use improves without degrading
quality or safety.

## ownership

LLM-Wiki owns this shared invariant. Each real repo owns its profile: mandatory
entry files, map routes, build/test commands, warning thresholds, forbidden
targets, local escalation triggers, and acceptance owner. A repo profile may be
stricter but must not silently weaken this invariant.

Template: `../../../templates/bounded_change_profile.template.md`.
