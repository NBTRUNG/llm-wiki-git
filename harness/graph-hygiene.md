# graph hygiene

Use this guide to keep the Obsidian graph useful without forcing every
historical or template file to have inbound links.

## purpose

LLM-Wiki uses Markdown as source of truth. Obsidian graph view is a useful
discoverability check, but not every orphan is a defect.

Graph hygiene separates intentional orphan files from canonical guidance that
must be discoverable through indexes.

## rule

Canonical guidance, harness workflows, active knowledge, project source of
truth, and current research control files must have at least one index or parent
link.

Templates, validation reports, archive imports, raw holding files, and command
logs may be orphaned when their parent index explains how they are used.

## classification

| File class | Orphan allowed? | Required index |
| --- | --- | --- |
| Root control files | no | `index.md` |
| Harness workflows | no | `harness/README.md` and sometimes `index.md` |
| Knowledge guides | no | nearest `README.md` and sometimes `wiki/knowledge/README.md` |
| Project-doc guides | no | `wiki/knowledge/project-docs/README.md` |
| Coding guides | no | `wiki/knowledge/coding/README.md` |
| Research watchlist/current process | no | `index.md`, `harness/README.md`, or `research/watchlist.md` |
| Templates | acceptable | `templates/README.md` |
| Validation reports | acceptable if indexed | `reports/validation/README.md` or active/change log |
| Archive/raw/log files | yes | parent README or explicit holding-area rule |

## linking style

For files that should appear in graph view, use real Markdown or wiki links, not
only inline code.

Good:

```md
- [project_orientation.template.md](../templates/project_orientation.template.md)
- [[wiki/knowledge/project-docs/project_orientation.md]]
```

Not enough for graph discoverability:

```md
- `project_orientation.template.md`
```

## validation policy

`harness/feedback-loop-lint.sh` checks core graph hygiene only. It should fail
or warn when a canonical process file is not linked from its expected parent
index.

It does not fail merely because an individual template, old validation report,
archive file, or raw imported file is orphaned.

## repair workflow

1. Identify orphan files in Obsidian or a local graph scan.
2. Classify each orphan by file class.
3. Link canonical files from the nearest README/index.
4. Link validation reports from `reports/validation/README.md` when they are
   current evidence.
5. Leave templates/archive/raw as intentional only when their parent catalog
   explains the class.
6. Run `bash harness/feedback-loop-lint.sh`.

## anti-patterns

- Treating all Obsidian orphans as defects.
- Hiding active rules behind inline-code file names only.
- Creating duplicate index files instead of fixing the nearest canonical README.
- Linking every old validation report from root `index.md`.
