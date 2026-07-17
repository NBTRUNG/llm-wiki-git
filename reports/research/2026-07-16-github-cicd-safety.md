# GitHub CI/CD Safety And Evidence Retention Research Brief

Topic: GitHub privileged pull-request workflows and durable deployment evidence
Date: 2026-07-16
Owner: Codex
Cadence reason: weekly
Status: promoted

## decision need

- What decision or guideline may change: whether the CI/CD guide needs an
  explicit trust boundary for privileged pull-request triggers and a durable
  evidence rule for deployment-status retention.
- Target docs if promoted: `wiki/knowledge/platform-infrastructure/cicd-iac.md`.

## sources checked

| Source | Type | Date published/accessed | Relevance | Notes |
| --- | --- | --- | --- | --- |
| GitHub Changelog, safer `pull_request_target` defaults | official vendor | published 2026-06-18; editor update 2026-07-15; accessed 2026-07-16 | direct | Backport enforcement moved to 2026-07-20; documents protected and uncovered checkout paths. |
| GitHub Docs, workflow events | official documentation | accessed 2026-07-16 | direct | Defines base-branch context and warns against running untrusted code under `pull_request_target` and `workflow_run`. |
| GitHub Changelog, Projects advanced search | official vendor | published/accessed 2026-07-16 | direct for deployment evidence | Includes the new 90-day retention policy for deployment statuses. |

The wider horizon probe also checked current official AI-tooling, runtime, and
Kubernetes/security surfaces. No same-day item in those probes had higher
decision value for this repository. The Kubernetes CVE feed appeared freshly
rendered but the relevant entries were published in March or April 2026, so it
was not represented as a new 2026-07-16 disclosure.

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| `pull_request_target` and privileged `workflow_run` jobs must not execute untrusted fork code. | high | urgent-update | A GitHub Actions workflow has base-repository token, secret, environment, or cache privileges. | A job is demonstrably unprivileged and uses ordinary `pull_request` restrictions. |
| Safer `actions/checkout` defaults reduce common unsafe patterns but do not cover shell `git`/`gh`, other triggers, or arbitrary untrusted repositories. | high | candidate-update | Reviewing workflow trust boundaries. | Never use this as proof that every untrusted-code path is blocked. |
| Supported backports are scheduled for 2026-07-20; floating majors and pinned versions behave differently. | high | urgent-update | Repositories use `actions/checkout` with privileged PR workflows. | Do not infer that v1 or a pinned SHA/minor/patch receives the backport automatically. |
| GitHub deployment statuses older than 90 days are removed from REST/GraphQL, while current state remains. | high | candidate-update | Audit, rollback, or operational evidence must remain queryable longer than 90 days. | A separate durable evidence store already satisfies the retention requirement. |

## claim-support checks

| Claim | Importance | Source | Accessible | Relevant | Supports stated strength | Conflict/freshness | Decision |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Privileged PR triggers can expose write access, secrets, and cache to attacker-controlled code. | high | GitHub Changelog + GitHub Docs | yes | yes | yes | sources agree; current | promote |
| Checkout protection blocks only common patterns. | high | GitHub Changelog | yes | yes | yes | explicit exclusions listed | promote |
| Enforcement date is 2026-07-20 and v1 is excluded. | high | GitHub Changelog editor note | yes | yes | yes | July 15 correction supersedes older July 16 text lower in the post | promote with date note |
| Deployment statuses have 90-day retention. | high | July 16 GitHub Changelog | yes | yes | yes | same-day primary source | promote |

## stop record

- Unresolved decision/claims before the final probe: whether the checkout
  change was active on July 16 and whether the retention item affected current
  state or only historical statuses.
- What the final probe could have changed: it could have removed the deadline
  claim or narrowed the deployment-evidence rule.
- Why research stopped: GitHub's editor note resolves the enforcement date and
  the July 16 changelog explicitly distinguishes historical statuses from
  current state. Additional vendor commentary would not change the guideline.
- Remaining conflicts or unsupported claims: local empirical behavior is not
  tested because this Markdown repository has no GitHub Actions workflow in
  scope. Repository-specific exceptions remain `needs-review`.

## impact on LLM-Wiki

- Canonical docs to update: `wiki/knowledge/platform-infrastructure/cicd-iac.md`.
- Templates/harness files to update: none; the rule is trigger-based knowledge,
  not a universal task field.
- Project docs affected: task ledger, test matrix, status/TICK checkpoint, and
  report indexes.
- Agent workflow affected: agents reviewing GitHub CI/CD must inspect privileged
  trigger and untrusted-code boundaries instead of trusting checkout alone.

## proposed change

- Add a privileged pull-request workflow section with safe defaults, uncovered
  paths, exception controls, and version-update semantics.
- Add a durable deployment-evidence section for histories longer than 90 days.

## validation plan

- Retain checksummed official HTML snapshots in Agent Platform raw.
- Read back the canonical rule and cross-links.
- Run `bash harness/feedback-loop-lint.sh`.
- Leave runtime GitHub behavior and repo-specific migration as `needs-review`.

## reviewer decision

- Decision: promote
- Reason: the update is current, primary-source-backed, security-relevant, and
  broadly reusable without imposing a repo-specific workflow design.
- Validation report: `reports/validation/2026-07-16-github-cicd-safety.md`.

## next review

- Next cadence trigger: GitHub changes the backport scope/date, exception input,
  privileged-event model, or deployment-status retention policy.
- Watchlist row: weekly security advisories and breaking tooling/runtime changes.
