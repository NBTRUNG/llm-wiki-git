# Wiki link and compile lint expansion

Date: 2026-06-14

## scope

Expand `harness/feedback-loop-lint.sh` beyond feedback-loop bookkeeping so it
also catches broken wiki links, broken Markdown links, and missing compiled
entrypoint files in active LLM-Wiki Markdown.

## files changed

- `harness/feedback-loop-lint.sh`
- `harness/README.md`
- `wiki/projects/llm-wiki/docs/efficacy_dashboard.md`
- `wiki/concepts/security/owasp-top-10.md`
- `wiki/knowledge/project-docs/session_start.md`
- `wiki/knowledge/project-docs/token-economy-bootstrap.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `active.md`
- `reports/validation/README.md`

## checks added

- Active Markdown wikilink resolution for `[[...]]` links.
- Active Markdown inline-link resolution for `[text](...)` links.
- Compiled/index entrypoint checks for:
  - `index.md`
  - `wiki/index.md`
  - `harness/README.md`
  - `templates/README.md`
  - `wiki/knowledge/README.md`
  - `reports/validation/README.md`
- Required section checks for root index, compiled wiki index, and validation
  report catalog.

Historical validation reports, raw sources, archive, logs, and local runtime
folders are excluded from link resolution so old examples and immutable reports
do not fail the active-document lint.

## link fixes made

- Corrected relative links in `wiki/projects/llm-wiki/docs/efficacy_dashboard.md`.
- Corrected the OWASP cross-reference to `wiki/knowledge/coding/code-quality.md`.
- Corrected project-doc guide references to `wiki/knowledge/coding/karpathy-guidelines.md`.
- Removed a malformed wiki-link wrapper around an external UniversityWeb report
  path in the efficacy dashboard.

## result

Implemented locally.

Validation result: `harness/feedback-loop-lint.sh` passed with 0 failures and
0 warnings. It checked 339 wikilinks and 24 Markdown links.

## residual risk

This is still a lint/checker, not a generated-index compiler. A future compile
script can rebuild `wiki/index.md` or other summaries from source-of-truth docs.
