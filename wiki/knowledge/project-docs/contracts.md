# contracts doc guide

## purpose

`docs/contracts.md` is the source of truth for shared names and cross-layer contracts inside a concrete repo.

It prevents agents from inventing aliases, routes, helpers, components, APIs, DTOs, CMS fields, or permissions independently.

## include

- Naming conventions.
- Shared constants and aliases.
- CMS/document/property aliases when relevant.
- Routes and public paths.
- API/form contracts.
- Service/helper function names.
- Frontend component/input/state contracts.
- Shared types/models.
- Permissions/roles/events.
- Status for each row: proposed, accepted, changed, retired.

## quality criteria

- Code tasks can cite specific contract rows.
- Shared names are accepted before implementation.
- Renames require a decision or migration note.
- Proposed rows do not silently unblock implementation.
- The contract is concise enough to scan.

## anti-patterns

- Treating contracts as a dumping ground for every local variable.
- Changing aliases in code before updating contracts.
- Reusing a contract ID for a different meaning.
- Forgetting to retire superseded contracts.
