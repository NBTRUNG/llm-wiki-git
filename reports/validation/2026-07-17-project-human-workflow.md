# Project Human Workflow Validation

Date: 2026-07-17
Task: LLMWIKI-094
Status: passed for static/bootstrap and TAO projection checks; natural manual
execution remains `needs-review`.

## outcome

Every newly bootstrapped project now receives one project-owned manual operator
entrypoint. Repo-backed projects default to `HUMAN.md`; pre-repo projects use
`docs/human_workflow.md`. An existing equivalent filename is allowed only when
the repo README names it as the single entrypoint.

TAO keeps its already-created `human.md`. It now includes the requested exact
hosts command, HTTPS URL, published bootstrap login plus immediate password
rotation, expected local certificate warning, safe start/stop/status/smoke
commands, five Docker volume mountpoints and meanings, test/evidence sequence,
and destructive/recovery boundaries.

## impact and ROI

- Canonical: `wiki/knowledge/project-docs/human_workflow.md`, project bootstrap
  harness/workflow.
- Projection: template, AGENTS template maintenance rule, human map, TAO README,
  `human.md`, AGENTS, STATUS, and runtime inventory.
- Evidence: this report, task/test rows, registry, and TAO-local validation.
- ROI: one short operator file reduces dependence on agent memory and scattered
  README/status fragments. A link-first entrypoint limits duplication and
  requires updates only when human-visible operation changes.
- Blast radius: new-project scaffolding plus one explicitly requested live repo;
  no automatic backfill of older repos.

## checks

- Template and canonical guide exist and are routed from project bootstrap.
- Bootstrap requires README discoverability and known-or-`unknown` operational
  facts.
- Lint asserts the guide, template, bootstrap section, persistent-data section,
  and AGENTS maintenance projection.
- TAO entrypoint contains exact access, credential rotation, lifecycle, volume,
  test, evidence, and destructive-boundary text.
- Docker inspection matched all five documented mountpoints; six containers
  were running and the documented HTTPS smoke command returned `200`.
- LLM-Wiki feedback-loop lint passed with `0` failures and `0` warnings.
- TAO compose file, containers, volumes, database, and `/etc/hosts` were not
  changed by this work.
- The only documented password is TAO's already-published evaluation bootstrap
  default and it is paired with immediate rotation; no real secret was added.

## remaining evidence

- Human opens TAO, rotates `admin` and `demo01`-`demo05` passwords, and reports
  any ambiguous or missing manual step.
- Clean checkpoint and backup/restore rehearsal remain separate TAO tasks; this
  documentation does not claim they passed.

## Workflow used

Project Bootstrap change-impact review plus Bounded Change Fast Path for the
TAO repo documentation projection. No deviations.
