# decisions doc guide

## purpose

`docs/decisions.md` records meaningful product, architecture, security, data, and workflow decisions for a concrete repo.

It is not a meeting log and not a task list.

## when to add a decision

Add a decision when the choice:

- changes architecture, stack, security posture, data model, public behavior, deployment, or project boundary;
- resolves a trade-off that future agents may reopen;
- rejects a tempting alternative;
- affects multiple tasks or shared contracts;
- creates risk that needs a review condition.

Do not add a decision for routine implementation details, typo fixes, or choices already dictated by the repo.

## recommended ADR shape

- Date.
- ID.
- Title.
- Status: proposed, accepted, superseded, deprecated, rejected.
- Context.
- Options considered.
- Decision.
- Reason.
- Consequences: positive and trade-offs.
- Review condition.
- Links to related tasks, contracts, architecture, or superseding decisions.

## quality criteria

- A future agent can see what was chosen and why.
- Rejected options are recorded enough to prevent repeat debate.
- Consequences are honest.
- Review condition is concrete.
- The decision links to affected contracts/tasks when relevant.

## anti-patterns

- Using ADRs as task status updates.
- Recording decisions without alternatives.
- Writing "we chose X" without consequences.
- Letting accepted decisions conflict with current contracts.
