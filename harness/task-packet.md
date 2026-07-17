# task packet

Use this packet for normal or high-risk executable work, especially delegated work.

Tiny work can skip the full packet only when scope and evidence are obvious.

**Concept definitions:** For ACID rules, complexity levels, delegation guidance, and input/output contracts, see `harness/task-decomposition.md` (canonical source). For quality criteria and anti-patterns, see `wiki/knowledge/project-docs/tasks.md`.

## canonical packet

```md
## TASK-XXX - Task title

### Metadata

- Type:
- Workflow ID: WF-... | CROSS-CUTTING-...
- Affected workflows: none | WF-..., WF-...
- Workflow slice: contracts/maps | data-base | backend-code | ui | integration | validation | release-ops | other
- User/business outcome:
- Phase:
- Workstream:
- Lane:
- Execution mode: standard | bounded change fast path
- Repo Bounded Change Profile:
- Fast-path entry decision and escalation triggers:
- Complexity:
- Delegation:
- Suggested owner:
- Fallback owner:
- Assigned owner:
- Review owner:
- Claim status: unclaimed | claimed | released | blocked | stale
- Claimed by:
- Claim scope:
- Claimed at:
- Release reason:
- Next eligible owner:
- Parallelizable: yes | no
- File ownership group:
- Status:
- Review status:

### Dependencies

- 

### Capability gate

- Minimum capability tier: C0 | C1 | C2 | C3 | C4 | C5 | C6
- Required capability dimensions/domains:
- Assigned context projection: P0 Capsule | P1-BOUNDED-CODING | other approved P1 ID | P2 Map-First
- Projection source path:
- Required repo profile/capsules:
- Maximum autonomy: read-only | proposal-only | sandbox action | bounded write | delegated implementation/review | Lead/integration
- Required deterministic verifier:
- Required human/Lead review:
- Capability evidence/profile:
- Fallback owner or higher-tier handoff:

### Human-Agent Hybrid Control

- Human sponsor:
- Acceptance owner:
- Agent principal/session:
- Action-risk lane: R0 Observe | R1 Reversible | R2 Consequential | R3 Prohibited
- Allowed permission grant:
- Forbidden actions/resources:
- Human approval events:
- Grant start and expiry/review trigger:
- Interrupt/stop route: manual | implemented path | unavailable
- Rollback/recovery route: manual | verified path | unavailable
- Human responsibility: intent | risk | permission | judgment | acceptance
- Agent responsibility: bounded analysis | execution | verification support | evidence

### Contract references

- 

### Map references

- UI:
- Code:
- Data:
- Raw verification:

### Context

What behavior, document, workflow, UI, API, CMS config, or validation result must exist after this task.

### ACID check

- Atomic:
- Clear input/output:
- Idempotent:
- Decidable:

### Required read files

- 

### Required operating capsules

Pick from repo `REPO_RULES.md`: Code Capsule, UI Capsule, API/Service Capsule,
Architecture Capsule, Security Capsule, Output Quality Capsule, Large Surface
Policy if the repo defines them. Agents must apply these short rules even when
LLM-Wiki is not consulted. Use Output Quality Capsule for every non-trivial
implementation or review task.

- 

### Exact input

- 

### Exact output

- 

### Allowed write targets

- 

### Shared-file write delegation

- File:
- Section/rows:
- Operation: none | append | update row | replace section
- Lock owner:
- Review target:
- Rollback note:

### Forbidden write targets

- 

### Forbidden side effects

- 

### Large surface guard

Required when the task creates or materially changes a view, component, page,
partial, controller, query service, or client-side module. Otherwise write
`n/a`.

- Expected large files:
- Mixed concerns allowed in this task: no | yes, because:
- Operational reason for a large/mixed file:
- Split/refactor decision: n/a | split now | acceptable long-term as-is | defer after stabilization | blocker if threshold exceeded
- Refactor payoff trigger required before future extraction:
  - security issue:
  - performance regression:
  - recurring bug:
  - duplicate behavior drift:
  - conflict/review/debug cost:
  - material new behavior:
- No-behavior-change invariant when refactoring:
  - API routes unchanged:
  - DTOs unchanged:
  - visual design/copy unchanged:
  - user-visible behavior unchanged:

### Scope-creep exception policy

State which deviations from `Exact output` are pre-authorized (and which are not). Leave empty for "no deviations allowed; raise a blocker instead." Use this when the packet touches files where a small, justified deviation is more honest than splitting into a follow-up packet (e.g., adding a skip-link while building a layout, picking vanilla JS instead of Alpine when the packet says "Alpine moved/replaced").

- Pre-authorized deviations:
- Deviations requiring approval before commit:
- Deviations that always require a new task:

### Acceptance criteria

- [ ] 
- [ ] 
- [ ] 

### Validation evidence required

- 

### Agent report path

- 

### Integration merge plan path

- none | reports/integration/TASK-XXX-merge-plan.md

### Evidence path

- 

### Audit trail

- Repo task board:
- Agent control card:
- Agent report path:
- Integration merge plan:
- Codex validation report:
- Test matrix row:
- Project status update:

### Notes/blockers

- 
```

## rules

- Do not start implementation if acceptance criteria are missing.
- `Bounded Change Fast Path` is a mode inside Real Repo Work, not permission to
  omit the packet's exact output, boundaries, capability, or evidence. Apply the
  repo profile and exit the mode when its shared/local escalation trigger fires.
- Do not start implementation if exact input, exact output, or required read files are unclear.
- Do not delegate a task until it is ACID-complete (see `harness/task-decomposition.md`).
- Do not start or delegate until the capability gate is complete. Missing or
  expired agent evidence is `C0`; if tier, a mandatory dimension, projection,
  autonomy, verifier, or reviewer does not fit, shrink the packet or hand off.
- Do not infer capability from vendor, product name, parameter count, fluent
  output, or one successful run. Do not let an agent assign or upgrade itself.
- Higher-tier agents may use lower projections. Lower-tier agents must not use
  higher projections or synthesize their own capability projection.
- Code-facing `C2-C3` bounded work should name the canonical cross-repo
  `P1-BOUNDED-CODING` projection. Repo profiles/maps/capsules are coordinates,
  not replacements or new Coding Pack projections. A partial full-pack read is
  neither a complete projection nor a full Coding Pack load.
- Do not start implementation until the task is claimed by the current session,
  or the human/Lead/integration owner confirms no claim is required.
- Release a claim immediately when the task is done, blocked, paused, or
  reassigned.
- Do not assign parallel agents to overlapping allowed write targets or the same file ownership group.
- Do not invent shared function/API/component/CMS names; update `docs/contracts.md` first.
- Do not let an agent write outside allowed targets.
- Do not let an agent materially extend a large mixed-concern surface without a
  completed `Large surface guard` decision in the packet.
- Do not let a delegated implementation task edit `docs/tasks.md`,
  `docs/project_status.md`, `docs/contracts.md`, or other shared source files
  unless the task explicitly grants shared-file write delegation with file,
  section/rows, operation, lock owner, review target, and rollback note.
- Delegated agents must update the agent-owned checkpoint sections of
  `agents/<agent>/AGENT.md` before stopping.
- Delegated agents must update `AGENT.md` `result handoff` before asking the
  review target to review.
- Delegated agents create a result report only when the packet requires it or
  the report threshold is met.
- When multiple agents propose edits to the same file section/row, proposals
  must be staged in Markdown handoffs/reports or
  `reports/integration/<task-id>-merge-plan.md`; do not use retired cache/index
  systems as the draft source.
- Do not expand scope silently. Deviations from `Exact output` are counted as scope-creep (LWOE 6b) unless the packet's `Scope-creep exception policy` pre-authorizes them in writing.
- Do not mark done without evidence or documented missing proof.
- If source of truth changes, update the source file, not a compiled copy.
