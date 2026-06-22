# data model example

Guide before adapting: `wiki/knowledge/project-docs/scaffold_examples.md`

## entity relationship

```text
<entity_a> 1 ---- N <entity_b>
```

## tables or entities

### <entity_name>

| Field | Type | Constraint | Notes |
| --- | --- | --- | --- |
| id |  | primary key |  |
| created_at |  | required |  |
| updated_at |  | required |  |

## naming conventions

- Table/entity names:
- Field names:
- Index names:
- Migration names:

## migration rules

- Schema changes require a migration or documented equivalent.
- Data migration needs sample or dry-run evidence when possible.
- Production-risk changes need a rollback or recovery note.
