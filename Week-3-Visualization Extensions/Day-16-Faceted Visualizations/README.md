# Day 16: Faceted Visualizations in R

Welcome to Day 16 of the 30 Days of R challenge! Today, we continue with Week 3 by exploring **Faceted Visualizations** using `ggplot2`. Faceting (or paneling) allows you to split a single plot into multiple subplots based on one or more categorical variables. This is one of the most powerful tools for discovering hidden patterns or interactions across groups without cluttering a single canvas.

## Core Concepts Covered
* **`facet_wrap()`**: Wraps a 1D ribbon of panels into a 2D grid layout based on a single discrete variable.
* **`facet_grid()`**: Forms a matrix of panels defined by row and column faceting variables ($row \sim col$).
* **Controlling Scales**: Freeing up plot axes (`scales = "free"`, `"free_y"`, or `"free_x"`) to let individual panels scale to their own data limits.
* **Adjusting Grid Layouts**: Controlling the number of rows (`nrow`) or columns (`ncol`) in wrapped panels.

---

## Functions Reference Table

| Function | Description | Example Syntax |
| :--- | :--- | :--- |
| `facet_wrap(~ var)` | Generates subplots wrapped sequentially for a single variable | `+ facet_wrap(~ department, ncol = 2)` |
| `facet_grid(row ~ col)` | Generates a fixed 2D grid matrix of panels matching row/col crossings | `+ facet_grid(region ~ year)` |
| `facet_wrap(..., scales = "free_y")` | Unlinks the Y-axis so each plot panel calculates its own heights | `+ facet_wrap(~ product, scales = "free_y")` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Breaking an aggregate multi-line chart into a wrapped panel view by product group.
2. Generating a clean 2D comparison matrix using grid facets to compare regions against categories.
3. Loosening layout constraints with free scales to reveal structural nuances in highly varied groups.
