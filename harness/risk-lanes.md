# risk lanes

Risk lane decides how much planning and validation is required.

## tiny

Use for:

- typo/copy/link fixes;
- small docs cleanup;
- adding a missing pointer;
- low-risk template edits.

Requires:

- direct edit allowed;
- quick verification;
- short final note.

## normal

Use for:

- story-sized docs or code work;
- clear behavior change;
- new template or harness section;
- project planning updates with known scope.

Requires:

- task packet or clear task section;
- acceptance criteria;
- validation plan;
- source-of-truth update;
- evidence or documented missing proof.

## high-risk

Use for work touching:

- auth/authz;
- data model or migration;
- security/privacy;
- public api contract;
- shared cross-agent contract names;
- external provider;
- deployment/rollback;
- many modules;
- source-of-truth migration;
- deleting files.

Requires:

- explicit plan;
- stronger validation;
- decision/adr if direction changes;
- residual risk note;
- user confirmation when ambiguous.

## hard gates

Automatically high-risk if:

- data can be lost;
- source-of-truth can be duplicated or deleted incorrectly;
- shared contracts are changed without a recorded decision;
- validation is being reduced;
- project phase migration is happening;
- security posture changes.
