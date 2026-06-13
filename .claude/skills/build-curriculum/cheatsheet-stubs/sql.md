# Cheatsheet stub — Analytical SQL

> Generic, no personal data. Copy into a track and specialize to the JD's stack (BigQuery / Snowflake /
> Postgres / dbt etc.). Skim once before the closed-book quiz.

## Window functions (the #1 live-whiteboard topic)
- `ROW_NUMBER() OVER (PARTITION BY g ORDER BY y)` — top-N-per-group (no ties); vs `RANK()` (ties leave
  gaps) vs `DENSE_RANK()` (ties, no gaps). Pick by how you want ties handled.
- Running total / moving average: **always specify the frame** — `SUM(x) OVER (ORDER BY d ROWS BETWEEN
  6 PRECEDING AND CURRENT ROW)`. The default frame (`RANGE ... CURRENT ROW`) surprises people.
- Percent of partition total: `x / SUM(x) OVER (PARTITION BY g)`.
- `LAG()/LEAD()` for deltas; gap-and-island sessionization = LAG + cumulative SUM of a new-session flag.

## CTEs vs subquery vs temp table
- CTE: readability + reuse within one query; recursive CTEs walk hierarchies.
- Subquery: inline, one-off.
- Temp table: materialize once, reuse across queries / when the optimizer struggles.

## Joins
- Anti-join: prefer `NOT EXISTS` over `NOT IN` (NULL in the subquery makes `NOT IN` return no rows).
- Cardinality bug: a join that multiplies rows — spot it by checking the join keys' uniqueness.
- Move a filter from `WHERE` to `ON` to preserve a LEFT JOIN's outer rows.

## NULL traps
- `NULL != NULL` → always `IS NULL`. `COUNT(*)` counts NULLs; `COUNT(col)` doesn't; `AVG` ignores them.

## Aggregation
- Pivot with `SUM(CASE WHEN ... THEN x END)`. `WHERE` filters rows; `HAVING` filters groups.
- `GROUPING SETS` / `ROLLUP` / `CUBE` for subtotals.

## Warehouse specifics (specialize to the JD)
- BigQuery: partitioning prunes by partition column; clustering prunes within; `DATE(ts)` in a filter
  blocks partition pruning. `SAFE_DIVIDE`, `UNNEST` arrays. dbt: staging → intermediate → marts, `ref()`.

## Practice the muscle
Be able to write a top-N-per-group, a 7-day moving average, and a pivot **without looking anything up**,
and to spot a NULL/cardinality bug in under a minute.
