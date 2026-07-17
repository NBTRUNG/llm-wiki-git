# raw (legacy holdings)

This folder preserves imported/reference material that predates the external
Agent Platform boundary. It is read-only by default and must not receive new
active raw artifacts.

New source records, snapshots, manifests, and extracted artifacts belong under:

```text
/home/admindebian/Agent-Platform/raw/projects/<project-id>/
```

Legacy holdings may include:

- articles;
- copied markdown;
- papers;
- transcripts;
- meeting notes;
- vendor docs;
- project notes;
- images/assets.

## rules

- Do not add new active raw sources here.
- Do not edit or delete legacy sources unless explicitly asked.
- Cite raw source paths when deriving knowledge.
- If sources conflict, mark `contradiction`; do not silently resolve.
- If extraction is low confidence, mark `needs-review`.

## folders

- [projects/](projects/README.md): project source materials before synthesis.
- [research/](research/README.md): migrated legacy pointer; active research
  records live in Agent Platform.
- [decisions/](decisions/README.md): decision notes or meeting records.
- [vendors/](vendors/README.md): vendor/tool/cloud docs and comparisons.
- [assets/](assets/README.md): images or attachments referenced by raw sources.
- `andrej-karpathy-skills-main/`: raw copied Karpathy-inspired AI coding guidelines used by `global-rules.md`.
