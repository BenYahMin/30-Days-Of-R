# Day 13: Ggplot Foundations in R

Welcome to Day 13 of the 30 Days of R challenge! Today, we transition from data wrangling to data visualization using the gold standard of R graphics: `ggplot2` (part of the tidyverse). Built on the **Grammar of Graphics**, `ggplot2` allows you to create complex, multi-layered plots by mapping variables to visual properties.

## Core Concepts Covered
* **The Grammar of Graphics**: Understanding data, aesthetic mappings (`aes`), and geometric layers (`geom`).
* **Essential Geoms**: Creating scatter plots (`geom_point`), line graphs (`geom_line`), and bar charts (`geom_bar` / `geom_col`).
* **Basic Aesthetics**: Mapping variables to `x`, `y`, `color`, `fill`, and `size`.
* **Global vs. Local Mapping**: Setting aesthetics globally in `ggplot()` versus locally inside individual geometric layers.

---

## Functions Reference Table

| Component / Function | Description | Example |
| :--- | :--- | :--- |
| `ggplot(data, aes())` | Initializes a plot object and defines default data and mappings | `ggplot(df, aes(x = age, y = income))` |
| `geom_point()` | Adds a scatter plot layer (continuous vs. continuous) | `base_plot + geom_point()` |
| `geom_line()` | Adds a line layer (ideal for trends over time) | `base_plot + geom_line()` |
| `geom_col()` | Adds a bar chart where heights represent values in the data | `ggplot(df, aes(x = category, y = total)) + geom_col()` |
| `labs()` | Modifies plot labels (titles, subtitles, captions, and axis tags) | `labs(title = "Sales Trends", x = "Year")` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Initializing a basic plot mapping numeric continuous variables to look for correlations.
2. Creating a dual-layer visualization combining points and lines to show time-series trends.
3. Building a categorical tracking bar chart to compare aggregates.
4. Customizing your plots with clear descriptive labels.
