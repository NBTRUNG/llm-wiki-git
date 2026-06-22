# intake

Use intake before doing work.

## purpose

Intake turns a user request into a scoped work item.

It prevents:

- jumping to the wrong project;
- reading too much context;
- editing the wrong source of truth;
- treating vague ideas as implementation tasks;
- skipping evidence.

## steps

1. Restate the current user request in one sentence.
2. Classify request type.
3. Identify source of truth.
4. Choose risk lane.
5. Choose operation or template.
6. Identify task input and output.
7. Identify allowed write targets.
8. Identify shared contracts needed for code work.
9. Identify required validation.

## request types

| Type | Use when | Typical next file |
| --- | --- | --- |
| `research` | Read sources and synthesize knowledge | `../program.md` |
| `wiki improvement` | Organize or update llm-wiki | `../program.md` |
| `harness improvement` | Improve process/rules/templates | `task-packet.md` |
| `new spec` | Turn an idea into project artifacts | `project-bootstrap.md` |
| `project planning` | Decompose a broad project into phases/workstreams/tasks | `task-decomposition.md` |
| `spec slice` | Work on a scoped part of a spec | `task-decomposition.md` or `task-packet.md` |
| `change request` | Change existing behavior | `task-packet.md` |
| `maintenance` | Security, dependency, performance, cleanup | `risk-lanes.md` |
| `code implementation` | Modify source code | `project-workflow.md` + project docs |
| `validation` | Test, review, or gather proof | `validation-report.md` |
| `compile` | Compile project docs into wiki views | `../program.md` |

## intake note

```md
## intake

- Request:
- Type:
- Source of truth:
- Risk lane:
- Complexity:
- Delegation:
- Contracts:
- Input:
- Output:
- Files to read:
- Allowed write targets:
- Validation:
- Out of scope:
```

## hard rules

- If the request is about `llm-wiki` or `harness`, do not edit project code.
- If the request is about one project, do not touch another project.
- If a repo exists, update repo docs as source of truth, not compiled wiki summaries.
- If code work touches shared names, read or create `docs/contracts.md` before implementation.
- If a task will be delegated, make it Atomic, Clear input/output, Idempotent, and Decidable first.
- If source of truth is unclear, stop and clarify or mark `unknown`.

## anti-patterns

Evidence-backed anti-patterns from LLM-Wiki intake history. Same `The "..." trap` style as [[../wiki/knowledge/project-docs/multi-agent-coordination.md#anti-patterns]].

- **The "skip-intake-it's-small" trap** — even a one-line edit in a wiki file is a `wiki improvement` that needs source-of-truth identification. Skipping intake classifies in the agent's head, not in writing; the next reviewer has no record of why the file was touched. Evidence: [[../reports/validation/2026-05-21-control-files-rewrite.md]] (the active/global-rules/constitution/program split happened because intake had been collapsed and roles drifted).
- **Treating vague ideas as `code implementation`** — an idea ("add a feature for X") without exact input/output is `new spec` or `project planning`, not `code implementation`. Misclassification leads to delegation of work that is not ACID-complete and the agent invents the missing contract.
- **The "while-you're-at-it" trap** — handling a request that says "fix X and also do Y in another project" as one work item. One request = one project = one source of truth. The second item needs its own intake, its own source-of-truth check, and its own allowed-write-targets check.
- **Editing repo files in response to a `wiki improvement` request (or vice versa)** — the request type binds allowed write targets. If during the work a different file appears to need editing, that is a new request and needs new intake. Silent scope expansion violates [[../global-rules.md#work-rules]].
- **Skipping the source-of-truth step** — every request must name its source of truth before any read or edit. "I'll figure it out as I go" is how dual-write drift starts and how `active.md` becomes a project status board.
- **Choosing risk lane after starting work** — risk lane decides validation gates and review requirements. Choosing it retroactively means the gates were not applied. Choose it at step 4 of intake, not at handoff.
- **Conflating `harness improvement` with `wiki improvement`** — harness files (process/rules) and wiki knowledge files (reusable lessons) have different update rules and different evidence gates. A change to `harness/` is process; a change to `wiki/knowledge/` is content. See request-types table above.
