# Day 19: Descriptive Stats in R

Welcome to Day 19 and the start of **Week 4: Applied Statistics** in the 30 Days of R challenge! Now that we have built robust skills in data wrangling and visualization, we shift our focus to statistical analysis. Today, we focus on **Descriptive Statistics**—the fundamental process of summarizing and understanding the central tendencies, spread, and shape of your data.

## Core Concepts Covered
* **Measures of Central Tendency**: Finding where the middle of your data lies using mean (`mean()`) and median (`median()`).
* **Measures of Dispersion**: Assessing data spread using variance (`var()`), standard deviation (`sd()`), range (`range()`), and Interquartile Range (`IQR()`).
* **Summary Matrices**: Generating broad statistical profiles efficiently with `summary()` and `quantile()`.
* **Grouped Summaries**: Combining `dplyr` grouping verbs with statistical metrics to compare distributions across categories.

---

## Functions Reference Table

| Function | Statistical Metric | Handling Missing Values |
| :--- | :--- | :--- |
| `mean(x)` | Arithmetic average of vector elements | `na.rm = TRUE` |
| `median(x)` | Middle value separating the higher half from the lower half | `na.rm = TRUE` |
| `sd(x)` | Standard deviation (square root of variance) | `na.rm = TRUE` |
| `IQR(x)` | Interquartile Range ($Q_3 - Q_1$) | `na.rm = TRUE` |
| `quantile(x, probs)` | Calculates specific sample percentiles | `na.rm = TRUE` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Extracting global measures of central tendency and dispersion for raw metrics.
2. Isolating specific custom percentiles (e.g., the 90th and 95th percentiles) to analyze distribution tails.
3. Writing grouped summarization pipes to profile statistical metrics across distinct categorical groups.