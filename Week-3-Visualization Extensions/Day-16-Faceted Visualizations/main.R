# ==============================================================================
# Day 16: Faceted Visualizations
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Simulating regional sales trends across multiple product lines over four quarters
sales_data <- tibble(
  quarter = rep(c("Q1", "Q2", "Q3", "Q4"), times = 8),
  region = rep(c("North", "South"), each = 4, times = 4),
  product = rep(c("Software", "Hardware", "Consulting", "Support"), each = 8),
  # Giving different ranges to showcase the benefit of free scales later
  revenue = c(
    runif(8, 50000, 80000),   # Software (High revenue)
    runif(8, 30000, 60000),   # Hardware (Medium revenue)
    runif(8, 10000, 25000),   # Consulting (Lower revenue)
    runif(8, 5000, 12000)     # Support (Lowest revenue)
  )
)

print("--- Mock Regional Product Sales Dataset ---")
print(sales_data)

# ------------------------------------------------------------------------------
# 2. Facet Wrap (1D Ribbon Mapping)
# ------------------------------------------------------------------------------
# Task: Separate product performance trajectories into clean, independent panels.
wrapped_facets <- ggplot(sales_data, aes(x = quarter, y = revenue, group = region, color = region)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  # Split charts by product into a 2x2 layout matrix
  facet_wrap(~ product, ncol = 2) +
  theme_minimal() +
  labs(
    title = "Quarterly Revenue Trends by Product Line",
    subtitle = "Faceted wrap visualization using fixed axis scales",
    x = "Quarter",
    y = "Revenue ($)",
    color = "Region"
  ) +
  theme(legend.position = "bottom")

print("--- Rendering Facet Wrap ---")
print(wrapped_facets)

# ------------------------------------------------------------------------------
# 3. Facet Wrap with Free Scales
# ------------------------------------------------------------------------------
# Task: Release the Y-axis boundary constraint so variations in smaller segments 
# (like Support/Consulting) aren't compressed by massive categories (like Software).
free_scale_facets <- ggplot(sales_data, aes(x = quarter, y = revenue, group = region, color = region)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  # Freeing the Y-axis lets each subplot capture micro-trends cleanly
  facet_wrap(~ product, scales = "free_y") +
  theme_minimal() +
  labs(
    title = "Product Revenue Profiles (Free Y-Axis)",
    subtitle = "Allowing independent scales to reveal granular sub-segment patterns",
    x = "Quarter",
    y = "Revenue ($)"
  ) +
  theme(legend.position = "bottom")

print("--- Rendering Facet Wrap with Free Scales ---")
print(free_scale_facets)

# ------------------------------------------------------------------------------
# 4. Facet Grid (2D Cross-Tabulated Matrix)
# ------------------------------------------------------------------------------
# Task: Construct an intersection grid mapping regions cleanly against products.
grid_facets <- ggplot(sales_data, aes(x = quarter, y = revenue, fill = region)) +
  geom_col(show.legend = FALSE) +
  # Layout format: Rows ~ Columns (region rows crossed with product columns)
  facet_grid(region ~ product) +
  theme_bw() +
  labs(
    title = "Regional Revenue Breakdown Matrix",
    subtitle = "Cross-tabulated 2D layout grid using facet_grid",
    x = "Quarter",
    y = "Total Revenue ($)"
  )

print("--- Rendering Facet Grid Matrix ---")
print(grid_facets)

# ==============================================================================
# End of Day 16 Script
# ==============================================================================