# ==============================================================================
# Day 21: ANOVA Models
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

library(tidyverse)

# Load dataset. We are going to use an in-built dataset here.
# Context: Evaluating dried yield weight across control and two treatment conditions.
# Determine if treatment type significantly impacts plant yield weight.
plant_df <- as_tibble(PlantGrowth)

print("Experimental Data Summary")
plant_summary <- plant_df %>%
  group_by(group) %>%
  summarise(
    sample_size = n(),
    mean_weight = mean(weight),
    sd_weight   = sd(weight),
    .groups     = "drop"
  )

print(plant_summary)

# Hypothesis:
# H0: Mean_ctrl = Mean_trt1 = Mean_trt2 | H1: At least one group mean differs
anova_model <- aov(weight ~ group, data = plant_df)

print("ANOVA Table Summary")
print(summary(anova_model))

# Task: Pinpoint which specific treatment groups differ significantly.
print("Tukey Honest Significant Difference Test")
tukey_results <- TukeyHSD(anova_model)
print(tukey_results)

# Task: Visualize yield distributions with group mean overlays (black diamonds).
anova_viz <- ggplot(plant_df, aes(x = group, y = weight, fill = group)) +
  geom_boxplot(alpha = 0.7, show.legend = FALSE) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "black") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title    = "Plant Yield Weight by Experimental Condition",
    subtitle = "Black diamonds represent group means evaluated via one-way ANOVA",
    x        = "Experimental Group",
    y        = "Dried Weight (Units)"
  )

print("Experimental Box Plot")
print(anova_viz)
