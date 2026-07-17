---
name: cicd-iac
description: CI/CD and infrastructure-as-code guidance for build, test, deploy, approval, drift, and rollback.
date_ingested: 2026-07-16
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://github.blog/changelog/2026-06-18-safer-pull_request_target-defaults-for-github-actions-checkout/
  - https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows#pull_request_target
  - https://github.blog/changelog/2026-07-16-advanced-search-for-projects-is-generally-available/
raw_sources:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-github-cicd-safety-sources.md
confidence: high
confidence_reviewed: 2026-07-16
---

# CI/CD And IaC

## Checks

- Pipeline stages map to build, test, security/audit where relevant, package,
  deploy, smoke, and rollback.
- Secrets are injected by CI/platform secret store, not committed variables.
- Infrastructure changes are reviewable and idempotent where possible.
- Drift detection or manual-change policy exists for managed infrastructure.
- Production deploys have approval/claim ownership and rollback plan.
- Generated artifacts are identifiable and reproducible.

## Privileged Pull-Request Workflows

Treat a workflow as privileged when its trigger or later stage can access the
base repository's write-capable token, secrets, protected environments, or
default-branch cache. In GitHub Actions this includes `pull_request_target` and
can include `workflow_run`.

- Prefer `pull_request` for building or testing untrusted fork code.
- Use `pull_request_target` for base-branch operations such as labeling or
  commenting; do not checkout and execute the fork head in the same privileged
  job.
- Do not assume `actions/checkout` is the whole boundary. Review shell `git`,
  `gh`, third-party checkout actions, artifacts, generated scripts, and events
  such as `issue_comment` for equivalent untrusted-code paths.
- Keep token permissions minimal, do not expose secrets to untrusted code, and
  separate unprivileged build/test from any later privileged action.
- Treat `allow-unsafe-pr-checkout` as a named security exception. Require a
  threat model, isolated job, minimal permissions, no reusable secrets, cache
  protection, human approval, and a rollback/removal trigger.
- Review action update semantics deliberately. A floating supported major tag
  may acquire a security behavior change automatically; a pinned SHA, minor,
  or patch may require an explicit upgrade.

For repositories using `actions/checkout`, add a negative test or review check
that a fork pull request cannot cause its head or merge commit to execute in a
privileged workflow. GitHub announced that supported backports of the safer
checkout behavior are enforced from 2026-07-20; `actions/checkout` v1 is not
covered by that backport.

## Durable Deployment Evidence

Do not treat a vendor's deployment-status API as the only long-term audit or
rollback record. GitHub deployment statuses older than 90 days are now deleted
from REST and GraphQL results while the deployment's current state remains.
When evidence must outlive that window, persist the deployment identifier,
commit and artifact, environment, approval, smoke result, and rollback result
in a durable project report or approved audit store.

## Evidence

Record pipeline link/log path, commit/artifact ID, environment, smoke checks,
rollback notes, and skipped checks.
