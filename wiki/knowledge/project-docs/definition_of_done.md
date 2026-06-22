---
name: definition-of-done
description: Turn "finished" into observable evidence. Use when writing task acceptance criteria, reviewing agent output, or deciding whether to mark a task done.
date_ingested: 2026-05-23
status: active
---

# definition of done guide

## purpose

A definition of done turns "finished" into observable evidence.

Use this guide when creating task acceptance criteria, reviewing agent output, or deciding whether to roll a task into repo-wide status.

For implementation acceptance, use this together with
`../coding/output-quality.md`: DoD defines the evidence checklist; output
quality defines whether the delivered behavior is fit to accept.

## rule

A task is not done until every checkbox in the matching checklist below is satisfied and evidence is recorded.

For real repos, accepted state belongs in:

- `docs/tasks.md`;
- `docs/test_matrix.md`;
- `docs/project_status.md`;
- `reports/validation/` or `reports/agent/` as evidence;
- `docs/contracts.md` or `docs/decisions.md` when shared behavior changed.

---

## DoD for Code Tasks

```
QUALITY
[ ] No linting errors or warnings
[ ] No type errors
[ ] No debug prints, commented-out code, or dead code left behind
[ ] No magic numbers or hardcoded strings (use named constants or config)
[ ] Functions are small enough to review in one pass

TEST
[ ] Success path is covered
[ ] At least one error or edge case is covered
[ ] Tests are independent (no order dependency)
[ ] Test names describe the scenario and expected result

SECURITY
[ ] No secrets, tokens, keys, or passwords in code
[ ] Input validation exists at every entry point
[ ] Authentication and authorization checks are in place
[ ] No sensitive data logged

DOCS
[ ] Public functions have docstrings (purpose, params, return, errors)
[ ] Repo README or setup docs updated if the change affects setup/run
```

---

## DoD for API / Contract Tasks

```
CONTRACT COMPLIANCE
[ ] Endpoint path matches the accepted contract exactly
[ ] HTTP method is correct
[ ] Request schema matches (all required fields, correct types)
[ ] Success response schema matches
[ ] Error response format matches the contract
[ ] HTTP status codes follow the project convention (200, 201, 204, 400, 401, 403, 404, 422, 500)

BEHAVIOR
[ ] Authentication required where the contract says so
[ ] Authorization checks ownership or role where needed
[ ] Pagination implemented if the endpoint returns a list
[ ] Rate limiting applied if the endpoint is public or auth-related

TEST
[ ] Integration test: success path
[ ] Integration test: at least 2 error cases
[ ] Integration test: auth failure case (if endpoint requires auth)
```

---

## DoD for Migration / Data Tasks

```
MIGRATION
[ ] Migration runs from the expected starting state
[ ] Rollback or recovery path is documented
[ ] Indexes and constraints match access patterns
[ ] No ALTER TABLE on production data without a tested migration plan

DATA
[ ] Data migration tested with sample data
[ ] Dry-run evidence exists when full proof cannot run locally
[ ] Production risk recorded when applicable

TEST
[ ] Schema change verified against a clean slate
[ ] Data integrity check after migration (counts, constraints, relations)
```

---

## DoD for Documentation Tasks

```
CONTENT
[ ] Required files exist and follow the project template
[ ] Facts are sourced (link to source of truth)
[ ] Missing or unknown facts are marked explicitly
[ ] No invented facts or unsourced claims

STRUCTURE
[ ] Links and cross-references are correct
[ ] Indexes and read orders updated if the change affects discoverability
[ ] No stale references to old paths or names

REVIEW
[ ] File content matches its quality guide in `wiki/knowledge/project-docs/`
[ ] Readback or link-check evidence recorded
```

---

## DoD for a Whole Phase

```
INTEGRATION
[ ] All tasks in the phase pass their individual DoD
[ ] Integration tests pass with merged code from all workstreams
[ ] Build/deploy pipeline succeeds (or dry-run documented)
[ ] Health check or smoke test passes

CLEANUP
[ ] No TODO or FIXME left without a tracked follow-up
[ ] No debug artifacts, temporary files, or experiment branches left
[ ] Decisions recorded in `docs/decisions.md`
[ ] Contracts updated in `docs/contracts.md`

HANDOFF
[ ] Result summary lists completed tasks, known gaps, and next steps
[ ] Test matrix reflects accepted behavior
[ ] Project status is current
[ ] Next action is clear for the next agent
```

---

## anti-patterns

- Marking work implemented because code was edited but no evidence exists.
- Saying "works locally" without command, path, or manual evidence.
- Leaving accepted implementation only in chat or an agent report.
- Updating status without updating proof.
- Treating missing tests as done without explaining why they were not run.
- Checking off items without running the actual check.
