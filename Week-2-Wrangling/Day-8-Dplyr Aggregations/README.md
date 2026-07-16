# Day 8: Data Aggregation with `dplyr`

Welcome to Day 8 of the **30 Days of R** challenge! Today's focus shifts from basic row/column manipulation to **data aggregation**—summarizing datasets, grouping observations, and performing grouped calculations using `dplyr`.

## Core Concepts Covered Today
1. **`summarise()` (or `summarize()`)**: Reducing multiple values down to a single summary statistic (e.g., `mean()`, `sum()`, `n()`).
2. **`group_by()`**: Splitting your dataset into implicit groups so that downstream operations (like `summarise` or `mutate`) are performed "per group".
3. **`count()`**: A quick helper function to find the frequency of unique categorical values.
4. **Grouped `mutate()`**: Creating new columns that depend on group-level statistics (e.g., calculating a percentage of a group total).

## Key Functions & Snippets
* **Basic Grouped Summary**:
  ```R
  df %>%
    group_by(category) %>%
    summarise(
      mean_val = mean(value, na.rm = TRUE),
      total_count = n()
    )