# Day 20: Hypothesis Testing in R

Welcome to Day 20 of the 30 Days of R challenge! Today, we progress from descriptive summaries to **Inferential Statistics**, focusing on **Hypothesis Testing**. Hypothesis testing allows us to determine if the patterns or differences we observe in our sample data are statistically significant or if they could have easily occurred by random chance.

## Core Concepts Covered
* **Formulating Hypotheses**: Defining the Null Hypothesis ($H_0$) and the Alternative Hypothesis ($H_1$).
* **The Student's t-test**: Comparing group means using One-Sample, Independent Two-Sample, and Paired t-tests (`t.test()`).
* **Interpreting Outputs**: Evaluating the $p$-value, test statistics ($t$), degrees of freedom ($df$), and confidence intervals to make data-driven decisions against a significance threshold ($\alpha = 0.05$).
* **Assumptions Checking**: Visually scanning sample distributions before running a parametric test.

---

## Functions Reference Table

| Function / Argument | Test Type / Purpose | Example Syntax |
| :--- | :--- | :--- |
| `t.test(x, mu = value)` | One-sample t-test against a known population mean | `t.test(df$score, mu = 70)` |
| `t.test(y ~ x, data)` | Independent two-sample t-test across a binary grouping factor | `t.test(revenue ~ group, data = df)` |
| `t.test(..., paired = TRUE)` | Paired t-test comparing dependent metrics (e.g., pre vs. post) | `t.test(df$pre, df$post, paired = TRUE)` |
| `...$p.value` | Extracts the exact $p$-value directly from a test result object | `test_results$p.value` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Conducting a one-sample test to verify if a baseline operational benchmark is being maintained.
2. Executing an independent two-sample t-test to check if alternative marketing channel strategies yield different financial returns.
3. Evaluating a paired t-test to measure user performance shifts following a software update.