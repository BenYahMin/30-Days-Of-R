# ==============================================================================
# Day 24: Logistic Regression
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducible data generation
set.seed(707)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Context: Predicting subscription churn (1 = Churned, 0 = Retained) 
# based on customer support calls and monthly platform usage hours.
n_subscribers <- 100
subscription_data <- tibble(
  subscriber_id = 1:n_subscribers,
  usage_hours = runif(n_subscribers, min = 5, max = 50),
  support_calls = rpois(n_subscribers, lambda = 2)
) %>%
  mutate(
    # Log-odds calculation: Higher usage decreases churn probability; more support calls increase it
    log_odds = 0.5 - (0.12 * usage_hours) + (0.75 * support_calls),
    probability = 1 / (1 + exp(-log_odds)),
    # Assign binomial outcomes based on probability thresholds
    has_churned = if_else(runif(n_subscribers) < probability, 1, 0)
  ) %>%
  select(-log_odds, -probability)

print("--- Step 1: Subscriber Churn Dataset Profile ---")
print(head(subscription_data))

# ------------------------------------------------------------------------------
# 2. Fit Logistic Regression Model (GLM)
# ------------------------------------------------------------------------------
# Formula structure: Binary Out ~ Predictors | Critical: family = binomial
logistic_model <- glm(has_churned ~ usage_hours + support_calls, 
                      family = binomial, 
                      data = subscription_data)

print("--- Step 2: Logistic Regression GLM Model Summary ---")
print(summary(logistic_model))

# ------------------------------------------------------------------------------
# 3. Transform Coefficients (Odds Ratios & Probabilities)
# ------------------------------------------------------------------------------
# Task: Convert raw model log-odds into explicit odds ratios for clean interpretation.
log_odds_coefs <- coef(logistic_model)
odds_ratios <- exp(log_odds_coefs)

print("--- Step 3: Extracted Odds Ratios ---")
print(odds_ratios)
# Note: An odds ratio > 1 implies increased likelihood of churn per unit increment.

# ------------------------------------------------------------------------------
# 4. Generate Predictions & Classification Thresholds
# ------------------------------------------------------------------------------
# Task: Append computed probability vectors back to the dataset and apply a 0.50 cutoff filter.
evaluation_data <- subscription_data %>%
  mutate(
    # type = "response" guarantees output scales between 0 and 1
    predicted_prob = predict(logistic_model, type = "response"),
    # Assign prediction flag
    predicted_class = if_else(predicted_prob >= 0.50, 1, 0)
  )

# Build a quick cross-tabulation confusion matrix to audit results
confusion_matrix <- table(Actual = evaluation_data$has_churned, Predicted = evaluation_data$predicted_class)

print("--- Step 4: Model Confusion Matrix Matrix ---")
print(confusion_matrix)

# Calculate baseline prediction accuracy percentage
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat(sprintf("Overall Predictive Accuracy: %.2f%%\n", accuracy * 100))

# ==============================================================================
# End of Day 24 Script
# ==============================================================================