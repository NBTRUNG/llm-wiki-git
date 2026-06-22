# Karpathy Guidelines APG File-Back Validation

Date: 2026-06-20

## Scope

Integrated reusable guidance from `/home/admindebian/UniversityWeb/docs/apg.md`
into `wiki/knowledge/coding/karpathy-guidelines.md`.

## Source

- Existing canonical guide: `wiki/knowledge/coding/karpathy-guidelines.md`
- Project source document: `/home/admindebian/UniversityWeb/docs/apg.md`

## Changes

- Kept `karpathy-guidelines.md` as the canonical reusable guide.
- Converted the APG additions to English for better agent portability.
- Added classical correctness tools:
  - invariants;
  - Hoare-style preconditions/postconditions;
  - stepwise refinement.
- Added reusable agentic coding guidance:
  - spec first, code second;
  - single source of truth for duplicated behavior;
  - boundary validation and intentional fallback handling;
  - intent-oriented naming;
  - SQL/data-access safety;
  - anti-patterns;
  - submit checklist;
  - delegated phase report shape.
- Preserved UniversityWeb-specific details as source context only; project-specific
  routing, endpoint, CMS, and seeder rules remain in the UniversityWeb repo.

## Validation

Command:

```sh
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## Notes

`git diff` was not available because `/home/admindebian/LLM-Wiki` is not a Git
repository in this workspace.
