# Day 9: Data Reshaping with tidyr

Welcome to Day 9 of the *30 Days of R* challenge! Today, we transition from aggregating datasets to restructuring them. We focus on turning "wide" datasets into "long" ones (and vice versa) to make data "tidy" and ready for modeling or visualization.

## Core Concepts Covered Today

1. **Tidy Data Principles**: Understanding the core tenet—each variable forms a column, each observation forms a row, and each type of observational unit forms a table.
2. *pivot_longer()*: Collapsing multiple columns into two key-value columns, turning wide data into a tall/long format.
3. *pivot_wider()*: Distributing a unique key's values into new individual column headers, expanding long data into a wide format.
4. *separate_wider_delim()* / *separate_wider_position()*: Splitting a single character column into multiple distinct variables.
5. *unite()*: Combining multiple column strings into a single column.

## Key Functions & Snippets

- **Wide to Long**:
  ```r
  df_long <- df %>%
    pivot_longer(
      cols = c(q1, q2, q3),
      names_to = "quarter",
      values_to = "revenue"
    )

- **Long to Wide**:
  ```r
  df_wide <- df %>%
  pivot_wider(
    names_from = metric,
    values_from = measurement
  )
    