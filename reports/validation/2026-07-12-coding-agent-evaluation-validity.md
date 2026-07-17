# Coding-Agent Evaluation Validity Validation

Date: 2026-07-12
Scope: Refresh reusable evaluation controls for coding and tool-using agents.
Task/story: Human-authorized auto-research run
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md` and
  `reports/research/2026-07-12-coding-agent-evaluation-validity.md`
- Raw evidence:
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-12-agent-evaluation-refresh/`
- Commit/build/version: local Markdown workspace

## commands run

```text
file and sha256sum checks for downloaded PDFs
pdftotext plus targeted claim readback
bash harness/feedback-loop-lint.sh
targeted rg/readback of promoted sections and report indexes
```

## results

| check | result | notes |
| --- | --- | --- |
| Source quality/support | passed | Four original PDFs and two official HTML snapshots retained; official benchmark pages and original papers checked. |
| Temporal validity | passed | Snapshot, cutoff, future-information, search leakage, and contamination labels are explicit. |
| Comparison validity | passed | Prompt construction and context granularity join model/harness/tools as frozen variables. |
| Diagnostic boundary | passed | Exploration metrics diagnose localization/context cost but cannot replace executable outcome. |
| Mathematical measurement | passed | Difficulty strata, measurand conditions, reliability target, uncertainty, and non-comparable-suite guard are explicit. |
| Promotion restraint | passed | Model rankings, reported leaderboard scores, and universal thresholds were not promoted. |
| Raw integrity | passed | Four PDFs and two official HTML snapshots are valid and have recorded SHA-256 checksums. |
| Wiki lint/link validation | passed | `0 failure(s), 0 warning(s)`; 528 active wikilinks and 586 Markdown links resolved. |

## evidence

- Research brief:
  `reports/research/2026-07-12-coding-agent-evaluation-validity.md`
- Canonical guide:
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`
- Raw source record:
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-12-agent-evaluation-refresh-sources.md`

## gaps

- Tests not run: no local coding-agent/MCP evaluation suite exists yet, so the
  new controls have static validation but no empirical project run.
- Known issues: recent 2026 papers are preprints; claims are limited to their
  reusable controls and stated limitations.
- Residual risk: model training data is opaque, so timestamps reduce and label
  contamination risk but cannot prove absence.

## decision

- implemented
