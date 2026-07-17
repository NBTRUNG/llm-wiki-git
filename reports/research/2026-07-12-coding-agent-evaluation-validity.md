# Coding-Agent Evaluation Validity Refresh

Topic: Coding-agent and tool-use evaluation validity
Date: 2026-07-12
Owner: Codex
Cadence reason: weekly
Status: promoted

## decision need

- What decision or guideline may change: identify validity controls missing
  from the existing outcome-first agent evaluation guide.
- Target docs if promoted:
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`.
- Explicit exclusions: model ranking, universal release thresholds, public
  leaderboard reproduction, and pure retrieval/RAG evaluation.

## search and tool bounds

- Eight planned searches across two four-query batches; primary papers,
  official benchmark documentation, and official research organizations first.
- Technical findings were promoted only from original papers or official
  benchmark/methodology documentation.
- Web search exposed result pages and opened-source URLs but not an exportable
  full query trace. The consulted and promotion sources are recorded below.
- Original source snapshots judged durable and valuable were copied with SHA-256 checksums
  to `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-12-agent-evaluation-refresh/`.

## sources checked

| Source | Type | Accessed | Relevance | Decision |
| --- | --- | --- | --- | --- |
| [METR Time Horizons](https://metr.org/time-horizons/) and [HCAST](https://metr.org/hcast.pdf) | official research + primary paper | 2026-07-12 | Defines human-duration-conditioned 50%/80% horizons, comparable affordances, task coverage, and limitations. | promoted with applicability guards |
| [SWE-bench evaluation guide](https://www.swebench.com/SWE-bench/guides/evaluation/) and [repository](https://github.com/SWE-bench/SWE-bench) | official benchmark docs/code | 2026-07-12 | Executable patch verification in containerized repository snapshots. | no-change; already covered by outcome/fixture rules |
| [SWE-rebench](https://arxiv.org/abs/2505.20411) | primary research | 2026-07-12 | Rolling fresh tasks, date tracking, contamination labels, pinned environments; documents automated-curation trade-offs. | promoted |
| [A Time-Consistent Benchmark for Repository-Level Software Engineering Evaluation](https://arxiv.org/abs/2603.26137) | primary preprint | 2026-07-12 | Pre/post snapshot separation and matched A/B controls; prompt granularity is a benchmark variable. | promoted conservatively; limited two-repository evidence |
| [SWE-Explore](https://arxiv.org/abs/2606.07297) | primary preprint | 2026-07-12 | Fixed-budget repository exploration diagnostics: coverage, ranking, and context efficiency. | promoted as diagnostic, not release gate |
| [ReliabilityBench](https://arxiv.org/abs/2601.06112) | primary preprint | 2026-07-12 | Repetition, semantic perturbations, and controlled tool faults. | no-change; existing guide already covers these controls |
| [Search-Time Contamination in Deep Research Agents](https://arxiv.org/abs/2606.05241) | primary preprint | 2026-07-12 | Search can expose benchmark metadata, context, or answers during inference. | promoted as a general search/network isolation guard; numeric claims not promoted |
| [PaperBench](https://openai.com/index/paperbench/) | official benchmark report | 2026-07-12 | Hierarchical rubrics and separate judge evaluation. | no-change; current grader calibration rules cover it |
| [METR modelling-assumption note](https://metr.org/notes/2026-03-20-impact-of-modelling-assumptions-on-time-horizon-results/) | official research note | 2026-07-12 | Horizon estimates depend on curve, regularization, easy-task behavior, and suite coverage. | promoted as uncertainty/fit guard |
| [Coding Benchmarks Are Misaligned with Agentic Software Engineering](https://arxiv.org/abs/2606.17799) | position preprint | 2026-07-12 | Model, harness, context, environment, and feedback are one evaluated system. | corroboration only; not independent canonical authority |
| [RepoReason](https://arxiv.org/abs/2601.03731) | primary preprint | 2026-07-12 | Execution-generated diagnostic tasks and repository reasoning dimensions. | watch; not needed for this bounded update |
| [Power Systems Agent Benchmark](https://arxiv.org/abs/2606.20950) | primary preprint | 2026-07-12 | Deterministic executable grading and private generated cases. | project-specific-only; no domain guidance promoted |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Record repository/task/model information cutoffs and label contamination risk; prefer fresh or held-out tasks. | high | candidate-update | Evaluating coding agents on public or historical tasks. | Ordinary local regression tests with no capability claim. |
| Freeze prompt construction and information granularity alongside model/harness/tools; use matched A/B for context mechanisms. | high | candidate-update | Comparing models, maps, retrieval, prompts, or harness changes. | Exploratory debugging where no comparative claim is made. |
| Diagnose repository exploration with coverage, early ranking, and context efficiency under a fixed budget. | medium | candidate-update | Failure localization or context-cost analysis. | As the sole release/correctness gate. |
| Stratify success by task difficulty; use a human-time horizon only when its measurement assumptions hold. | medium | candidate-update | Suites spanning materially different task lengths/difficulties. | As a universal autonomy duration or across unmatched suites. |
| Add perturbation and fault-injection reliability testing. | high | no-change | Production-like agent evaluations. | N/A; already canonical. |

## conflicts and uncertainty

- Fresh automatically mined tasks reduce contamination risk but can be less
  clear or solvable than manually verified tasks.
- Human completion time is a useful task-difficulty proxy only for populations
  where it predicts agent success; it is not agent runtime.
- The 2026 time-consistent and exploration papers are recent preprints. Their
  operational controls are promoted, but their reported model scores and
  universal generality are not.
- Exploration ground truth derived from successful trajectories may omit other
  valid evidence paths, so exploration metrics remain diagnostic.

## impact on LLM-Wiki

- Canonical docs updated:
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`.
- Templates/harness files updated: none; the existing evaluation contract and
  release record were extended in place.
- Project docs affected: current status notes only; no MCP lab implementation
  or evaluation run was started.
- Math Pack used: `functions-rates-and-measurement.md` and
  `probability-statistics.md` to keep measurands, baselines, strata,
  uncertainty, and hard gates separate.

## reviewer decision

- Decision: promote
- Reason: multiple primary/official sources support bounded, testable controls
  that close concrete validity gaps without importing leaderboard claims.
- Validation report:
  `reports/validation/2026-07-12-coding-agent-evaluation-validity.md`.

## next review

- Next cadence trigger: quarterly, before an MCP/coding-agent release, or when
  task generation, repository context, browsing policy, model, harness, or
  grader changes.
- Watchlist row: AI agents/RAG/evaluation/tool use.
