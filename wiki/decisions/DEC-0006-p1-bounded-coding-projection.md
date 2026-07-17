---
id: DEC-0006
title: Adopt one cross-repo P1 bounded coding projection
status: accepted
date: 2026-07-11
source_project: llm-wiki
---

# DEC-0006: Adopt one cross-repo P1 bounded coding projection

## context

Bounded Change Fast Path reduced source-reading cost, but its statement that
repo-local maps may be sufficient for routine work could be read as permission
to skip the Coding Pack. A UniversityWeb-U17 agent then assembled a few repo
guides and partial Coding Pack reads and reported that as a pack projection.

The canonical capability rules already forbid agent-authored projections, but
there was no named, validated `P1` coding projection that a task could assign.

## options considered

### option A: require the full Coding Pack for every coding task

- Pros: one existing source set; strongest direct context; simple eligibility.
- Cons: high fixed reading cost for tiny bounded work; lower-tier agents may be
  overloaded; weakens the practical value of capability projections.

### option B: create coding projections per repo or task domain

- Pros: highly tailored context and local examples.
- Cons: projection count grows approximately with repos multiplied by domains;
  duplicated rules drift; agents and reviewers must resolve many identities.

### option C: one canonical P1 coding core plus repo coordinates

- Pros: one safety/output/test floor; repo-specific paths and commands remain
  local; growth is one shared core plus thin repo profiles; task identity is
  deterministic.
- Cons: the core needs review whenever a mandatory full-pack rule changes; a
  compact projection contains less explanatory depth than the full pack.

## decision

Select option C.

- `P1-BOUNDED-CODING` is the canonical cross-repo projection for qualified
  `C2-C3` bounded coding work.
- `wiki/knowledge/coding/bounded-coding-core.md` is its normative content.
- Repo profiles, maps, and capsules provide coordinates and stricter local
  constraints; they do not replace or fork the projection.
- Fast Path reduces source/domain exploration, not the coding safety floor.
- Partial reads of full-pack files must be reported as partial, never as a full
  load or as `P1-BOUNDED-CODING`.
- Risk or scope escalation adds specialist packs or hands off to a qualified
  `P2` agent using the full Coding Pack.

## consequences

- Task and result templates gain an exact projection ID/source and separate
  full-pack versus projection reporting.
- Existing repos are not mass-backfilled. New or renewed packets can point to
  the shared projection without copying its rules.
- The projection must be checked whenever a mandatory Coding Pack constraint
  changes.

## review condition

Review after three to five comparable bounded coding tasks, a projection-drift
incident, a false eligibility decision, or a material change to Coding Pack
security/output/test/agent-risk constraints.
