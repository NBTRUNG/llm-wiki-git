# Lesson filed — template

Use this template when filing a durable reusable lesson back from a project
into `wiki/knowledge/`, `wiki/decisions/`, `wiki/vendors/`, or `wiki/research/`.

See `program.md §6 operation: file-back insight` for the rubric. A filed lesson
must satisfy the three required gates: evidence, generalization, source tag.

---

# {{lesson_title_imperative}}

lesson_id: LESSON-NNNN
date_filed: YYYY-MM-DD
source_project: {{project-id or "llm-wiki" for governance}}
source_evidence:
  - {{relative path to validation report, decision file, or test result}}
confidence: {{low | medium | high}}
status: {{active | superseded | deprecated}}
superseded_by: {{lesson_id or "n/a"}}

## summary

{{One-paragraph statement of the lesson. State the rule, principle, or finding.}}

## context

{{Where this came from. The project context, what was tried, what was observed.}}

## detail

{{Full explanation. Why it matters. What changes if you ignore it. Counter-examples
if relevant.}}

## applicable contexts

List at least one context beyond the source project where this lesson applies.
If you cannot list one, the lesson is too project-specific to file back — keep
it in the project repo instead.

- {{context 1}}
- {{context 2}}

## anti-patterns to avoid

- {{what NOT to do}}

## related

- {{links to related lessons, decisions, or knowledge files}}
