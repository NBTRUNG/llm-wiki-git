---
name: navigation-maps
description: Naming and maintenance rules for LLM-Wiki directory maps.
date_updated: 2026-06-30
status: active
---

# navigation maps

## purpose

Use this guide when creating, cleaning, or reviewing LLM-Wiki directories.
Navigation maps should help agents and humans find the right node without
turning every directory into a duplicate source of truth.

## naming rule

Use one root `index.md` only:

```text
index.md
```

Root `index.md` is the workspace map across major nodes: harness, templates,
knowledge, projects, reports, raw sources, logs, archive, and current
coordination.

For directory-local maps, use `README.md`:

```text
wiki/knowledge/README.md
wiki/knowledge/project-docs/README.md
reports/validation/README.md
projects/README.md
```

For project-specific maps, use an explicit typed name:

```text
docs/project_index.md
```

For registers, use an explicit register name:

```text
wiki/decisions/_index.md
```

Do not create `index.md` at every nested level. Reusing that basename in many
folders makes search results ambiguous and encourages agents to cite the wrong
file.

## nested directory rule

For nested folders:

```text
A/
  README.md
  B/
    README.md
    C/
      README.md
```

Each `README.md` maps only the immediate directory:

- purpose of this node;
- active child nodes;
- source-of-truth boundary;
- archive or raw-source boundary;
- where to go next.

Do not duplicate child details upward. `A/README.md` links to `B/README.md`;
`B/README.md` links to `C/README.md`; `C/README.md` owns its local map.

## root to node path

Every durable issue, task, report, or knowledge page should be reachable from
root by a short path:

```text
index.md
  -> <node>/README.md
  -> <specific file>
```

For LLM-Wiki project governance:

```text
index.md
  -> wiki/projects/llm-wiki/docs/project_index.md
  -> tasks/status/test/report
```

## archive rule

Archive content when it is historical, duplicated by a real repo, or retained
only as evidence. Do not archive active maps, templates, or reusable knowledge.

After archiving:

- keep a minimal pointer in the active location if humans or agents still need
  the route;
- name the archive directory by date and reason;
- update root `index.md`, the nearest `README.md`, and the validation report.

## search rule

Agents should cite full paths, not bare filenames, when more than one map-like
file exists. For example:

```text
/home/admindebian/LLM-Wiki/index.md
/home/admindebian/LLM-Wiki/wiki/projects/llm-wiki/docs/project_index.md
/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/README.md
```

Use `rg --files` or `rg "<term>" <bounded-dir>` before opening broad trees.
