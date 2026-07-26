# ==============================================================================
# Day 18: Exploratory Data Analysis (EDA) Project
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducible pseudo-random generation
set.seed(101)

# ------------------------------------------------------------------------------
# 1. Setup Complex Mock Dataset
# ------------------------------------------------------------------------------
# Simulating raw operational business tracking tables
n_records <- 400
eda_raw_data <- tibble(
  order_id = 1001:(1000 + n_records),
  customer_segment = sample(c("Corporate", "Consumer", "SMB"), n_records, replace = TRUE, prob = c(0.3, 0.5, 0.2)),
  order_date_str = sample(seq(as.Date('2026/01/01'), as.Date('2026/06/30'), by="day"), n_records, replace = TRUE) %>% as.character(),
  channel = sample(c("Paid Search", "Organic", "Email Link", "Referral "), n_records, replace = TRUE),
  revenue = c(rnorm(n_records - 20, mean = 250, sd = 80), rep(NA, 20)), # Injecting missing values
  returned = sample(c("YES", "NO"), n_records, replace = TRUE, prob = c(0.15, 0.85))
)

print("--- Step 1: Initial Structural Glimpse ---")
glimpse(eda_raw_data)

# ------------------------------------------------------------------------------
# 2. Data Cleaning & Profiling (Target Isolation)
# ------------------------------------------------------------------------------
# Tasks: Handle text white spaces, convert date data types, and impute missing fields.
eda_cleaned <- eda_raw_data %>%
  mutate(
    # Clean whitespace from categories
    channel = str_trim(channel),
    
    # Parse dates explicitly
    order_date = ymd(order_date_str),
    order_month = month(order_date, label = TRUE, abbr = TRUE),
    
    # Standardize string states to boolean triggers
    is_returned = if_else(returned == "YES", TRUE, FALSE),
    
    # Impute missing values with the median revenue of valid transactions
    revenue = replace_na(revenue, median(revenue, na.rm = TRUE))
  ) %>%
  select(-order_date_str, -returned)

print("--- Step 2: Missing Data & Cleaning Summary ---")
summary(eda_cleaned)

# ------------------------------------------------------------------------------
# 3. Univariate & Bivariate Distributions
# ------------------------------------------------------------------------------
# Task: Visualize the revenue profile layout to pinpoint skewness and returns behavior.
revenue_distribution_plot <- ggplot(eda_cleaned, aes(x = revenue, fill = is_returned)) +
  geom_histogram(bins = 30, position = "stack", color = "white", alpha = 0.85) +
  scale_fill_manual(values = c("#2ca02c", "#d62728"), labels = c("Kept", "Returned")) +
  theme_minimal() +
  labs(
    title = "Distribution of Revenue Volume by Return Status",
    subtitle = "Assessing value ranges and return patterns across 2026 transactions",
    x = "Transaction Revenue ($)",
    y = "Count of Orders",
    fill = "Order Status"
  )

print("--- Rendering Revenue Distribution Chart ---")
print(revenue_distribution_plot)

# ------------------------------------------------------------------------------
# 4. Multivariate Deep Dive (Faceted Relationship Mapping)
# ------------------------------------------------------------------------------
# Task: Uncover segment tracking behaviors by plotting revenue across channels over time.
channel_trends_plot <- eda_cleaned %>%
  group_by(order_month, customer_segment, channel) %>%
  summarise(total_sales = sum(revenue), .groups = "drop") %>%
  ggplot(aes(x = order_month, y = total_sales, group = channel, color = channel)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 2) +
  # Create a matrix layout breaking down Segments across panels
  facet_wrap(~ customer_segment, scales = "free_y") +
  theme_bw() +
  scale_color_brewer(palette = "Dark2") +
  labs(
    title = "Macro Channel Performance Matrix",
    subtitle = "Tracking seasonal growth dynamics across client focus segments",
    x = "Timeline (2026)",
    y = "Aggregate Revenue Sales ($)",
    color = "Marketing Channel"
  ) +
  theme(legend.position = "bottom", strip.background = element_rect(fill = "#f0f0f0"))

print("--- Rendering Multivariate Faceted Trend Line Plot ---")
print(channel_trends_plot)

# ==============================================================================
# End of Day 18 EDA Project Script
# ==============================================================================

