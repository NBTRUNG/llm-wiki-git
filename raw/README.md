# raw

Raw sources are read-only by default.

Use this folder for source materials that llm-wiki may ingest:

- articles;
- copied markdown;
- papers;
- transcripts;
- meeting notes;
- vendor docs;
- project notes;
- images/assets.

## rules

- Do not edit or delete raw sources unless explicitly asked.
- Cite raw source paths when deriving knowledge.
- If sources conflict, mark `contradiction`; do not silently resolve.
- If extraction is low confidence, mark `needs-review`.

## folders

- `projects/`: project source materials before synthesis.
- `research/`: papers, articles, general research.
- `decisions/`: decision notes or meeting records.
- `vendors/`: vendor/tool/cloud docs and comparisons.
- `assets/`: images or attachments referenced by raw sources.
- `andrej-karpathy-skills-main/`: raw copied Karpathy-inspired AI coding guidelines used by `global-rules.md`.
