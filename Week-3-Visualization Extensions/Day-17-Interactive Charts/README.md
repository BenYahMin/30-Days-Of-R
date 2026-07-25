# Day 17: Interactive Charts in R

Welcome to Day 17 of the 30 Days of R challenge! Today, we transition from static graphics to web-browser **Interactive Charts** using the `plotly` package therefore you will be required to install the library plotly. By wrapping our `ggplot2` foundations with `plotly`, we can instantly add tooltips, panning, zooming, and dynamic filtering to our visualizations without rewriting our rendering logic from scratch.

## Core Concepts Covered
* **`ggplotly()`**: Converting static `ggplot` objects directly into fully interactive, HTML/JavaScript-driven widgets.
* **Custom Tooltips**: Using the `text` aesthetic inside `aes()` to control exactly what information displays when a user hovers over a data point.
* **Interactive Geoms**: Exploring how scatter plots (`geom_point`) and line charts (`geom_line`) translate to interactive spaces.
* **Layout Adjustments**: Disabling or tweaking interactive elements to keep charts clean and responsive.

---

## Functions Reference Table

| Function / Argument | Description | Example Syntax |
| :--- | :--- | :--- |
| `ggplotly(p)` | Converts a static ggplot object `p` into an interactive plotly canvas | `ggplotly(my_plot)` |
| `ggplotly(..., tooltip = "text")` | Restricts the hover popup tooltip to display *only* the custom text aesthetic | `ggplotly(p, tooltip = "text")` |
| `aes(text = ...)` | Configures a custom string mapping used specifically for interactive hover metadata | `aes(x, y, text = paste("User:", name))` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Writing a custom HTML-style string to control hover tooltip layouts.
2. Converting a standard multi-variable scatter plot into an exploratory interactive chart.
3. Building an interactive line graph tracking cross-sectional data over timelines.