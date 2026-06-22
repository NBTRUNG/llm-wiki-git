# wiki lint report

date: 2026-05-18
scope: LLM-Wiki foundation and project operating docs

This report records the actual lint completion date as 2026-05-18.

## commands run

```text
find . -maxdepth 4 -type f -print
find harness templates raw wiki reports logs -maxdepth 3 -type f -print
find wiki/projects/llm-wiki -type f -name "*.md" -print
grep -R -n -o "<obsidian-link-regex>" index.md active.md global-rules.md llm-wiki-constitution.md program.md harness templates wiki projects raw reports logs
grep -R -n "Global_rules.md" .
grep -R -n -E "GLOBAL_HARNESS|TASK_CONTRACT|VERIFICATION_MATRIX|DONE_CRITERIA" .
grep -R -n "andrej-karpathy-skills-main\|Karpathy" index.md active.md global-rules.md llm-wiki-constitution.md program.md harness templates wiki projects raw reports logs
find /home/admindebian -maxdepth 4 -type d -iname "*karpathy*" -print
find . -name GLOBAL_HARNESS.md -o -name TASK_CONTRACT.md -o -name VERIFICATION_MATRIX.md -o -name DONE_CRITERIA.md -o -name Global_rules.md
find projects concepts -maxdepth 3 -type f -print
git status --short
```

## broken links

- No missing canonical lowercase files were found for current harness/global-rule paths.
- The original local-history path `/home/admindebian/LLM-Wiki/andrej-karpathy-skills-main/` was stale at lint time. The source has since been copied into `raw/andrej-karpathy-skills-main/` and current docs cite the raw path.
- `git status --short` failed because `.git/` is empty/not a valid repository. This is not a wiki link issue, but it prevents git-based evidence.

## orphan pages

- Legacy concept/source material should not remain in LLM-Wiki after a real repo becomes source of truth unless it is generalized into reusable knowledge.
- `projects/` contains legacy project notes used by the root index, while `wiki/projects/llm-wiki/` is the new pre-repo source-of-truth pattern. This is intentional for now but needs a compatibility/migration decision.

## duplicate or merge candidates

- Legacy project notes and concept folders should be reviewed together when deciding migration/ingest strategy.
- No duplicate LLM-Wiki source-of-truth docs were found outside `wiki/projects/llm-wiki/`.

## uncited claims

- LLM-Wiki project docs mostly cite local source files and project paths.
- The Karpathy-inspired rules now cite `raw/andrej-karpathy-skills-main/`.

## stale claims

- `active.md` was stale while the current work was LLM-Wiki foundation follow-up. Fixed in this pass by updating `active.md` to LLM-Wiki focus.
- Historical local logs were later removed; current source-of-truth files should not depend on them.

## contradictions

- No hard contradiction found in source-of-truth rules.
- Potential confusion remains between legacy `projects/` notes and new `wiki/projects/` pre-repo source-of-truth folders until LLMWIKI-005 is decided.

## oversized pages

- No oversized canonical LLM-Wiki governance page was identified during manual review.
- Legacy concept folders should be handled as separate migration/ingest tasks, not folded into this lint cleanup.

## recommended actions

1. Decide LLMWIKI-005: keep legacy `projects/` as compatibility pointers, migrate into `wiki/projects/`, or mark as legacy.
2. Decide LLMWIKI-006: ingest, generalize, or remove legacy concept folders.
3. Project legacy cleanup can be handled later; current LLM-Wiki core evidence uses `raw/andrej-karpathy-skills-main/`.
4. Create a simple automated wiki link/lint script only after the manual report shape stabilizes.
