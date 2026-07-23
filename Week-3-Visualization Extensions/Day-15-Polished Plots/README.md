# Day 15: Polished Plots in R

Welcome to Day 15 of the 30 Days of R challenge! Today, we explore how to take functional charts and turn them into publication-ready, **Polished Plots** using `ggplot2`. Making data visualizations clear, readable, and aesthetically pleasing is a crucial communication skill for any data scientist.

## Core Concepts Covered
* **Ggplot Themes**: Utilizing built-in complete themes (`theme_minimal()`, `theme_classic()`, `theme_bw()`).
* **Granular Customization**: Fine-tuning text elements, chart backgrounds, margins, and legend positioning via the `theme()` function.
* **Color and Fill Scales**: Customizing plot colors using `scale_color_brewer()` (ColorBrewer palettes) and manual scales.
* **Coordinate Flips**: Flipping axes with `coord_flip()` to make long categorical labels highly readable.

---

## Functions Reference Table

| Component / Function | Description | Common Arguments / Options |
| :--- | :--- | :--- |
| `theme_minimal()` | Applies a clean, modern base theme with light gray gridlines | *No arguments needed* |
| `scale_color_brewer()` | Applies professionally curated color palettes to discrete variables | `palette = "Set2"`, `palette = "Dark2"` |
| `theme()` | Overrides specific theme elements for bespoke customizations | `legend.position`, `plot.title = element_text()` |
| `element_text()` | Controls font properties inside theme adjustments | `size`, `face = "bold"`, `hjust` (alignment) |
| `coord_flip()` | Swaps X and Y axes (excellent for horizontal bar charts) | *No arguments needed* |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Transforming a standard, gray-background plot into a clean, minimalist visualization.
2. Modifying typography hierarchy to make titles bold, centered, and distinct.
3. Repositioning plot legends to optimize screen real estate.
4. Flipping axes to prevent cluttered text strings from overlapping.
