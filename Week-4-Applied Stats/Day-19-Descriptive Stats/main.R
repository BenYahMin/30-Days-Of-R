# ==============================================================================
# Day 19: Descriptive Stats
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(202)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Simulating a dataset of e-commerce order values and delivery times across regions
n_observations <- 250
shipping_data <- tibble(
  order_id = 1:n_observations,
  region = sample(c("North", "South", "East", "West"), n_observations, replace = TRUE),
  order_value = c(rnorm(n_observations - 10, mean = 85, sd = 25), rep(NA, 10)), # Introducing missing values
  delivery_days = rpois(n_observations, lambda = 4) + 1
)

print("--- Step 1: Dataset Profile ---")
glimpse(shipping_data)

# ------------------------------------------------------------------------------
# 2. Global Descriptive Statistics
# ------------------------------------------------------------------------------
# Task: Calculate baseline central tendency and dispersion metrics for order values.
# Note: Using na.rm = TRUE is essential since missing values exist.
global_mean   <- mean(shipping_data$order_value, na.rm = TRUE)
global_median <- median(shipping_data$order_value, na.rm = TRUE)
global_sd     <- sd(shipping_data$order_value, na.rm = TRUE)
global_iqr    <- IQR(shipping_data$order_value, na.rm = TRUE)

cat(sprintf("Global Metrics:\n Mean: %.2f\n Median: %.2f\n Std Dev: %.2f\n IQR: %.2f\n\n", 
            global_mean, global_median, global_sd, global_iqr))

# ------------------------------------------------------------------------------
# 3. Quantile & Percentile Analysis
# ------------------------------------------------------------------------------
# Task: Identify threshold values for specific cut points (e.g., top 10% and top 5% of orders).
value_quantiles <- quantile(shipping_data$order_value, probs = c(0.25, 0.50, 0.75, 0.90, 0.95), na.rm = TRUE)

print("--- Percentile Breakdowns ---")
print(value_quantiles)

# ------------------------------------------------------------------------------
# 4. Grouped Statistical Profiles
# ------------------------------------------------------------------------------
# Task: Aggregate data across regions to look for distinct structural variances.
regional_summary <- shipping_data %>%
  group_by(region) %>%
  summarise(
    total_orders = n(),
    mean_value   = mean(order_value, na.rm = TRUE),
    median_value = median(order_value, na.rm = TRUE),
    sd_value     = sd(order_value, na.rm = TRUE),
    mean_delivery = mean(delivery_days),
    .groups = "drop"
  )

print("--- Regional Descriptive Summary ---")
print(regional_summary)

