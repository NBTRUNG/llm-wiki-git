# Validation Report - Output Quality Gate

Date: 2026-06-20
Owner: Codex
Status: completed

## Scope

Add a reusable output-quality standard beside code-quality so delegated agents
must prove delivered behavior, security, performance, reviewability, handoff, and
residual risk instead of reporting done only because code changed.

## External References Checked

- Google Engineering Practices, code review: design, functionality, complexity,
  tests, naming, comments, style, docs, every line, context, and code health.
  Source: https://google.github.io/eng-practices/review/reviewer/looking-for.html
- Google Engineering Practices, small CLs: small self-contained changes, related
  tests in the same change, refactors separate from behavior changes, reviewer
  consent for unavoidable large changes.
  Source: https://google.github.io/eng-practices/review/developer/small-cls.html
- Microsoft Security Development Lifecycle Practices: security across design,
  code, build/deploy, run, and Zero Trust governance.
  Source: https://www.microsoft.com/en-us/securityengineering/sdl/practices
- AWS Well-Architected Framework: review architecture against operational
  excellence, security, reliability, performance efficiency, cost optimization,
  and sustainability.
  Source: https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html
- AWS Well-Architected pillars.
  Source: https://docs.aws.amazon.com/wellarchitected/latest/framework/the-pillars-of-the-framework.html
- "Code Improvement Practices at Meta" (arXiv, 2025): continual code improvement,
  metric-guided prioritization, dead-code deletion, and reengineering as
  sustainment practices.
  Source: https://arxiv.org/abs/2504.12517

## Files Changed

- Added `wiki/knowledge/coding/output-quality.md`.
- Updated `wiki/knowledge/coding/README.md`.
- Updated `templates/repo_rules.template.md` with `Output Quality Capsule`.
- Updated `harness/task-packet.md` to require the capsule for non-trivial
  implementation/review tasks.
- Updated `templates/agent_result_report.template.md` with `Output quality gate`.
- Updated `templates/README.md`.
- Updated `wiki/knowledge/project-docs/definition_of_done.md`.
- Updated `wiki/knowledge/project-docs/review_checklist.md`.
- Updated `active.md`.

## Resulting Process Rule

For non-trivial implementation or review work, task packets should name
`Output Quality Capsule`, and agent reports must record concise evidence for:

- user-visible behavior;
- contract/design boundary fit;
- correctness and edge cases;
- security/privacy impact;
- performance/operability impact;
- tests/checks proving behavior;
- reviewability/change size;
- docs/handoff/rollback;
- residual risks or skipped checks.

## Validation

- `bash harness/feedback-loop-lint.sh`

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```
