---
name: linear-algebra
description: Linear algebra guidance for vectors, matrices, similarity, embeddings, ranking, dimensionality, and ML/RAG foundations.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# linear algebra

Use this guide for embeddings, similarity, ranking, ML/RAG foundations,
recommendations, transforms, and high-dimensional data.

## concepts

- **Vector**: ordered numeric representation of an item.
- **Matrix**: rectangular numeric structure; useful for transformations and
  batches of vectors.
- **Norm**: vector length.
- **Dot product**: alignment between vectors.
- **Cosine similarity**: direction similarity, often used for normalized
  embeddings.
- **Distance metric**: numeric dissimilarity; choose one that matches the
  index/library behavior.
- **Dimensionality**: number of vector components; high dimensions affect
  storage, search speed, and meaning.

## RAG and ranking checks

- Know whether embeddings are normalized.
- Know whether the vector index uses cosine, dot product, or L2 distance.
- Do not compare scores across different embedding models or indexes without
  calibration.
- Use reranking when semantic similarity is too broad or high stakes.
- Track metadata filters; vector similarity alone does not enforce source,
  tenant, date, or permission boundaries.

## anti-patterns

- Treating embedding similarity as truth.
- Mixing embedding models in one index without version metadata.
- Ignoring vector dimension and index metric when migrating providers.
- Using nearest neighbor results without citation/support validation.

