# ==============================================================================
# Day 13: Ggplot Foundations
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Creating a dataset representing store performance metrics across categories
store_data <- tibble(
  store_id = rep(1:3, each = 4),
  quarter = rep(c("Q1", "Q2", "Q3", "Q4"), times = 3),
  marketing_spend = c(1200, 1500, 1100, 1900, 800, 1300, 1400, 1600, 2000, 2200, 1800, 2500),
  revenue = c(15000, 18500, 14200, 23000, 9500, 14000, 15100, 18000, 22000, 26000, 21000, 31000),
  category = rep(c("Electronics", "Apparel", "Home Goods"), each = 4)
)

print("--- Mock Store Performance Data ---")
print(store_data)

# ------------------------------------------------------------------------------
# 2. Scatter Plot (Continuous vs. Continuous)
# ------------------------------------------------------------------------------
# Task: Visualize the relationship between marketing spend and revenue.
scatter_plot <- ggplot(data = store_data, aes(x = marketing_spend, y = revenue)) +
  geom_point(aes(color = category), size = 3) +
  labs(
    title = "Revenue vs. Marketing Spend",
    subtitle = "Analyzing return on marketing investments across categories",
    x = "Marketing Spend ($)",
    y = "Total Revenue ($)",
    color = "Product Category"
  )

print("--- Displaying Scatter Plot ---")
print(scatter_plot)

# ------------------------------------------------------------------------------
# 3. Line Plot (Trends Over Time)
# ------------------------------------------------------------------------------
# Task: Track the revenue trajectory across quarters for each category.
# Grouping by category using the 'group' aesthetic ensures lines connect properly.
line_plot <- ggplot(data = store_data, aes(x = quarter, y = revenue, group = category, color = category)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Quarterly Revenue Trends",
    subtitle = "Performance tracked across fiscal quarters",
    x = "Quarter",
    y = "Revenue ($)"
  )

print("--- Displaying Line Plot ---")
print(line_plot)

# ------------------------------------------------------------------------------
# 4. Bar Chart (Categorical Mappings)
# ------------------------------------------------------------------------------
# Task: Create a summary dataset and build a bar chart showing total revenue per category.
summary_data <- store_data %>%
  group_by(category) %>%
  summarise(total_revenue = sum(revenue))

bar_chart <- ggplot(data = summary_data, aes(x = category, y = total_revenue, fill = category)) +
  geom_col(width = 0.6) +
  labs(
    title = "Total Revenue by Category",
    x = "Category",
    y = "Aggregate Revenue ($)",
    fill = "Category"
  )

print("--- Displaying Bar Chart ---")
print(bar_chart)

# ==============================================================================
# End of Day 13 Script
# ==============================================================================

