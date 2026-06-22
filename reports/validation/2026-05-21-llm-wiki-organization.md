# validation report

Date: 2026-05-21
Scope: LLM-Wiki organization after rule split and project-doc knowledge cleanup
Task/story: Keep LLM-Wiki as knowledge/playbook vault; keep real repo execution state in real repos
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  - `/home/admindebian/LLM-Wiki/index.md`
  - `/home/admindebian/LLM-Wiki/global-rules.md`
  - `/home/admindebian/LLM-Wiki/active.md`
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/`
  - `/home/admindebian/LLM-Wiki/harness/project-workflow.md`
  - `/home/admindebian/LLM-Wiki/projects/`
- Commit/build/version: local working tree, no commit requested

## commands run

```text
find wiki/knowledge -maxdepth 3 -type f | sort
find wiki/projects -maxdepth 4 -type f | sort
find archive -maxdepth 4 -type f | sort
grep -R -n "repo-code-rules.md" . --exclude-dir=.obsidian --exclude-dir=raw
grep -R -n "migrated project docs" index.md wiki/index.md projects active.md reports/validation/2026-05-21-llm-wiki-organization.md archive
grep -R -n "active.md.*project\|project.*active.md" projects index.md wiki/index.md harness llm-wiki-constitution.md program.md active.md
```

## results

| check | result | notes |
| --- | --- | --- |
| Knowledge structure | passed | `wiki/knowledge/coding/` and `wiki/knowledge/project-docs/` are present. |
| Repo code rules duplicate | passed | Only canonical rule file remains at `wiki/knowledge/coding/repo-code-rules.md`. |
| Migrated real-repo duplicate docs | superseded | Later cleanup removed migrated real-repo payloads from LLM-Wiki and kept only minimal pointer notes. |
| Empty migrated project folders | passed | Old empty migrated real-repo directories were removed from `wiki/projects/`. |
| Stale migrated-doc links | superseded | Later cleanup removed migrated-doc links from active indexes. |
| `active.md` misuse as repo tracker | passed | Remaining references say `active.md` is only for LLM-Wiki work or explicitly disallow repo project tracking. |
| Manual review | passed | `harness/project-workflow.md` source-of-truth and allowed-write rules match the new model. |

## evidence

- Canonical repo code rule:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/coding/repo-code-rules.md`
- Reusable repo-doc standards:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/`
- Project pointer notes:
  - `/home/admindebian/LLM-Wiki/projects/`

## gaps

- Tests not run: no code build/test was relevant for this documentation organization check.
- Known issues: shell startup prints `/home/admindebian/.profile: line 29: export: QT-IM-MODULE=fcitx: not a valid identifier`; this did not affect validation commands.
- Residual risk: older local history can contain stale paths unless explicitly deleted.

## decision

- implemented

LLM-Wiki organization now follows this model:

1. LLM-Wiki keeps concepts, reusable knowledge, playbooks, and project pointers.
2. `active.md` tracks only current LLM-Wiki work.
3. Real repo work uses real repo docs for status, tasks, decisions, tests, and agent assignments.
4. `wiki/knowledge/project-docs/` stores general standards for repo docs, not project-specific docs.
5. `wiki/knowledge/coding/repo-code-rules.md` stores general coding/repo work rules.
6. `wiki/projects/` is only for pre-repo project source-of-truth docs; migrated projects keep minimal pointer notes only.
