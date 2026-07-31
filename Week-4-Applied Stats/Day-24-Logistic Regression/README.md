# Day 24: Logistic Regression in R

Welcome to Day 24 of the 30 Days of R challenge! Today, we conclude our core regression modeling track by moving from continuous outcomes to categorical binary classifications using **Logistic Regression**. When our dependent variable ($Y$) is a binary outcome (e.g., Success/Failure, Churn/Retain, Yes/No), linear regression breaks down. Logistic regression uses the logit link function to model the probability of an event occurring.

## Core Concepts Covered
* **The Logistic Model & Odds Ratios**: Modeling relationships in the form $\log\left(\frac{p}{1-p}\right) = \beta_0 + \beta_1X$, where $p$ is the probability of the target outcome.
* **Generalized Linear Models (`glm`)**: Utilizing R's `glm()` function paired with the `family = binomial` argument to run maximum likelihood estimation.
* **Probability Conversions**: Using `predict(..., type = "response")` to transform raw log-odds coefficients into intuitive 0 to 1 probability percentages.
* **Classification Matrices**: Assigning a decision threshold (e.g., $\ge 0.50$) to evaluate model performance binary assignments.

---

## Functions Reference Table

| Function / Argument | Purpose | Example Syntax |
| :--- | :--- | :--- |
| `glm(formula, family = binomial, data)` | Fits a generalized linear logistic regression model | `glm(churn ~ usage + tenure, family = binomial, data = df)` |
| `predict(model, type = "response")` | Extracts predicted event probabilities instead of raw log-odds | `predict(my_model, type = "response")` |
| `exp(coef(model))` | Converts log-odds coefficients into legible Odds Ratios | `exp(coef(logistic_model))` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Setting up a binary target variable and fitting a Generalized Linear Model (GLM).
2. Converting log-odds estimates into probabilities and odds ratios to evaluate feature impacts.
3. Establishing a predictive classification threshold to assess baseline model metrics.