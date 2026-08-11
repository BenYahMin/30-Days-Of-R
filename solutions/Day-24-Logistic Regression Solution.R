# ==============================================================================
# WEEK 3 CAPSTONE SOLUTION: STATISTICAL INFERENCE & PREDICTIVE MODELING IN R
# Author: Benjamin Kithome
# ==============================================================================

library(tidyverse)
library(broom)

  # 1. DESCRIPTIVE STATS

# 1. Overall central tendency and dispersion for mpg
mpg_summary <- mtcars %>%
  summarise(
    mean_mpg   = mean(mpg),
    median_mpg = median(mpg),
    sd_mpg     = sd(mpg),
    iqr_mpg    = IQR(mpg)
  )

# 2. Group-wise summary stats of mpg by transmission type (am)
mpg_by_am <- mtcars %>%
  mutate(transmission = if_else(am == 0, "Automatic", "Manual")) %>%
  group_by(transmission) %>%
  summarise(
    count      = n(),
    mean_mpg   = mean(mpg),
    median_mpg = median(mpg),
    sd_mpg     = sd(mpg),
    iqr_mpg    = IQR(mpg),
    .groups    = "drop"
  )

# 3. Outlier identification for vehicle weight (wt) using 1.5 * IQR rule
wt_q1  <- quantile(mtcars$wt, 0.25)
wt_q3  <- quantile(mtcars$wt, 0.75)
wt_iqr <- IQR(mtcars$wt)

lower_bound <- wt_q1 - 1.5 * wt_iqr
upper_bound <- wt_q3 + 1.5 * wt_iqr

wt_outliers <- mtcars %>%
  as_tibble(rownames = "car_model") %>%
  filter(wt < lower_bound | wt > upper_bound) %>%
  select(car_model, wt)

# Print Summaries
cat("Overall MPG Summary")
print(mpg_summary)

cat("Group-wise MPG Summary by Transmission")
print(mpg_by_am)

cat("Vehicle Weight (wt) Outliers")
print(wt_outliers)

# 2. HYPOTHESIS TESTING

# 1. Check for equality of variance between groups (F-test)
var_test_res <- var.test(mpg ~ am, data = mtcars)

# 2. Conduct independent two-sample t-test (equal variance assumed based on var.test p > 0.05)
t_test_res <- t.test(mpg ~ am, data = mtcars, var.equal = TRUE)

cat("Variance Test Summary")
print(var_test_res)

cat("Two-Sample T-Test Summary")
print(t_test_res)

# 3. ANOVA

data("PlantGrowth")

# 1. Fit one-way ANOVA model
anova_model <- aov(weight ~ group, data = PlantGrowth)
anova_summary <- summary(anova_model)

# 2. Post-hoc pairwise comparisons (Tukey's HSD)
tukey_res <- TukeyHSD(anova_model)

cat("ANOVA")
print(anova_summary)

cat("Tukey's HSD Post-Hoc Test")
print(tukey_res)

# 4. SIMPLE LINEAR REGRESSION

# Fit simple linear model: mpg ~ wt
simple_lm <- lm(mpg ~ wt, data = mtcars)
simple_summary <- summary(simple_lm)

cat("Simple Linear Regression Summary")
print(simple_summary)

# 5. MULTIPLE LINEAR REGRESSION

# Fit multiple linear model: mpg ~ wt + hp + qsec
multiple_lm <- lm(mpg ~ wt + hp + qsec, data = mtcars)
multiple_summary <- summary(multiple_lm)

cat("Multiple Linear Regression Summary")
print(multiple_summary)

# Diagnostic plots generation (Console view)
par(mfrow = c(1, 2))
plot(multiple_lm, which = c(1, 2)) # Residuals vs Fitted & Normal Q-Q
par(mfrow = c(1, 1))

# 6. LOGISTIC REGRESSION

# 1. Fit binary logistic regression model: am ~ wt + hp
logistic_model <- glm(am ~ wt + hp, family = binomial, data = mtcars)

# 2. Extract Odds Ratios and 95% Confidence Intervals
odds_ratios <- tidy(logistic_model, exponentiate = TRUE, conf.int = TRUE)

# 3. Predict probabilities and classify at 0.50 cutoff
mtcars_eval <- mtcars %>%
  mutate(
    pred_prob  = predict(logistic_model, type = "response"),
    pred_class = if_else(pred_prob >= 0.50, 1, 0)
  )

# 4. Confusion Matrix and Accuracy
confusion_matrix <- table(Actual = mtcars_eval$am, Predicted = mtcars_eval$pred_class)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

cat("Logistic Regression Odds Ratios")
print(odds_ratios)

cat("Confusion Matrix")
print(confusion_matrix)
cat(sprintf("Overall Model Accuracy: %.2f%%\n", accuracy * 100))