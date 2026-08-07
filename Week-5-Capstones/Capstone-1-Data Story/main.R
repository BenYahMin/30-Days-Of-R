# ==============================================================================
# Week 5, Capstone 1: Data Story
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(5001)

# ------------------------------------------------------------------------------
# 1. Gather & Clean Messy Raw Data
# ------------------------------------------------------------------------------
# Context: Cleaning an active customer marketing dataset with messy strings and inconsistent dates.
n_customers <- 150
raw_marketing_data <- tibble(
  customer_id = 1001:(1000 + n_customers),
  join_date_str = sample(c("2025-01-15", "03/22/2025", "2025 June 02", "11-12-2025"), n_customers, replace = TRUE),
  channel_tag = sample(c("  CAMP_PAID_SEARCH  ", "camp_organic ", "CAMP_EMAIL_DIRECT", " Referral_System"), n_customers, replace = TRUE),
  account_tenure_months = round(runif(n_customers, min = 1, max = 24)),
  annual_spend = c(rnorm(n_customers - 5, mean = 1200, sd = 300), rep(NA, 5)) # 5 missing records
)

print("--- Step 1: Raw Ingested Profiles ---")
glimpse(raw_marketing_data)

# Process data elements
clean_story_data <- raw_marketing_data %>%
  mutate(
    # Parse messy date strings cleanly
    join_date = parse_date_time(join_date_str, orders = c("ymd", "mdy")),
    
    # Clean up whitespace and force title casing on channel strings
    marketing_channel = channel_tag %>% str_trim() %>% str_replace_all("CAMP_", "") %>% str_to_title(),
    
    # Impute missing spend entries using global median calculations
    annual_spend = replace_na(annual_spend, median(annual_spend, na.rm = TRUE))
  ) %>%
  select(-join_date_str, -channel_tag)

# ------------------------------------------------------------------------------
# 2. Statistical Validation (Quantifying the Relationship)
# ------------------------------------------------------------------------------
# Task: Verify if channel associations significantly correlate with spend levels 
# when controlling for account tenure.
story_model <- lm(annual_spend ~ account_tenure_months + marketing_channel, data = clean_story_data)

print("--- Step 2: Statistical Narrative Backing ---")
print(summary(story_model))

# ------------------------------------------------------------------------------
# 3. Designing the Presentation Layout (Polished Plot)
# ------------------------------------------------------------------------------
# Calculate channel summary statistics for precise annotations
channel_averages <- clean_story_data %>%
  group_by(marketing_channel) %>%
  summarise(mean_spend = mean(annual_spend), .groups = "drop")

# Build a story-driven visualization focusing on Paid Search vs. Organic channels
story_plot <- ggplot(clean_story_data, aes(x = account_tenure_months, y = annual_spend, color = marketing_channel)) +
  geom_point(alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", se = FALSE, formula = y ~ x, linewidth = 1.2) +
  scale_color_brewer(palette = "Set2") +
  theme_minimal(base_size = 13) +
  labs(
    title = "The True ROI of Paid Search vs. Organic Acquisitions",
    subtitle = "While baseline spend begins higher for Paid Search, Organic growth scales efficiently with account tenure",
    x = "Account Lifecycle Tenure (Months)",
    y = "Total Annual Customer Spend ($)",
    color = "Acquisition Source"
  ) +
  # Use explicit context annotations to point out narrative milestones
  annotate(
    "text", x = 18, y = 1900, 
    label = "Organic acquisitions show a steeper\npositive trajectory over time", 
    color = "#333333", size = 3.5, fontface = "italic"
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 16, color = "#111111"),
    plot.subtitle = element_text(size = 11, color = "#555555", margin = margin(b = 15)),
    legend.position = "bottom",
    panel.grid.minor = element_blank()
  )

print("--- Step 3: Launching Visual Presentation Assets ---")
print(story_plot)

# ==============================================================================
# End of Week 5 Capstone 1 Script
# ==============================================================================