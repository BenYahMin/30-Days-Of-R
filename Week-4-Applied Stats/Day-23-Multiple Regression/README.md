# Day 23: Multiple Linear Regression in R

Welcome to Day 23 of the 30 Days of R challenge! Today, we expand on yesterday's simple linear regression model by exploring **Multiple Linear Regression**. Instead of predicting an outcome ($Y$) using just a single predictor, multiple regression allows us to evaluate the simultaneous effects of multiple continuous and categorical predictor variables ($X_1, X_2, \dots, X_k$).

## Core Concepts Covered
* **The Multiple Linear Regression Model**: Modeling equations in the form $Y = \beta_0 + \beta_1X_1 + \beta_2X_2 + \dots + \beta_kX_k + \epsilon$.
* **Additive Effects & Confounding**: Understanding how adding predictors helps control for confounding variables and isolates true relationships.
* **Adjusted R-squared**: Learning why we use Adjusted $R^2$ instead of Multiple $R^2$ when dealing with multiple predictors to penalize the unnecessary addition of noise variables.
* **Categorical Predictors**: Incorporating factors into regression models and interpreting baseline reference groups.

---

## Functions Reference Table

| Function / Syntax | Purpose | Example Syntax |
| :--- | :--- | :--- |
| `lm(Y ~ X1 + X2 + X3, data)` | Fits a multiple linear regression model with additive terms | `lm(sales ~ spend + price + region, data = df)` |
| `...$adj.r.squared` | Programmatically extracts the adjusted coefficient of determination | `summary(model)$adj.r.squared` |
| `coef(model)` | Extracts just the model coefficients matrix from a fitted object | `coef(my_model)` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Constructing a multi-variable regression model using both continuous metrics and categorical grouping factors.
2. Evaluating the model output to interpret individual slopes while keeping other variables constant.
3. Comparing Multiple vs. Adjusted R-squared to evaluate model efficiency.