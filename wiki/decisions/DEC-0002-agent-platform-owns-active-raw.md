# DEC-0002 - Make Agent Platform the owner of active raw artifacts

- **Status:** accepted
- **Date drafted:** 2026-07-10
- **Date accepted:** 2026-07-10
- **Source project:** llm-wiki (governance)
- **Class:** amendment proposal (constitutional)
- **Procedure:** [[../../harness/feedback-loop.md#amendment-proposal]]
- **Applied:** section 4 of [[../../llm-wiki-constitution.md]]; section 19 row
  added 2026-07-10.

## evidence

- The existing boundary already routes Agent Platform artifacts to
  `/home/admindebian/Agent-Platform/raw/projects/<project-id>/` in
  `wiki/projects/llm-wiki/docs/source_of_truth_rules.md`.
- `index.md` and the 2026-07-06 Agent Platform externalization record already
  assign raw snapshots and derived artifacts to Agent Platform.
- The human owner explicitly corrected the active raw destination to
  `/home/admindebian/Agent-Platform/raw/` on 2026-07-10.

## accepted change

Replace the local `raw/` row in section 4 with two explicit roles:

- `raw/` is a legacy imported/reference holding area only and receives no new
  active raw records.
- `/home/admindebian/Agent-Platform/raw/projects/<project-id>/` owns active raw
  source records, snapshots, manifests, and extracted artifacts.

No source-of-truth precedence or checkpoint rule changes.

## conflict check

- Section 3: unchanged; current raw still outranks synthesis when validating a
  claim, regardless of storage location.
- Sections 6-9: unchanged; this does not alter project lifecycle or migration.
- Section 15: unchanged; checkpoint law remains intact.
- Section 17: unchanged; the public boundary still excludes private/raw
  material without review.
- `program.md`, `harness/feedback-loop.md`, maps, and local raw README files
  require projection updates after acceptance.

## mathematical trade-off review

- **Objective:** maintain one active owner for raw artifacts while preserving
  traceability from canonical knowledge to source evidence.
- **Baseline:** continue allowing active raw records under both LLM-Wiki and
  Agent Platform.
- **Pros:** removes duplicate ownership; reduces the number of valid storage
  states; makes path selection deterministic by project ID; simplifies drift
  and duplicate checks.
- **Cons:** agents need access to a second filesystem root; historical local
  raw paths require migration or an explicit legacy classification.
- **Constraints and uncertainty:** no historical legacy holdings are deleted;
  only the three active research source records identified in this task are
  migrated. Other legacy files may need a later inventory.
- **Revision trigger:** reconsider the boundary if Agent Platform becomes
  unavailable to normal research workflows or cannot preserve immutable,
  project-namespaced source records.

## approval

The current human instruction explicitly selects Agent Platform raw ownership.
After this proposed record is registered, that instruction is sufficient to
accept and apply this amendment in the same work session.

Accepted and applied on 2026-07-10. Validation evidence:
[[../../reports/validation/2026-07-10-raw-boundary-recommendation-tradeoffs.md]].
