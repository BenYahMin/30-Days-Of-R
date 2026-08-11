# ==============================================================================
# Day 24: Logistic Regression & Binary Classification Pipeline
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

library(tidyverse)
library(broom)

# Let us use built-in dataset: mtcars
# Predicting vehicle transmission type (0 = Automatic, 1 = Manual)
# based on vehicle weight (wt) and horsepower (hp).
data("mtcars")

cars_df <- as_tibble(mtcars, rownames = "car_model") %>%
  select(car_model, am, wt, hp, mpg) %>%
  mutate(
    transmission = factor(am, levels = c(0, 1), labels = c("Automatic", "Manual"))
  )

cat("Raw Vehicle Ledger Profile")
print(head(cars_df))

# Fit a logistic model.
# Target: am (Binary 0/1) | Predictors: wt (Vehicle Weight), hp (Horsepower)
logistic_model <- glm(am ~ wt + hp, family = binomial(link = "logit"), data = cars_df)

cat("Model Coefficients (Log-Odds Scale)")
print(summary(logistic_model))

# Exponentiate log-odds to obtain interpretable Odds Ratios (OR) with 95% CIs
model_odds <- tidy(logistic_model, exponentiate = TRUE, conf.int = TRUE)

cat("Tidy Odds Ratios & 95% Confidence Intervals")
print(model_odds %>% select(term, estimate, std.error, conf.low, conf.high, p.value))

# Append fitted probabilities and classify using a standard 0.50 threshold
eval_df <- cars_df %>%
  mutate(
    predicted_prob  = predict(logistic_model, type = "response"),
    predicted_class = if_else(predicted_prob >= 0.50, 1, 0),
    predicted_label = factor(predicted_class, levels = c(0, 1), labels = c("Automatic", "Manual"))
  )

# Build Confusion Matrix
confusion_matrix <- table(Actual = eval_df$transmission, Predicted = eval_df$predicted_label)

cat("Confusion Matrix")
print(confusion_matrix)

# Calculate key performance metrics
accuracy    <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
sensitivity <- confusion_matrix["Manual", "Manual"] / sum(confusion_matrix["Manual", ])
specificity <- confusion_matrix["Automatic", "Automatic"] / sum(confusion_matrix["Automatic", ])

cat(sprintf("\nModel Performance Metrics:\n"))
cat(sprintf("  • Accuracy:    %.2f%%\n", accuracy * 100))
cat(sprintf("  • Sensitivity: %.2f%%\n", sensitivity * 100))
cat(sprintf("  • Specificity: %.2f%%\n", specificity * 100))

# 5. Visualize the Sigmoid Decision Curve
sigmoid_plot <- ggplot(eval_df, aes(x = wt, y = am)) +
  geom_point(aes(color = transmission), size = 3, alpha = 0.8) +
  stat_smooth(
    method      = "glm", 
    method.args = list(family = "binomial"), 
    se          = TRUE, 
    color       = "#2563eb", 
    fill        = "#bfdbfe"
  ) +
  scale_y_continuous(breaks = c(0, 1), labels = c("0 (Automatic)", "1 (Manual)")) +
  scale_color_manual(values = c("Automatic" = "#dc2626", "Manual" = "#16a34a")) +
  theme_minimal() +
  labs(
    title    = "Logistic Regression Sigmoid Curve",
    subtitle = "Probability of Manual Transmission as a function of Vehicle Weight",
    x        = "Vehicle Weight (1,000 lbs)",
    y        = "Predicted Probability of Manual Transmission",
    color    = "Actual Class"
  ) +
  theme(legend.position = "bottom")

print("Render Sigmoid Curve Plot")
print(sigmoid_plot)
