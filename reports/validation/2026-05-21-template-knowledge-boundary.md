# validation report

Date: 2026-05-21
Scope: Template and knowledge boundary cleanup
Task/story: Make LLM-Wiki templates copyable skeletons and keep canonical guidance in `wiki/knowledge/project-docs/`
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  - `/home/admindebian/LLM-Wiki/templates/`
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/`
  - `/home/admindebian/LLM-Wiki/harness/project-bootstrap.md`
  - `/home/admindebian/LLM-Wiki/global-rules.md`
- Commit/build/version: local working tree, no commit requested

## commands run

```text
find templates wiki/knowledge/project-docs -maxdepth 1 -type f | sort
for f in templates/*.template.md; do printf '%s: ' "$f"; grep -n "Guide before filling" "$f" || true; done
grep -R -n "writing principles\|delegation notes\|This file maps product behavior to proof\|Do not mark a row" templates wiki/knowledge/project-docs
find templates -maxdepth 1 -type f -name '*.template.md' -printf '%f\n' | sort
find wiki/knowledge/project-docs -maxdepth 1 -type f -printf '%f\n' | sort
```

## results

| check | result | notes |
| --- | --- | --- |
| Template skeleton boundary | passed | Long guidance was removed from templates and replaced with short guide links. |
| Template guide coverage | passed | Every `*.template.md` file has a `Guide before filling` link to `wiki/knowledge/project-docs/`. |
| Knowledge guide coverage | passed | Guides exist for project brief, manifest, architecture, decisions, contracts, implementation plan, tasks, test matrix, status, agent status, project index, validation report, and repo overrides. |
| Bootstrap coverage | passed | `harness/project-bootstrap.md` now maps `architecture` and `agent_status` outputs to templates. |
| Manual review | passed | `templates/README.md` states templates are skeletons and durable guidance belongs in knowledge. |

## evidence

- Template boundary doc:
  - `/home/admindebian/LLM-Wiki/templates/README.md`
- Knowledge index:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/README.md`
- Bootstrap map:
  - `/home/admindebian/LLM-Wiki/harness/project-bootstrap.md`
- Added templates:
  - `/home/admindebian/LLM-Wiki/templates/architecture.template.md`
  - `/home/admindebian/LLM-Wiki/templates/agent_status.template.md`
- Added guides:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/implementation_plan.md`
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/project_manifest.md`
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/project_index.md`
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/validation_report.md`

## gaps

- Tests not run: no code build/test was relevant for Markdown organization.
- Known issues: shell startup prints `/home/admindebian/.profile: line 29: export: QT-IM-MODULE=fcitx: not a valid identifier`; this did not affect validation commands.
- Residual risk: future project-specific docs can still drift if agents copy templates and ignore knowledge guides.

## decision

- implemented

Template/knowledge boundary:

1. `templates/` are copyable artifact skeletons.
2. `wiki/knowledge/project-docs/` is canonical guidance.
3. `harness/` owns workflow sequencing.
4. Repo-specific docs remain in the real repo after repo creation.
