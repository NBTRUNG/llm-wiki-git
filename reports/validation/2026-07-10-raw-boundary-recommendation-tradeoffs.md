# LLMWIKI-079 Raw Boundary And Recommendation Trade-Off Validation

Date: 2026-07-10
Scope: Move active research source records to Agent Platform and require
mathematically explicit pros/cons for substantive agent recommendations.
Task/story: LLMWIKI-079
Validator: Codex

## source

- Project: LLM-Wiki
- Human approval: the current user instruction explicitly selected
  `/home/admindebian/Agent-Platform/raw/` and requested the agent recommendation
  rule.
- Boundary decision:
  `wiki/decisions/DEC-0002-agent-platform-owns-active-raw.md`
- Source-of-truth files: `llm-wiki-constitution.md`, `global-rules.md`,
  `program.md`, and
  `wiki/projects/llm-wiki/docs/source_of_truth_rules.md`
- Commit/build/version: local Markdown workspace; no Git repository detected at
  `/home/admindebian/LLM-Wiki`.

## migration map

| old active path | new active path | pre-delete SHA-256 | result |
| --- | --- | --- | --- |
| `raw/research/2026-07-08-classical-math-agent-reasoning-sources.md` | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-08-classical-math-agent-reasoning-sources.md` | `4c9f7dfaf902a013737dfe8275fc7959888bf8cd324f59c885e887179caf601d` | source/destination hashes matched; local duplicate removed |
| `raw/research/2026-07-08-debug-funnel-sources.md` | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-08-debug-funnel-sources.md` | `cf907bb9956f707a7193ea2900140adae94cb201efaf88a22df28c658a1da2c8` | source/destination hashes matched; local duplicate removed |
| `raw/research/2026-07-10-mcp-server-sources.md` | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-10-mcp-server-sources.md` | `a4352158d16c23b1313aec76be64c93040195584e31077b7b1f7fe7bc8bafc1e` | source/destination hashes matched; local duplicate removed |

The local `raw/research/README.md` remains only as a legacy pointer. Historical
validation reports retain their old paths because they describe the state at
the time of those validations.

## changed surfaces

- Agent Platform: root layout/source-of-truth README and
  `raw/projects/llm-wiki/research/README.md` plus the three migrated records.
- Boundary/governance: constitution, decision index, global rules, program,
  feedback loop, raw/research READMEs, source-of-truth rules, source inventory,
  workflow/data/impact maps, and change queue.
- Recommendation contract: Math Pack README, functions/rates/measurement,
  Coding output quality, session packs, and agent result-report template.
- Projections/evidence: index, active/TICK/current direction/project status,
  tasks, test matrix, research-brief paths, validation index, and lint checks.

## commands and checks

```text
sha256sum <three local source records> <three Agent Platform destinations>
find raw/research -maxdepth 1 -type f
find /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research -maxdepth 1 -type f
rg old local raw/research source paths across active Markdown
rg recommendation fields across global rules, Math/Coding knowledge, session packs, and result template
bash harness/feedback-loop-lint.sh
```

## results

| check | result | notes |
| --- | --- | --- |
| Constitution amendment gate | passed | DEC-0002 was registered before the section 4 edit, then accepted from the direct human instruction and added to section 19. |
| Raw ownership | passed | Active records are under the Agent Platform `llm-wiki/research/` namespace; local `raw/` is legacy-only. |
| Copy integrity | passed | All three source/destination SHA-256 pairs matched before local deletion. |
| Duplicate removal | passed | Local `raw/research/` contains only its README pointer. |
| Active path references | passed | Active knowledge, research briefs, tasks, test matrix, TICK, and current direction point to Agent Platform. Historical validation reports remain immutable history. |
| Recommendation rule | passed | Global rule requires objective, constraints, baseline/alternative, pros, cons, uncertainty, and sensitivity/revision trigger. |
| Mathematical decision quality | passed | Hard constraints remain constraints; common baselines/units are required; multi-objective choices expose dominance/Pareto trade-offs without invented scores. |
| Agent projection | passed | Output-quality guide, session packs, and result-report template carry the required fields. |
| Wiki lint/link validation | passed | Final lint completed with `0 failure(s), 0 warning(s)` after this report was added. |

## recommendation and mathematical trade-offs

- **Recommendation:** keep one active raw owner in Agent Platform and retain
  local raw only as an explicit legacy boundary.
- **Objective/constraints:** minimize duplicate valid states while preserving
  immutable evidence, project isolation, and traceability into canonical
  knowledge.
- **Baseline:** allow active research raw in both roots.
- **Pros:** deterministic path selection; fewer duplicate/drift states; cleaner
  lint; source records use the same project namespace as snapshots/manifests.
- **Cons:** agents need access to a second root; absolute local paths are less
  portable; historical references need interpretation rather than blind path
  replacement.
- **Evidence/uncertainty:** the three active files were hash-verified and moved;
  older imported material elsewhere under local `raw/` was not inventoried or
  migrated by this task.
- **Sensitivity/revision trigger:** revisit path configuration if Agent Platform
  is unavailable to normal research sessions or the workspace must move to a
  different host; do not solve portability by restoring duplicate active raw.

## gaps and residual risk

- No real repo result report has yet exercised the new recommendation fields.
- The rule cannot prevent an agent from writing superficial pros/cons; review
  still needs to test whether claims share a valid baseline and state material
  uncertainty.
- Legacy imported holdings under other local `raw/` subdirectories remain by
  design. A later inventory may classify them, but this task does not delete or
  migrate them.

## decision

- implemented

