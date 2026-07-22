# Day 14: Visualizing Distributions in R

Welcome to Day 14 of the 30 Days of R challenge! Today, we dive deeper into data visualization with `ggplot2`, focusing on **Visualizing Distributions**. Understanding how data points are spread across a variable's range is a critical step in Exploratory Data Analysis (EDA). This allows you to identify skewness, modality, and outliers.

## Core Concepts Covered
* **Histograms (`geom_histogram`)**: Visualizing the distribution of a single continuous variable by dividing it into bins.
* **Density Plots (`geom_density`)**: Creating smooth, continuous curves that represent the probability density of a variable.
* **Box plots (`geom_boxplot`)**: Summarizing a continuous variable through its quartiles, median, and potential outliers.
* **Aesthetic Mapping for Distributions**: Using `fill` and `color` to compare distributions across groups.

---

## Functions Reference Table

| Function | Description | Key Arguments |
| :--- | :--- | :--- |
| `geom_histogram()` | Creates a histogram layer for a continuous variable | `bins` (number of bars), `binwidth` |
| `geom_density()` | Draws a smoothed kernel density estimate curve | `alpha` (transparency for overlapping groups) |
| `geom_boxplot()` | Builds a box-and-whisker plot to show data structure | `outlier.color`, `outlier.shape` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Building a custom histogram to check the shape and spread of a continuous numerical metric.
2. Overlaying transparent density plots to compare a variable across different categories.
3. Generating a box plot to visually isolate statistical outliers across groups.