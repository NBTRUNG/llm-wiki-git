# validation report

Date: 2026-05-18
Scope: LLM-Wiki core completion checkpoint
Task/story: LLMWIKI-007, LLMWIKI-009, LLMWIKI-CORE-001
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  - `/home/admindebian/LLM-Wiki/index.md`
  - `/home/admindebian/LLM-Wiki/global-rules.md`
  - `/home/admindebian/LLM-Wiki/raw/`
  - `/home/admindebian/LLM-Wiki/harness/`
  - `/home/admindebian/LLM-Wiki/wiki/projects/llm-wiki/`
- Commit/build/version: no git commit available; `.git/` is not a valid repository.

## commands run

```text
find raw -maxdepth 4 -type f -print
find raw -maxdepth 4 -type d -print
grep -R -n "Documents/my_skills/andrej-karpathy-skills-main\|LLM-Wiki/andrej-karpathy-skills-main\|raw/andrej-karpathy-skills-main" index.md active.md global-rules.md llm-wiki-constitution.md program.md harness templates wiki reports raw
sed -n '1,220p' harness/project-bootstrap.md
sed -n '1,220p' harness/README.md
sed -n '1,180p' raw/README.md
sed -n '1,220p' wiki/projects/llm-wiki/docs/tasks.md
git status --short
```

## results

| check | result | notes |
| --- | --- | --- |
| Typecheck | not run | Markdown-only project; no typecheck tool exists. |
| Unit | passed | `raw/andrej-karpathy-skills-main/` and `harness/project-bootstrap.md` exist. |
| Integration | passed | Root index, harness index, intake, global rules, raw README, tasks, and test matrix were updated together. |
| E2E | passed | Manual bootstrap path exists: `index.md` -> `harness/README.md` -> `harness/project-bootstrap.md` -> `templates/`. |
| Platform | passed | Required files and folders exist on local filesystem. |
| Release | not run | No release/deploy target exists. |
| Manual review | needs-review | User has not yet reviewed the final core completion state. |

## evidence

- Karpathy raw source:
  - `raw/andrej-karpathy-skills-main/README.md`
  - `raw/andrej-karpathy-skills-main/CLAUDE.md`
  - `raw/andrej-karpathy-skills-main/CURSOR.md`
  - `raw/andrej-karpathy-skills-main/skills/karpathy-guidelines/SKILL.md`
- Bootstrap workflow:
  - `harness/project-bootstrap.md`
- Updated navigation:
  - `index.md`
  - `harness/README.md`
  - `harness/intake.md`
  - `harness/agent-operating-guide.md`
- Updated project docs:
  - `wiki/projects/llm-wiki/docs/tasks.md`
  - `wiki/projects/llm-wiki/docs/project_status.md`
  - `wiki/projects/llm-wiki/docs/test_matrix.md`

## gaps

- Tests not run: no automated Markdown lint or link checker exists yet.
- Known issues:
  - Project legacy cleanup is intentionally deferred.
  - `.git/` is not a valid repository, so git evidence remains unavailable.
- Residual risk: manual-only lint can miss edge cases until automation is added.

## decision

- implemented
