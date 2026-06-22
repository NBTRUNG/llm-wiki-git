# Large Surface Guard Validation

Date: 2026-06-20

## Scope

Added and refined a reusable policy for large fused UI/code surfaces after reviewing
UniversityWeb's `_FusedClassDiscovery.cshtml`.

## Source

- Project example:
  `/home/admindebian/UniversityWeb/UniversityWeb.Web/Views/Partials/_FusedClassDiscovery.cshtml`
- Existing coding guidance:
  `wiki/knowledge/coding/karpathy-guidelines.md`
  `wiki/knowledge/coding/repo-code-rules.md`
  `wiki/knowledge/coding/code-quality.md`
- Architecture references:
  `/home/admindebian/.agents/skills/architecture-skill/references/web-arch.md`
  `/home/admindebian/.agents/skills/architecture-skill/references/software-arch.md`

## Decision

Do not treat a large fused file as automatically wrong when it solves a concrete
performance problem, such as avoiding a large first HTML response.

Do not refactor a stable large file merely for aesthetics when security,
performance, ownership, and operability are acceptable.

Do require agents to stop and document a boundary decision before adding more
behavior to a large mixed-concern file or creating a new one.

## Changes

- Added `Large interactive surface policy` to
  `wiki/knowledge/coding/karpathy-guidelines.md`.
- Added `large UI/code surface policy` to
  `wiki/knowledge/coding/repo-code-rules.md`.
- Added `Large Surface Policy` to `templates/repo_rules.template.md`.
- Added result-report fields to `templates/agent_result_report.template.md`.
- Added packet fields/rule to `harness/task-packet.md`.

## Refactor policy

For a fused surface that has just fixed performance, defer structural refactor
until it has run cleanly for the agreed stabilization window, often 1-2 weeks.
After stabilization, leaving it as-is is acceptable if security, performance,
ownership, and operability are good.

Prefer no-behavior-change extraction only when there is real payoff:

- security issue;
- performance regression;
- recurring bug;
- duplicate behavior drift;
- conflict/review/debug cost;
- material new behavior touching the same surface.

When refactor is justified:

- move JS to a static module/file;
- move large CSS to a static stylesheet;
- keep Razor/template as semantic shell;
- do not change API routes, DTOs, visual design, copy, or user-visible behavior.

## Validation

Run after edits:

```sh
bash harness/feedback-loop-lint.sh
```

Actual result:

```text
Summary: 0 failure(s), 0 warning(s)
```
