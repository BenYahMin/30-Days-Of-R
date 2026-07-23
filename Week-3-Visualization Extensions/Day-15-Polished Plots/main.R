# ==============================================================================
# Day 15: Polished Plots
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)
# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Simulating a clean summary dataset of customer satisfaction scores across regions
regional_satisfaction <- tibble(
  region = c("North America", "Western Europe", "Asia-Pacific", "Latin America", "Middle East & Africa"),
  avg_score = c(8.4, 8.7, 7.9, 8.1, 7.4),
  sample_size = c(1200, 950, 1500, 600, 450)
)

print("--- Regional Satisfaction Data ---")
print(regional_satisfaction)

# ------------------------------------------------------------------------------
# 2. Creating a Polished Bar Chart
# ------------------------------------------------------------------------------
# Task: Create a highly customized, clean bar chart.
# We sort the bars using reorder() to guide the reader's eye naturally.
polished_bar_chart <- ggplot(
  data = regional_satisfaction, 
  aes(x = reorder(region, avg_score), y = avg_score, fill = region)
) +
  geom_col(width = 0.65, show.legend = FALSE) +
  # Use coord_flip to make the regional text labels beautifully readable
  coord_flip() +
  # Apply a crisp base theme
  theme_minimal(base_size = 13) +
  # Switch to a professional, cohesive ColorBrewer palette
  scale_fill_brewer(palette = "Dark2") +
  # Add metadata details
  labs(
    title = "Customer Satisfaction Index by Region",
    subtitle = "Q2 global performance metrics based on post-purchase surveys",
    x = NULL, # Removed since region names are self-explanatory
    y = "Average Score (Scale 1-10)",
    caption = "Source: Internal Analytics Team"
  ) +
  # Granular theme formatting
  theme(
    plot.title = element_text(face = "bold", size = 16, color = "#222222"),
    plot.subtitle = element_text(size = 11, color = "#666666", margin = margin(b = 15)),
    plot.caption = element_text(face = "italic", color = "#999999", size = 9),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_blank() # Remove horizontal lines since bars are horizontal
  )

print("--- Rendering Polished Bar Chart ---")
print(polished_bar_chart)

# ------------------------------------------------------------------------------
# 3. Creating a Polished Scatter Plot with Legend Adjustments
# ------------------------------------------------------------------------------
# Task: Create a stylized scatter plot and position the legend at the bottom.
polished_scatter_plot <- ggplot(
  data = regional_satisfaction, 
  aes(x = sample_size, y = avg_score, color = region)
) +
  geom_point(size = 5, alpha = 0.85) +
  theme_classic() +
  labs(
    title = "Satisfaction vs. Evaluation Volume",
    x = "Number of Surveys Collected",
    y = "Average CSAT Score",
    color = "Region Headquarter"
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    # Shift legend to the bottom to allocate maximum horizontal canvas space for data
    legend.position = "bottom",
    legend.background = element_rect(fill = "#f7f7f7", color = "#cccccc")
  )

print("--- Rendering Polished Scatter Plot ---")
print(polished_scatter_plot)

# ==============================================================================
# End of Day 15 Script
# ==============================================================================

