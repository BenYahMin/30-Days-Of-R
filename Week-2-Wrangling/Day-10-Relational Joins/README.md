# Day 10: Relational Joins

Welcome to Day 10 of the **30-Days-Of-R** challenge! Today's focus is on mastering relational joins using the `dplyr` package to combine datasets based on shared keys.

## Concepts Learned

### Mutating Joins
Mutating joins combine variables from two data frames by matching observations based on their keys.
*   **`inner_join()`**: Returns all rows from `x` where there are matching values in `y`.
*   **`left_join()`**: Returns all rows from `x`, and all columns from `x` and `y`. Unmatched rows in `y` get `NA`.
*   **`right_join()`**: Returns all rows from `y`, and all columns from `x` and `y`. Unmatched rows in `x` get `NA`.
*   **`full_join()`**: Returns all rows and all columns from both `x` and `y`. Wherever there are no matching values, returns `NA`.

### Filtering Joins
Filtering joins affect the rows, but never modify the columns of the primary dataset.
*   **`semi_join()`**: Keeps all rows from `x` that have a match in `y`.
*   **`anti_join()`**: Keeps all rows from `x` that *do not* have a match in `y`. Useful for finding mismatches or anomalies.

---

## Join Quick Reference Table

| Join Type | Keeps Unmatched Left (`x`)? | Keeps Unmatched Right (`y`)? | Adds Columns from `y`? |
| :--- | :---: | :---: | :---: |
| `inner_join` | ❌ | ❌ |  |
| `left_join` |  | ❌ |  |
| `right_join` | ❌ |  |  |
| `full_join` |  |  |  |
| `semi_join` | ❌ | ❌ | ❌ |
| `anti_join` |  | ❌ | ❌ |

---

## Code Highlight

Joining datasets with different key column names syntax:
```R
data %>% 
  left_join(other_data, by = c("left_key" = "right_key"))