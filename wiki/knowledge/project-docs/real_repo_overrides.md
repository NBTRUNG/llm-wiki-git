# real repo overrides guide

## purpose

Real repo overrides define when repo-specific instructions can override general LLM-Wiki knowledge.

This is a general standard. It is not a project-specific override file.

## priority order

Use this order unless a higher-level safety rule conflicts:

1. Current user request.
2. Safety/security/privacy constraints.
3. Repo `AGENTS.md` or equivalent entry rules.
4. Repo source-of-truth docs: brief, architecture, decisions, contracts, tasks, test matrix, project status, agent status.
5. LLM-Wiki knowledge/playbooks.
6. Model background knowledge.

## good repo overrides

- Explain project-specific constraints.
- Point to source-of-truth docs.
- Define read order.
- Define verification expectations.
- Define forbidden technologies or behaviors.
- Define how agents should update status/evidence.

## invalid or risky overrides

- "Skip tests" without reason.
- "Ignore contracts/status docs".
- Add a new stack or external service without ADR.
- Override security/privacy constraints silently.
- Make reports the only source of current state.

## quality criteria

- Overrides are specific, short, and actionable.
- They do not duplicate the full LLM-Wiki playbook.
- They link back to repo source-of-truth files.
- They identify what wins when files conflict.
