# Day 21: ANOVA Models in R

Welcome to Day 21 of the 30 Days of R challenge! Today, we extend our hypothesis testing capabilities from comparing two groups (t-tests) to comparing three or more groups simultaneously using **Analysis of Variance (ANOVA)**. ANOVA tests whether the means of several groups are equal by analyzing the variance between groups relative to the variance within groups.

## Core Concepts Covered
* **One-Way ANOVA**: Testing for statistically significant differences among the means of three or more independent groups using `aov()`.
* **The F-Statistic and p-value**: Interpreting the overall omnibus test results to determine if at least one group mean significantly differs from the others.
* **Post-Hoc Testing (Tukey's HSD)**: Running pairwise comparisons with `TukeyHSD()` after a significant ANOVA to identify exactly *which* groups differ while controlling the Type I error rate.
* **ANOVA Summary Metrics**: Cleaning and extracting statistical summaries using `summary()`.

---

## Functions Reference Table

| Function | Purpose | Example Syntax |
| :--- | :--- | :--- |
| `aov(formula, data)` | Fits an Analysis of Variance model | `aov(sales ~ region, data = df)` |
| `summary(aov_object)` | Displays the ANOVA table, including degrees of freedom, Sum of Squares, F-statistic, and p-value | `summary(my_anova)` |
| `TukeyHSD(aov_object)` | Performs Tukey's Honestly Significant Difference test for post-hoc pairwise comparisons | `TukeyHSD(my_anova)` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Setting up a categorical factor with three levels and fitting a One-Way ANOVA model.
2. Evaluating the omnibus F-test summary to check for statistically significant differences.
3. Conducting a post-hoc Tukey HSD test to isolate which paired group means drive the variance.
4. Visualizing the group distributions using a box plot to verify the statistical conclusions.