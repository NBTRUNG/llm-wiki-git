# infra topology example

Guide before adapting: `wiki/knowledge/project-docs/scaffold_examples.md`

## environments

| Environment | URL | Deploy trigger | Data store | Notes |
| --- | --- | --- | --- | --- |
| local |  | manual |  |  |
| staging |  |  |  |  |
| production |  |  |  |  |

## required configuration

Use placeholders only. Do not commit real secrets.

```text
APP_ENV=
APP_PORT=
DATABASE_URL=
LOG_LEVEL=
```

## network and ports

| Service | Local port | Runtime port | Public? |
| --- | --- | --- | --- |
|  |  |  |  |

## operational checks

- Build command:
- Test command:
- Health check:
- Backup/restore check:
- Secret rotation owner:
