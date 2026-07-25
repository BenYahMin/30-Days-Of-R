# ==============================================================================
# Day 17: Interactive Charts
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)
# install.packages("plotly") # uncomment this and run if not installed
library(plotly)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Simulating a SaaS application performance dataset: features, engagement, and retention
app_metrics <- tibble(
  feature_name = c("Dashboard", "Export PDF", "AI Insights", "Integrations", "User Admin", "Billing Portal"),
  monthly_active_users = c(12000, 4500, 1800, 3200, 6000, 1500),
  satisfaction_rate = c(88.5, 74.2, 91.0, 83.4, 79.1, 68.8),
  development_cost = c(25000, 8000, 45000, 30000, 12000, 5000)
)

print("--- Mock App Metrics Dataset ---")
print(app_metrics)

# ------------------------------------------------------------------------------
# 2. Building a Custom Tooltip Scatter Plot
# ------------------------------------------------------------------------------
# Task: Create a static ggplot scatter plot with a custom 'text' aesthetic.
# The 'text' aesthetic constructs the precise breakdown shown during cursor hover.
static_scatter <- ggplot(
  data = app_metrics, 
  aes(
    x = monthly_active_users, 
    y = satisfaction_rate,
    # Define custom tooltip string using standard string concatenation
    text = paste0(
      "<b>Feature:</b> ", feature_name, "<br>",
      "<b>Active Users:</b> ", scales::comma(monthly_active_users), "<br>",
      "<b>CSAT Score:</b> ", satisfaction_rate, "%<br>",
      "<b>Dev Investment:</b> $", scales::comma(development_cost)
    )
  )
) +
  geom_point(aes(size = development_cost, color = feature_name), alpha = 0.8) +
  scale_size_continuous(range = c(3, 10)) +
  theme_minimal() +
  labs(
    title = "Feature Engagement vs. Satisfaction Index",
    x = "Monthly Active Users",
    y = "Satisfaction Rate (%)"
  ) +
  theme(legend.position = "none") # Hide static legends; interactive panels handle identification
# you can run static_scatter to view it before proceeding
# print(static_scatter)  # uncomment this line

# ------------------------------------------------------------------------------
# 3. Converting to Interactive Layout via ggplotly
# ------------------------------------------------------------------------------
# Task: Wrap the static object and restrict tooltip output exclusively to our custom string.
interactive_scatter <- ggplotly(static_scatter, tooltip = "text")

# Note: In an RStudio environment or R Markdown document, running the line below 
# will render an interactive HTML chart directly in your Viewer tab!
print("--- Launching Interactive Scatter Plot ---")
# interactive_scatter

# ------------------------------------------------------------------------------
# 4. Interactive Line Trend Chart
# ------------------------------------------------------------------------------
# Task: Build a quick timeline comparison tracking traffic growth.
timeline_data <- tibble(
  month = rep(factor(month.abb[1:6], levels = month.abb[1:6]), each = 2),
  tier = rep(c("Free", "Premium"), times = 6),
  signups = c(500, 120, 620, 140, 800, 190, 1100, 250, 1450, 310, 1900, 420)
)

static_line <- ggplot(timeline_data, aes(x = month, y = signups, group = tier, color = tier)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  theme_classic() +
  labs(title = "Monthly Account Signups Trend Matrix", x = "2026 Timeline", y = "Signups Count")

interactive_line <- ggplotly(static_line)

print("--- Launching Interactive Line Plot ---")
interactive_line

# ==============================================================================
# End of Day 17 Script
# ==============================================================================