# ==============================================================================
# Day 14: Visualizing Distributions
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(42)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Simulating a dataset of employee performance metrics across departments
company_data <- tibble(
  employee_id = 1:300,
  department = sample(c("Engineering", "Sales", "Marketing"), 300, replace = TRUE),
  # Engineering generally has slightly higher scores in this mock distribution
  performance_score = rnorm(300, mean = 75, sd = 10)
) %>%
  mutate(
    # Tweak scores based on department to create distinct distributions
    performance_score = case_when(
      department == "Engineering" ~ performance_score + 5,
      department == "Sales"       ~ performance_score - 3,
      TRUE                        ~ performance_score
    )
  )

print("--- Mock Performance Distribution Data ---")
print(company_data)

# ------------------------------------------------------------------------------
# 2. Histogram (Single Continuous Variable)
# ------------------------------------------------------------------------------
# Task: Visualize the overall distribution of performance scores.
histogram_plot <- ggplot(data = company_data, aes(x = performance_score)) +
  geom_histogram(bins = 20, fill = "steelblue", color = "white") +
  labs(
    title = "Distribution of Employee Performance Scores",
    subtitle = "Overall spread and frequency across the organization",
    x = "Performance Score",
    y = "Count of Employees"
  )

print("--- Displaying Histogram ---")
print(histogram_plot)

# ------------------------------------------------------------------------------
# 3. Density Plot (Comparing Groups)
# ------------------------------------------------------------------------------
# Task: Create an overlapping density plot to see distribution variations by department.
density_plot <- ggplot(data = company_data, aes(x = performance_score, fill = department)) +
  geom_density(alpha = 0.4) +
  labs(
    title = "Performance Density by Department",
    subtitle = "Overlapping probability distributions showing departmental variance",
    x = "Performance Score",
    y = "Density",
    fill = "Department"
  )

print("--- Displaying Density Plot ---")
print(density_plot)

# ------------------------------------------------------------------------------
# 4. Box Plot (Identifying Outliers and Spread)
# ------------------------------------------------------------------------------
# Task: Create a box plot to display quartiles and highlight statistical outliers.
box_plot <- ggplot(data = company_data, aes(x = department, y = performance_score, fill = department)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, outlier.size = 2) +
  labs(
    title = "Performance Summary by Department",
    subtitle = "Box-and-whisker representation highlighting medians and outliers",
    x = "Department",
    y = "Performance Score"
  ) +
  theme(legend.position = "none") # Hide redundant legend for clear presentation

print("--- Displaying Box Plot ---")
print(box_plot)

# ==============================================================================
# End of Day 14 Script
# ==============================================================================