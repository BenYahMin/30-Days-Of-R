# ==============================================================================
# Day 23: Multiple Regression
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducible data generation
set.seed(606)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Context: Predicting employee salary based on experience, performance metrics, and department.
# Task: Assess the impact of multiple factors on professional compensation.
n_employees <- 80
compensation_data <- tibble(
  employee_id = 1:n_employees,
  years_experience = runif(n_employees, min = 1, max = 15),
  performance_rating = sample(1:5, n_employees, replace = TRUE),
  department = sample(c("Engineering", "Sales", "HR"), n_employees, replace = TRUE)
) %>%
  mutate(
    # Base salary of $50k + $4k/yr experience + $3k/performance tier + $12k bonus for Engineering + noise
    salary = 50000 + (4200 * years_experience) + (2800 * performance_rating) + 
      if_else(department == "Engineering", 12000, 0) + rnorm(n_employees, mean = 0, sd = 4000)
  )

print("--- Step 1: Employee Compensation Sample ---")
print(head(compensation_data))

# ------------------------------------------------------------------------------
# 2. Fit Multiple Linear Regression Model
# ------------------------------------------------------------------------------
# Formula structure: Y ~ X1 + X2 + X3
multiple_model <- lm(salary ~ years_experience + performance_rating + department, data = compensation_data)

print("--- Step 2: Multiple Regression Model Summary ---")
print(summary(multiple_model))

# ------------------------------------------------------------------------------
# 3. Model Fit Evaluation
# ------------------------------------------------------------------------------
# Task: Extract fit indices to evaluate model performance while protecting against overfitting.
model_summary <- summary(multiple_model)
mult_r2 <- model_summary$r.squared
adj_r2  <- model_summary$adj.r.squared

cat(sprintf("Model Performance Matrix:\n Multiple R-squared: %.4f\n Adjusted R-squared: %.4f\n\n", 
            mult_r2, adj_r2))

# ------------------------------------------------------------------------------
# 4. Visualizing Added Variables / Relationships
# ------------------------------------------------------------------------------
# Task: Plot the salary relationship against experience, color-coded by department 
# to visualize the distinct intercept offsets calculated by the model.
regression_viz <- ggplot(compensation_data, aes(x = years_experience, y = salary, color = department)) +
  geom_point(size = 2.5, alpha = 0.8) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, linewidth = 1.2) +
  theme_minimal() +
  scale_color_brewer(palette = "Set1") +
  labs(
    title = "Salary Model: Experience & Department Trends",
    subtitle = "Parallel slopes reflect the additive categorical offsets from the regression",
    x = "Years of Experience",
    y = "Annual Salary ($)",
    color = "Department"
  )

print("--- Step 4: Rendering Multi-Variable Regression Plot ---")
print(regression_viz)

# ==============================================================================
# End of Day 23 Script
# ==============================================================================