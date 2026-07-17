# feedback loop

Use this workflow when observations from real project work need to flow back
into LLM-Wiki as durable improvements.

This is the backpropagation pass: real project execution → structured
observation → classified insight → evidence gate → filing into wiki, harness,
or constitution.

For the forward pass (reading from wiki into project work), see
[[read-workflow.md]].
For the file-back operation and rubric, see [[../program.md#6-operation-file-back-insight]].

---

## purpose

Without a formal feedback loop, reusable lessons stay implicit, anti-patterns
repeat across projects, and the wiki diverges from how real work actually
behaves.

This workflow prevents:

- filing vague AI-generated requirements without evidence;
- constitutional amendments that conflict with existing laws;
- knowledge files with stale confidence levels;
- anti-patterns that surface repeatedly but are never written down;
- known gaps that accumulate invisibly.

---

## trigger conditions

A feedback loop session is required when any of these occur during or after
real project work:

| Trigger | Type |
|---|---|
| An agent failed or went off-track because no guidance existed | `gap` |
| An agent followed the wiki but produced a wrong result | `contradiction` |
| A pattern worked in one project and is likely reusable | `lesson` |
| The same mistake appeared in ≥2 project tasks | `anti-pattern` |
| A harness rule was ambiguous and the agent interpreted it inconsistently | `harness improvement` |
| A constitutional law was unclear, too broad, or produced an unintended outcome | `amendment proposal` |
| A knowledge file's `confidence` label no longer reflects real usage | `confidence review` |
| AI wrote backpropagation requirements from project experience | `bp-requirement` |

If none of these apply, do not open a feedback loop session. Use
[[../program.md]] file-back operation directly for straightforward lessons.

---

## classification

Classify the observation before writing anything.

| Class | Target | Risk lane |
|---|---|---|
| `lesson` | `wiki/knowledge/` | normal |
| `anti-pattern` | add to existing harness or knowledge file | normal |
| `gap` | new harness or knowledge section | normal |
| `contradiction` | update + mark superseded | normal |
| `harness improvement` | `harness/` file | normal |
| `amendment proposal` | `llm-wiki-constitution.md` | high-risk |
| `confidence review` | update YAML frontmatter only | tiny |
| `bp-requirement` | classify further into one of the above | — |

`bp-requirement` is not a final class. AI-generated backpropagation
requirements must be decomposed into one or more of the classes above before
filing. A requirement that cannot be classified is not ready to file.

---

## evidence gate

No observation enters `wiki/`, `harness/`, or `llm-wiki-constitution.md`
without passing the evidence gate.

| Gate | Requirement |
|---|---|
| Evidence | At least one link to a validation report, task result, agent report, decision file, or test output. Conversation alone is not evidence. |
| Generalization | The observation must apply to ≥1 context beyond its source project. Project-specific execution details stay in the project repo. |
| Source tag | `source_project` must be named. `llm-wiki` is allowed for governance observations. |

If any gate fails, record the observation with a `needs-review` marker under
`/home/admindebian/Agent-Platform/raw/projects/<project-id>/research/`. If the
Agent Platform root is unavailable or outside the approved write scope, put a
pointer in the deferred candidate queue and request the required write access;
do not fall back to active storage under local `raw/`. Do not file the
observation into canonical locations.

---

## deferred candidate queue

If an observation is credible but not ready to file, record it in a queue instead
of relying on memory or burying it in a validation report.

Use this queue when:

- evidence exists but the generalization gate is not yet met;
- a metric surfaced an instrumentation gap that needs a future measured cycle;
- a raw holding item needs review before it can become knowledge;
- a candidate lesson is explicitly deferred pending a second project.

The LLM-Wiki governance queue lives at:

```text
wiki/projects/llm-wiki/docs/feedback_loop_queue.md
```

Real repos may keep the same shape at `docs/feedback_loop_queue.md` when the
deferred item belongs to that repo's active work.

Each queue row must include:

- candidate id;
- one-sentence observation;
- proposed class;
- evidence link;
- missing gate or reason deferred;
- next review trigger;
- current disposition.

Review the queue during each feedback-loop session before updating known gaps.
Close an item only by filing it, rejecting it with a reason, or converting it to
a known gap. Do not let a queued candidate enter `wiki/`, `harness/`, or the
constitution until the normal evidence gate passes.

---

## bp-requirement intake

When AI writes backpropagation requirements from real project experience,
apply this intake before filing.

For each requirement:

1. Restate the requirement in one sentence.
2. Name the source project and the specific task or event that produced it.
3. Classify into one of the seven classes above.
4. Apply the evidence gate. Stop here if the gate fails.
5. Check for conflict with existing constitution or harness rules.
6. Run the ACID check if the requirement is a harness or process change:
   - Atomic: is this one clear change, not a bundle?
   - Clear input/output: is it clear what exists before and after?
   - Idempotent: if applied twice, does it produce a consistent result?
   - Decidable: can a future agent verify it was applied correctly?
7. Route to the correct operation below.

ACID failure is a stop condition. Rewrite or discard the requirement.
Do not lower the bar because the source is AI-generated.

---

## operations by class

### lesson or gap

Follow `program.md §6 operation: file-back insight`.

Use [[../templates/lesson_filed.template.md]] for new knowledge files.

For gaps: draft the missing section in a new or existing harness/knowledge
file. Treat it as `confidence: low` until confirmed in a second project.

### anti-pattern

Add to the closest existing harness or knowledge file under a dedicated
section:

```md
## anti-patterns

- **Name of trap**: what it looks like, why it fails, what to do instead.
```

Anti-patterns require the same evidence gate as lessons.

Name the trap using the same style as existing examples:
`The "internalize-once" trap`, `The "read-everything-to-be-safe" trap`.

### contradiction

1. Identify the existing knowledge file or harness rule being contradicted.
2. File the new observation with full evidence.
3. Mark the older content `superseded` with `superseded_by` pointing to the
   new file or section.
4. Do not delete the older content. Deprecation history is useful.

### harness improvement

Treat as a normal-lane task with a task packet:

- Required read files: the harness file being changed.
- Exact input: current wording or gap.
- Exact output: revised wording or new section.
- Acceptance criteria: the change must not conflict with `llm-wiki-constitution.md`.

### amendment proposal

Constitutional amendments are high-risk. Follow this process:

1. Draft the proposed change with `[PROPOSED]` prefix.
2. State the triggering evidence (project, task, or validation report).
3. State the current law and the problem it caused.
4. State the proposed replacement or addition.
5. Check every other law in the constitution for conflict.
6. Record the proposal in `wiki/decisions/_index.md` as a pending decision.
7. Do not edit `llm-wiki-constitution.md` until the human owner accepts.
8. After acceptance: apply the change, update §19 changelog with evidence link,
   remove the `[PROPOSED]` marker.

Amendment proposals require human acceptance. AI must not self-apply a
constitutional amendment.

### confidence review

Update YAML frontmatter only. Do not change the knowledge content.

Downgrade confidence when:

- the knowledge file has been applied in ≥2 projects with inconsistent results;
- the `date_updated` is older than 6 months and the domain is fast-moving;
- a contradiction has been filed against this file.

Upgrade confidence when:

- the file has been applied successfully in ≥2 independent projects;
- a validation report confirms the pattern held.

Record the review date in a `confidence_reviewed` field.

---

## conflict check

Before filing any observation, check:

1. Does it contradict an existing knowledge file? → classify as `contradiction`.
2. Does it contradict a harness rule? → classify as `harness improvement`.
3. Does it contradict a constitutional law? → classify as `amendment proposal`.
4. Does it duplicate an existing file? → update the existing file, do not create a new one.

If conflict cannot be resolved without human judgment, stop and raise a blocker.

---

## known gaps maintenance

`wiki/index.md` must contain a `## known gaps` section listing topics that
have no guidance in LLM-Wiki.

Update it during each feedback loop session:

- Add a gap when a trigger condition surfaces a topic with no coverage.
- Remove a gap when a lesson, guide, or harness file is filed for that topic.
- Mark a gap `low-priority` when it is out of scope for current projects.

Known gaps prevent agents from treating absence of guidance as freedom to
improvise.

---

## checkpoint

After each feedback loop session, update:

- `active.md`: record the session as a completed LLM-Wiki task if it
  changed durable state.
- `wiki/projects/llm-wiki/docs/project_status.md`: note the change type and
  file(s) affected.
- `wiki/decisions/_index.md`: add any new decisions or amendment proposals.
- `reports/validation/`: create a validation report for normal/high-risk
  changes (amendment proposals always require one).

---

## stop conditions

Stop and raise a blocker when:

- a bp-requirement cannot be classified;
- evidence gate fails and no evidence can be retrieved;
- a proposed change conflicts with ≥2 existing laws and resolution is unclear;
- an amendment proposal would change source-of-truth hierarchy (§3) or
  checkpoint law (§15) — these require explicit human review before drafting;
- the same observation has already been filed under a different name.
