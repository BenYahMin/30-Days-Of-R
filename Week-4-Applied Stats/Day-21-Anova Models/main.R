# ==============================================================================
# Day 21: ANOVA Models
# 30-Days-Of-R
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducible data generation
set.seed(404)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Context: Evaluating website loading speeds across three distinct hosting providers.
# Task: Determine if the choice of hosting provider significantly affects load times.
n_per_group <- 35
hosting_experiment <- tibble(
  provider = rep(c("Provider_A", "Provider_B", "Provider_C"), each = n_per_group),
  # Simulating variance: Provider B is faster on average
  load_time = c(
    rnorm(n_per_group, mean = 2.4, sd = 0.4),  # Provider A
    rnorm(n_per_group, mean = 1.9, sd = 0.3),  # Provider B
    rnorm(n_per_group, mean = 2.5, sd = 0.5)   # Provider C
  )
) %>%
  mutate(provider = as.factor(provider)) # Ensure the grouping variable is a factor

print("--- Step 1: Experimental Data Summary ---")
hosting_experiment %>%
  group_by(provider) %>%
  summarise(
    sample_size = n(),
    mean_speed = mean(load_time),
    sd_speed = sd(load_time),
    .groups = "drop"
  ) %>%
  print()

# ------------------------------------------------------------------------------
# 2. Fit One-Way ANOVA Model
# ------------------------------------------------------------------------------
# H0: Mean_A = Mean_B = Mean_C | H1: At least one group mean is different
anova_model <- aov(load_time ~ provider, data = hosting_experiment)

print("--- Step 2: ANOVA Table Summary ---")
print(summary(anova_model))

# ------------------------------------------------------------------------------
# 3. Post-Hoc Pairwise Comparisons (Tukey's HSD)
# ------------------------------------------------------------------------------
# Task: If the overall ANOVA is significant, run Tukey's test to pinpoint differences.
print("--- Step 3: Tukey Honest Significant Difference Test ---")
tukey_results <- TukeyHSD(anova_model)
print(tukey_results)

# ------------------------------------------------------------------------------
# 4. Exploratory Distribution Audit
# ------------------------------------------------------------------------------
# Task: Create a box plot with overlaying group means to visually back up the numbers.
anova_viz <- ggplot(hosting_experiment, aes(x = provider, y = load_time, fill = provider)) +
  geom_boxplot(alpha = 0.7, show.legend = FALSE) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "black") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Website Loading Speeds by Hosting Provider",
    subtitle = "Black diamonds represent the group means evaluated via ANOVA",
    x = "Hosting Provider",
    y = "Page Load Time (Seconds)"
  )

print("--- Step 4: Rendering Experimental Box Plot ---")
print(anova_viz)

# ==============================================================================
# End of Day 21 Script
# ==============================================================================