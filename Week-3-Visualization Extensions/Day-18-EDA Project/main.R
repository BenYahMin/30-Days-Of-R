# ==============================================================================
# Day 18: Exploratory Data Analysis (EDA) Project
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(scales)
library(tidyverse)
library(lubridate)


# Set seed for reproducible pseudo-random generation
set.seed(101)

# Custom publication-ready ggplot theme
theme_eda <- function() {
  theme_minimal(base_size = 11) +
    theme(
      plot.title = element_text(face = "bold", size = 14, margin = margin(b = 6)),
      plot.subtitle = element_text(color = "grey30", size = 10, margin = margin(b = 10)),
      plot.caption = element_text(color = "grey50", size = 8, hjust = 1, margin = margin(t = 10)),
      axis.title = element_text(face = "bold", size = 10),
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_line(color = "#ebebeb"),
      panel.grid.major.y = element_line(color = "#ebebeb"),
      legend.position = "bottom",
      legend.title = element_text(face = "bold", size = 9),
      strip.background = element_rect(fill = "#f2f4f7", color = NA),
      strip.text = element_text(face = "bold", size = 10, color = "#1a252c")
    )
}

n_records <- 400

# Generating realistic right-skewed revenue (Log-Normal distribution)
raw_revenue <- rlnorm(n_records - 25, meanlog = 5.2, sdlog = 0.5)

eda_raw_data <- tibble(
  order_id          = 1001:(1000 + n_records),
  customer_segment  = sample(c("Corporate", "Consumer", "SMB"), n_records, replace = TRUE, prob = c(0.3, 0.5, 0.2)),
  order_date_str    = sample(seq(as.Date('2026/01/01'), as.Date('2026/06/30'), by = "day"), n_records, replace = TRUE) %>% as.character(),
  channel           = sample(c("Paid Search ", "Organic", "Email Link", "Referral"), n_records, replace = TRUE),
  revenue           = c(raw_revenue, rep(NA, 25)), # Injecting 5% missingness
  discount_applied  = sample(c(0, 0.05, 0.10, 0.15, 0.20), n_records, replace = TRUE, prob = c(0.5, 0.2, 0.15, 0.1, 0.05)),
  returned          = sample(c("YES", "NO"), n_records, replace = TRUE, prob = c(0.14, 0.86))
)

# RAW DATA AUDIT
glimpse(eda_raw_data)

# Missingness assessment
missing_summary <- eda_raw_data %>%
  summarise(across(everything(), ~ sum(is.na(.)))) %>%
  pivot_longer(cols = everything(), names_to = "variable", values_to = "missing_count") %>%
  mutate(missing_pct = (missing_count / n_records) * 100)

print(missing_summary)

# Data Wrangling $ Feature engineering
eda_cleaned <- eda_raw_data %>%
  mutate(
    # String hygiene: trim whitespace
    channel          = str_trim(channel),
    
    # Date parsing & temporal feature extraction
    order_date       = ymd(order_date_str),
    order_month      = month(order_date, label = TRUE, abbr = TRUE),
    order_wday       = wday(order_date, label = TRUE, abbr = TRUE),
    is_weekend       = order_wday %in% c("Sat", "Sun"),
    
    # Categorical standardization
    is_returned      = if_else(returned == "YES", TRUE, FALSE)
  ) %>%
  # Group-Wise Median Imputation (Imputing by Segment preserves distribution integrity)
  group_by(customer_segment) %>%
  mutate(
    revenue = replace_na(revenue, median(revenue, na.rm = TRUE))
  ) %>%
  ungroup() %>%
  mutate(
    # Financial metrics engineering
    gross_revenue    = revenue / (1 - discount_applied),
    discount_amount  = gross_revenue - revenue
  ) %>%
  select(-order_date_str, -returned)

# CLEAN DATA SUMMARY
summary(eda_cleaned %>% select(revenue, discount_applied, gross_revenue, is_returned))

#
# Non-parametric numerical summary stats (Robust against skewness)
num_summary <- eda_cleaned %>%
  summarise(
    Mean_Rev   = mean(revenue),
    SD_Rev     = sd(revenue),
    Median_Rev = median(revenue),
    IQR_Rev    = IQR(revenue),
    Min_Rev    = min(revenue),
    Max_Rev    = max(revenue)
  )

cat("\n--- Revenue Distribution Numerical Breakdown ---\n")
print(num_summary)

# Visualizing Revenue Distribution with Density & Boxplot
revenue_dist_plot <- ggplot(eda_cleaned, aes(x = revenue, fill = is_returned)) +
  geom_histogram(aes(y = ..density..), bins = 35, alpha = 0.6, position = "identity", color = "white") +
  geom_density(alpha = 0.3) +
  scale_x_continuous(labels = dollar_format(prefix = "$")) +
  scale_fill_manual(values = c("FALSE" = "#10b981", "TRUE" = "#ef4444"), labels = c("Retained", "Returned")) +
  labs(
    title    = "Transaction Revenue Density Distribution",
    subtitle = "Comparing retained vs. returned orders across 2026 sales volume",
    x        = "Net Revenue ($)",
    y        = "Density",
    fill     = "Order Outcome"
  ) +
  theme_eda()

print(revenue_dist_plot)

#
segment_channel_returns <- eda_cleaned %>%
  group_by(customer_segment, channel) %>%
  summarise(
    total_orders  = n(),
    return_count  = sum(is_returned),
    return_rate   = mean(is_returned),
    avg_revenue   = mean(revenue),
    .groups       = "drop"
  )

# BIVARIATE BREAKDOWN
print(segment_channel_returns)

# Return Rate Heatmap Plot
return_heatmap_plot <- ggplot(segment_channel_returns, aes(x = channel, y = customer_segment, fill = return_rate)) +
  geom_tile(color = "white", linewidth = 0.8) +
  geom_text(aes(label = percent(return_rate, accuracy = 0.1)), color = "black", fontface = "bold", size = 3.8) +
  scale_fill_gradient(low = "#dcfce7", high = "#fca5a5", labels = percent_format()) +
  labs(
    title    = "Order Return Rate Matrix",
    subtitle = "Identifying high-friction channel and customer segment intersections",
    x        = "Acquisition Channel",
    y        = "Customer Segment",
    fill     = "Return Rate"
  ) +
  theme_eda() +
  theme(panel.grid = element_blank())

print(return_heatmap_plot)

# 5. Multivariate Time Series Dynamics & Performance Trends
monthly_channel_performance <- eda_cleaned %>%
  group_by(order_month, customer_segment, channel) %>%
  summarise(
    total_sales  = sum(revenue),
    order_volume = n(),
    .groups      = "drop"
  )

macro_trend_plot <- ggplot(monthly_channel_performance, aes(x = order_month, y = total_sales, group = channel, color = channel)) +
  geom_line(linewidth = 1.1) +
  geom_point(size = 2) +
  facet_wrap(~ customer_segment, scales = "free_y") +
  scale_y_continuous(labels = dollar_format(prefix = "$", scale = 1e-3, suffix = "K")) +
  scale_color_brewer(palette = "Set2") +
  labs(
    title    = "Macro Monthly Revenue Performance",
    subtitle = "Seasonal trajectory across channels and market segments (H1 2026)",
    x        = "Month (2026)",
    y        = "Aggregate Revenue ($K)",
    color    = "Channel"
  ) +
  theme_eda()

print(macro_trend_plot)

total_rev     <- sum(eda_cleaned$revenue)
overall_rr    <- mean(eda_cleaned$is_returned)
top_segment   <- eda_cleaned %>% group_by(customer_segment) %>% summarise(rev = sum(revenue)) %>% arrange(desc(rev)) %>% slice(1)
top_channel   <- eda_cleaned %>% group_by(channel) %>% summarise(rev = sum(revenue)) %>% arrange(desc(rev)) %>% slice(1)

{
cat("                       EXECUTIVE EDA SUMMARY REPORT\n")
cat(sprintf("• Total Processed Gross Revenue : %s\n", dollar(sum(eda_cleaned$gross_revenue))))
cat(sprintf("• Net Settled Revenue           : %s\n", dollar(total_rev)))
cat(sprintf("• Overall Order Return Rate     : %.2f%%\n", overall_rr * 100))
cat(sprintf("• Top Revenue Customer Segment  : %s (%s)\n", top_segment$customer_segment, dollar(top_segment$rev)))
cat(sprintf("• Top Acquisition Channel       : %s (%s)\n", top_channel$channel, dollar(top_channel$rev)))
}

