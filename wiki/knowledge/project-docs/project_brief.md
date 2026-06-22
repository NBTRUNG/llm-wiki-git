# project brief guide

## purpose

`docs/project_brief.md` is the product/system contract for a concrete repo.

It explains what the project is, why it exists, who it serves, what is in scope, what is out of scope, and what success means.

## include

- Problem and goal.
- Users, operators, reviewers, and stakeholders.
- Project orientation summary, linked to `docs/project_orientation.md`.
- System boundary: in scope and out of scope.
- Functional and non-functional requirements.
- Durable data/entities and key relationships when relevant.
- Critical user/operator flows.
- Constraints, assumptions, open questions.
- Links to execution docs: contracts, decisions, tasks, test matrix.

## quality criteria

- A new agent can understand the project without reading code first.
- Scope boundaries are explicit enough to prevent feature drift.
- Business intent appears before implementation details.
- The orientation summary matches `docs/project_orientation.md`.
- Non-goals are concrete, not vague.
- Requirements are testable or can be mapped to tasks.
- Trade-offs are linked to `docs/decisions.md`, not hidden in prose.

## anti-patterns

- Turning the brief into a task log.
- Mixing current sprint status into the brief.
- Leaving out non-goals.
- Describing implementation before explaining the user/business need.
- Using old concept docs as source of truth after a repo exists.
