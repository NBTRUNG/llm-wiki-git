# wiki index

This is the compiled knowledge layer of llm-wiki.

Project docs and raw sources remain source of truth. This wiki summarizes, links, and cross-references them.

## sections

- `projects/`: pre-repo project source-of-truth folders only.
- `knowledge/`: reusable playbooks, rules, patterns, and lessons that apply across projects.
- `concepts/`: reusable concepts and patterns.
- `decisions/`: compiled decisions and cross-project ADR index.
- `vendors/`: vendor/tool/framework evaluation.
- `research/`: synthesized research notes.

## active projects

| Project | Phase | Status | Source of truth | Next step |
| --- | --- | --- | --- | --- |
| llm-wiki | pre-repo | stable/manual-complete | `projects/llm-wiki/` | Optional automation or deferred project cleanup |

## project links

- LLM-Wiki manifest: `projects/llm-wiki/project_manifest.md`
- LLM-Wiki brief: `projects/llm-wiki/docs/project_brief.md`
- LLM-Wiki status: `projects/llm-wiki/docs/project_status.md`
- LLM-Wiki tasks: `projects/llm-wiki/docs/tasks.md`
- LLM-Wiki decisions: `projects/llm-wiki/docs/decisions.md`
- LLM-Wiki test matrix: `projects/llm-wiki/docs/test_matrix.md`
- LLM-Wiki architecture: `projects/llm-wiki/wiki/architecture.md`
- LLM-Wiki feedback-loop queue: `projects/llm-wiki/docs/feedback_loop_queue.md`

## rules

- Summaries must link back to source files.
- Missing data is `unknown`.
- Conflicting data is `contradiction`.
- Stale data is `stale`.
- Do not keep migrated repo projects under `wiki/projects/`; use root `projects/` for minimal link notes only.

## known gaps

Topics with no canonical guidance in LLM-Wiki yet. Maintained per [[../harness/feedback-loop.md#known-gaps-maintenance]]. Agents must not invent guidance for items here; raise a `[WIKI-GAP]` per [[../global-rules.md#wiki-gap-reporting]] when one becomes blocking.

- *(no active gaps as of 2026-05-25 — see Recently filled.)*

Recently filled (kept for one cycle, then removed):

- **Feedback-loop operational support** — filled 2026-05-25 via deferred candidate queue, LWOE source fields in result-report/session templates, bootstrap templates, and `harness/feedback-loop-lint.sh`. See [[../reports/validation/2026-05-25-feedback-loop-operational-optimization.md]].
- **Agent task/status read optimization** — filled 2026-05-25 via current assignment/current state cards, delegated packet archive skeleton, and delegated read-order cleanup. See [[../reports/validation/2026-05-25-agent-task-status-read-optimization.md]].

When a gap is filled, move its bullet to "Recently filled" with the filling-date and pointer; remove from that list at the next feedback-loop session.

## active maps

- System entry: `../index.md`
- LLM-Wiki rules: `../global-rules.md`
- Agent coding workflow: `knowledge/coding/agent-coding-workflow.md`
- Repo code rules: `knowledge/coding/repo-code-rules.md`
- Constitution: `../llm-wiki-constitution.md`
- Program: `../program.md`
- Harness: `../harness/README.md`
