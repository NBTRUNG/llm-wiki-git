# validation report

Date: 2026-05-21
Scope: LLM-Wiki control files rewrite
Task/story: Rewrite `active.md`, `global-rules.md`, `llm-wiki-constitution.md`, and `program.md` to match the final LLM-Wiki organization model
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  - `/home/admindebian/LLM-Wiki/active.md`
  - `/home/admindebian/LLM-Wiki/global-rules.md`
  - `/home/admindebian/LLM-Wiki/llm-wiki-constitution.md`
  - `/home/admindebian/LLM-Wiki/program.md`
  - `/home/admindebian/LLM-Wiki/harness/project-bootstrap.md`
- Commit/build/version: local working tree, no commit requested

## commands run

```text
grep -R -n "post-migration project index\|Allowed post-migration file\|wiki/projects/<project>/index.md\|as a pointer/compiled view\|migrated.*wiki/projects/<project>" active.md global-rules.md llm-wiki-constitution.md program.md index.md wiki/index.md harness projects reports/validation/2026-05-21-llm-wiki-organization.md reports/validation/2026-05-21-template-knowledge-boundary.md
grep -R -n "wiki/projects/.*pre-repo\|projects/<ProjectName>\|templates.*skeleton\|active.md.*LLM-Wiki" active.md global-rules.md llm-wiki-constitution.md program.md harness/project-bootstrap.md
find wiki/projects -maxdepth 3 -type d | sort
find archive -maxdepth 3 -type f | sort
wc -l active.md global-rules.md llm-wiki-constitution.md program.md
```

## results

| check | result | notes |
| --- | --- | --- |
| Control file rewrite | passed | The four requested files were rewritten around the final folder/source-of-truth model. |
| Old post-migration model removed | passed | No active rule keeps migrated projects as `wiki/projects/<project>/index.md`. The only remaining `wiki/projects/<project>` migration reference is a negative rule: do not keep migrated docs there. |
| Folder role alignment | passed | `projects/`, `wiki/projects/`, and `archive/` now have distinct roles. |
| `active.md` boundary | passed | `active.md` is documented as LLM-Wiki focus only. |
| Template/knowledge boundary | passed | Control files say templates are skeletons and knowledge guides are canonical guidance. |
| Migrated repo location | changed | Migrated real-repo payloads are no longer kept in LLM-Wiki; only minimal pointer notes remain. |

## evidence

- Rewritten files:
  - `/home/admindebian/LLM-Wiki/active.md`
  - `/home/admindebian/LLM-Wiki/global-rules.md`
  - `/home/admindebian/LLM-Wiki/llm-wiki-constitution.md`
  - `/home/admindebian/LLM-Wiki/program.md`
- Corrected stale bootstrap guidance:
  - `/home/admindebian/LLM-Wiki/harness/project-bootstrap.md`
- Existing supporting reports:
  - `/home/admindebian/LLM-Wiki/reports/validation/2026-05-21-llm-wiki-organization.md`
  - `/home/admindebian/LLM-Wiki/reports/validation/2026-05-21-template-knowledge-boundary.md`

## gaps

- Tests not run: no application code was changed.
- Known issues: shell startup prints `/home/admindebian/.profile: line 29: export: QT-IM-MODULE=fcitx: not a valid identifier`; this did not affect validation commands.
- Residual risk: old validation reports can still mention historical paths.

## decision

- implemented

Final control-file model:

1. `active.md` tracks only current LLM-Wiki work.
2. `global-rules.md` contains practical LLM-Wiki workflow rules.
3. `llm-wiki-constitution.md` contains stable source-of-truth and lifecycle laws.
4. `program.md` contains operating procedures.
5. `wiki/projects/` is only for pre-repo project source-of-truth docs.
6. migrated projects use `projects/<ProjectName>/` as minimal link notes only.
