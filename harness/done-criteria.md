# done criteria

Work is done only when the request is completed or the blocker is documented.

## universal done criteria

- Request scope was followed.
- Source of truth was identified.
- Allowed write targets were respected.
- Relevant files were updated.
- Task input and output were explicit before implementation.
- Validation was run or explicitly not run with reason.
- Evidence path exists when proof is required.
- Shared implementation names were checked against `docs/contracts.md` when code work touched them.
- Residual risk is documented if any remains.
- Final note states what changed, what was checked, and what was not done.

## not done if

- acceptance criteria are missing;
- task input or output is unclear;
- source of truth is unclear;
- shared function/API/component/CMS names are needed but no contract row exists;
- delegated task is not Atomic, Clear input/output, Idempotent, and Decidable;
- project status was updated only in compiled wiki after repo migration;
- evidence is required but absent;
- old duplicate source-of-truth files remain after migration;
- user asked for wiki/harness work but code project was modified.

## docs-specific done

- Links/paths exist.
- File names match lowercase convention for new files.
- Compiled wiki summaries link back to source files.
- Missing facts are marked `unknown`.
- Conflicts are marked `contradiction`.

## project/code done

- Project docs updated as source of truth.
- Code tasks reference `docs/contracts.md` when shared names are touched.
- Test matrix updated if behavior/proof changed.
- Decision/adr recorded if long-term direction changed.
- Validation report created for normal/high-risk work.
