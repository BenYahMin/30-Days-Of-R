# ==============================================================================
# Day 22: Simple Regression
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducible data generation
set.seed(505)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Context: Analyzing how the number of customer training hours impacts user platform adoption scores.
# Task: Determine if a linear relationship exists between training investment and software adoption.
n_clients <- 60
software_adoption_data <- tibble(
  client_id = 1:n_clients,
  training_hours = runif(n_clients, min = 2, max = 20),
  # Generating adoption score with a baseline intercept of 40 and slope of 2.5 + random noise
  adoption_score = 40 + (2.5 * training_hours) + rnorm(n_clients, mean = 0, sd = 6)
)

print("--- Step 1: Head of Adoption Dataset ---")
print(head(software_adoption_data))

# ------------------------------------------------------------------------------
# 2. Fit Simple Linear Regression Model
# ------------------------------------------------------------------------------
# Formula structure: Outcome Variable (Y) ~ Predictor Variable (X)
regression_model <- lm(adoption_score ~ training_hours, data = software_adoption_data)

print("--- Step 2: Regression Summary Model Output ---")
print(summary(regression_model))

# ------------------------------------------------------------------------------
# 3. Extract Core Statistics Safely
# ------------------------------------------------------------------------------
# Task: Pull out specific model metrics to demonstrate how to access regression values programmatically.
model_summary <- summary(regression_model)
slope_coefficient <- model_summary$coefficients["training_hours", "Estimate"]
r_squared <- model_summary$r.squared

cat(sprintf("Extracted Metrics:\n Estimated Slope: %.3f\n Multiple R-squared: %.4f\n\n", 
            slope_coefficient, r_squared))

# ------------------------------------------------------------------------------
# 4. Fitted Trend Line Visualization
# ------------------------------------------------------------------------------
# Task: Build a clean scatter plot and overlay the OLS linear model path.
regression_viz <- ggplot(software_adoption_data, aes(x = training_hours, y = adoption_score)) +
  geom_point(color = "darkcyan", size = 2.5, alpha = 0.8) +
  # Adding the linear regression line along with standard error bands
  geom_smooth(method = "lm", formula = y ~ x, color = "darkorange", linewidth = 1.2) +
  theme_minimal() +
  labs(
    title = "Platform Adoption Score vs. Customer Training Hours",
    subtitle = paste0("R-squared: ", round(r_squared * 100, 1), "% | Slope: ", round(slope_coefficient, 2)),
    x = "Onboarding Training Hours",
    y = "Platform Adoption Score (0-100)"
  )

print("--- Step 4: Rendering Regression Diagnostic Plot ---")
print(regression_viz)

# ==============================================================================
# End of Day 22 Script
# ==============================================================================