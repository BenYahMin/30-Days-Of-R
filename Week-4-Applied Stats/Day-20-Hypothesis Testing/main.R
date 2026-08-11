# ==============================================================================
# Day 20: Hypothesis Testing
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducible data generation
set.seed(303)

# ------------------------------------------------------------------------------
# 1. One-Sample t-test
# ------------------------------------------------------------------------------
# Context: An operations team claims the average support ticket response time is 15 minutes.
# Task: Test if our actual team performance significantly differs from this claim.
ticket_times <- rnorm(45, mean = 13.8, sd = 3.5)

print("--- Step 1: Running One-Sample t-test ---")
# H0: mu = 15 | H1: mu != 15
one_sample_result <- t.test(ticket_times, mu = 15)
print(one_sample_result)

# Quick evaluation extract
if (one_sample_result$p.value < 0.05) {
  cat("Result: Reject H0. The mean response time significantly differs from 15 minutes.\n\n")
} else {
  cat("Result: Fail to reject H0. No significant difference from 15 minutes detected.\n\n")
}

# ------------------------------------------------------------------------------
# 2. Independent Two-Sample t-test
# ------------------------------------------------------------------------------
# Context: Comparing purchase amounts between users exposed to Layout A vs. Layout B.
# Task: Determine if conversion layout changes impacted checkout spending behavior.
ab_test_data <- tibble(
  layout = rep(c("Layout_A", "Layout_B"), each = 50),
  spend  = c(rnorm(50, mean = 42, sd = 10), rnorm(50, mean = 47, sd = 12))
)

print("--- Step 2: Running Independent Two-Sample t-test ---")
# H0: Mean Spend A = Mean Spend B
two_sample_result <- t.test(spend ~ layout, data = ab_test_data)
print(two_sample_result)

# ------------------------------------------------------------------------------
# 3. Paired t-test
# ------------------------------------------------------------------------------
# Context: Tracking the conversion score of 30 specific leads before and after an email sequence.
# Task: Test if the campaign caused a statistically significant increase in lead quality.
campaign_evaluation <- tibble(
  lead_id   = 1:30,
  score_pre  = round(runif(30, 45, 75)),
  score_post = score_pre + round(rnorm(30, mean = 6, sd = 4)) # Simulating growth
)

print("--- Step 3: Running Paired t-test ---")
# H0: Mean difference between pre and post scores is 0
paired_result <- t.test(campaign_evaluation$score_post, campaign_evaluation$score_pre, paired = TRUE)
print(paired_result)

# ------------------------------------------------------------------------------
# 4. Visual Verification (Exploratory Verification)
# ------------------------------------------------------------------------------
# Task: Plot the distribution for the Two-Sample experiment to visually audit the results.
hypothesis_viz <- ggplot(ab_test_data, aes(x = spend, fill = layout)) +
  geom_density(alpha = 0.4) +
  geom_vline(xintercept = mean(ab_test_data$spend[ab_test_data$layout == "Layout_A"]), color = "red", linetype = "dashed") +
  geom_vline(xintercept = mean(ab_test_data$spend[ab_test_data$layout == "Layout_B"]), color = "blue", linetype = "dashed") +
  theme_minimal() +
  labs(
    title = "A/B Test Spending Distributions",
    subtitle = "Dashed lines represent the sample group means tested in Step 2",
    x = "Checkout Spend ($)",
    y = "Density",
    fill = "Experiment Variant"
  )

print("--- Step 4: Generating Validation Plot ---")
print(hypothesis_viz)
