# Day 22: Simple Linear Regression in R

Welcome to Day 22 of the 30 Days of R challenge! Today, we transition from group comparisons (t-tests and ANOVA) to modeling relationships between continuous variables using **Simple Linear Regression**. Linear regression allows us to quantify how changes in a predictor variable ($X$) associate with variations in a dependent outcome variable ($Y$).

## Core Concepts Covered
* **The Linear Model Formula**: Understanding the equation $Y = \beta_0 + \beta_1X + \epsilon$, where $\beta_0$ is the intercept and $\beta_1$ is the slope coefficient.
* **Fitting Models (`lm`)**: Using R's built-in linear model function to estimate line parameters via Ordinary Least Squares (OLS).
* **Interpreting Coefficients**: Evaluating the slope estimate, $p$-values for statistical significance, and the Multiple R-squared ($R^2$) value to assess the variance explained by the model.
* **Fitted Line Plots**: Overlaying a trend line directly over a scatter plot using `geom_smooth(method = "lm")`.

---

## Functions Reference Table

| Function | Purpose | Example Syntax |
| :--- | :--- | :--- |
| `lm(formula, data)` | Fits a linear regression model ($Y \sim X$) | `lm(revenue ~ marketing_spend, data = df)` |
| `summary(lm_object)` | Extracts detailed regression summaries (coefficients, R-squared, F-statistic) | `summary(my_model)` |
| `geom_smooth(method = "lm")` | Adds a linear regression trend line to a `ggplot2` graphic | `base_plot + geom_smooth(method = "lm")` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Formulating and fitting a simple linear regression model tracking two numerical features.
2. Interrogating the regression summary to interpret the intercept, slope, and precision metrics.
3. Generating a scatter plot paired with a linear line of best fit to visually assess model residuals.