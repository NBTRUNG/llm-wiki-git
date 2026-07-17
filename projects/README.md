# projects

Root `projects/` contains minimal pointers to real project repositories.

## rule

When a project has a real repo, that repo owns active status, tasks, docs,
decisions, and source code. LLM-Wiki keeps only a route to the repo entry file.

Pre-repo project source-of-truth files live under `wiki/projects/<project>/`
until the real repo exists.

Raw evidence, extracted indexes, WAP proposals, gateway output, and audit logs
do not live in LLM-Wiki or in the project repo. They live in Agent Platform,
namespaced by project:

```text
/home/admindebian/Agent-Platform/raw/projects/<project-id>/
```

Each real-repo pointer should name the repo path, one-file entry, raw namespace,
WAP/audit namespace when used, and relevant LLM-Wiki knowledge packs.

## active pointers

- [Project registry](_registry.md)
- [UniversityWeb](UniversityWeb/UniversityWeb.md)
- [pdf_tool](pdf_tool/pdf_tool.md)
- [TAO CE Evaluation](TAO-CE-Evaluation/TAO-CE-Evaluation.md)

## related

- Pre-repo project docs: [../wiki/projects/README.md](../wiki/projects/README.md)
- Navigation map rules:
  [../wiki/knowledge/project-docs/navigation_maps.md](../wiki/knowledge/project-docs/navigation_maps.md)
