# DEC-0001 — Link constitution amendments to feedback-loop.md procedure

- **Status:** accepted
- **Date drafted:** 2026-05-23
- **Date accepted:** 2026-05-23
- **Source project:** llm-wiki (governance)
- **Class:** amendment proposal (constitutional)
- **Procedure:** [[../../harness/feedback-loop.md#amendment-proposal]]
- **Applied:** §18 of [[../../llm-wiki-constitution.md]] (paragraph appended); §19 row added 2026-05-23.

## evidence

- `harness/feedback-loop.md` filed 2026-05-23, defining the seven-class backward pass and the amendment-proposal operation.
- `wiki/index.md` known-gaps entry of 2026-05-23 surfacing the gap.
- User session 2026-05-23: six-gap analysis introducing the backward-pass requirement, accepted as the basis for `harness/feedback-loop.md`.

## current state

§18 of `llm-wiki-constitution.md` reads (full text):

> Update this constitution only when a stable law changes:
> - source-of-truth hierarchy;
> - folder roles;
> - project lifecycle;
> - migration rules;
> - checkpoint requirements;
> - evidence standards;
> - agent boundaries.
>
> Do not update it for one-off project details.
>
> Any change to §1–§18 requires a row in §19 changelog with date, scope, and evidence link.

§18 does not yet reference the amendment procedure defined in `harness/feedback-loop.md`. Without that link, the procedure is binding only via the harness file, and a future agent reading the constitution alone would not learn that AI must not self-apply amendments.

## proposed change

Append the following paragraph to the end of §18 (no other changes):

> The procedure for proposing, reviewing, and applying a constitutional amendment lives in [[harness/feedback-loop.md#amendment-proposal]]. Every proposed amendment must: (a) be drafted with a `[PROPOSED]` prefix; (b) be recorded in `wiki/decisions/_index.md` as a pending decision before any edit to this file; (c) be applied only after explicit human acceptance; (d) carry a §19 row with date, scope, and evidence link upon application. AI must not self-apply a constitutional amendment. Proposed amendments that would change §3 source-of-truth hierarchy or §15 checkpoint law require explicit human review before drafting.

## conflict check

Run per [[../../harness/feedback-loop.md#conflict-check]]:

- §1–§17 — no conflict; this is process clarification, not a law change.
- §18 itself — extends, does not replace, the existing §19 changelog rule.
- §19 — on acceptance, add a row dated to that day, scope `feedback-loop.md amendment procedure linkage`, evidence `[[harness/feedback-loop.md]]` + `[[wiki/decisions/DEC-0001-constitution-amendment-feedback-loop-linkage.md]]`.
- Other harness files — `harness/feedback-loop.md` already documents the procedure; this amendment makes it binding for constitution edits.
- Existing decisions register — uses `proposed`/`accepted` status values; this proposal uses `proposed`. No conflict.

## reason this matters

Without the link, the amendment procedure lives only in a harness file, and a future agent could in principle edit `llm-wiki-constitution.md` directly without going through the [PROPOSED] gate. The link makes the procedure self-referential at the constitution level. This is exactly what the §18 "stable law" boundary is for: process governing the constitution itself.

## risk assessment

- Risk lane: high-risk per `harness/feedback-loop.md` classification table (any change to `llm-wiki-constitution.md` is high-risk).
- Blast radius: cosmetic if read, binding if followed. The proposed text imposes a procedure that is already documented in `harness/feedback-loop.md` and already followed by this very draft, so the realized blast radius is zero.
- Reversibility: full. If accepted and later judged wrong, file a new amendment to remove the paragraph.

## action required from human owner

- **Accept** → reply "accept DEC-0001". AI then:
  1. Edits `llm-wiki-constitution.md` to append the proposed paragraph to §18.
  2. Adds the §19 row dated to acceptance day.
  3. Updates this file's Status to `accepted` and Date accepted to acceptance day.
  4. Updates `wiki/decisions/_index.md` table accordingly.
  5. Removes the corresponding entry from `wiki/index.md#known-gaps` "Recently filled" section after the next feedback-loop cycle.
- **Reject** → reply "reject DEC-0001" with reason. AI switches Status to `rejected` and preserves this file under `## rejected` reasoning.
- **Modify** → state the change. AI redrafts and resubmits as DEC-0002 (do not edit DEC-0001 after first submission, per audit trail).

## related

- [[../../harness/feedback-loop.md]] — backward-pass workflow and amendment procedure.
- [[../../harness/feedback-loop.md#stop-conditions]] — stop conditions for amendments that touch §3 or §15.
- [[../index.md#known-gaps]] — gap registry entry.
- [[../../llm-wiki-constitution.md#18-constitution-update-rule]] — target section.
