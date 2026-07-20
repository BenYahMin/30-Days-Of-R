# ==============================================================================
# Day 12: Advanced Datetime Wrangling & Feature Engineering with lubridate
# 30-Days-Of-R Challenge
# Author: Benjamin Kithome
# ==============================================================================

# Load core ecosystem safely
library(tidyverse)
library(lubridate)

# ------------------------------------------------------------------------------
# 1. Setup Advanced Mock Dataset
# ------------------------------------------------------------------------------
# Simulating an enterprise e-commerce order ledger with fragmented text formats,
# missing data, and structural variations.
raw_orders <- tibble(
  order_id       = 101:106,
  customer       = c("Mukungi", "Simon", "Mitchel", "Daemon", "Bruno", "Faith"),
  order_date_raw = c("2026-07-10", "07/12/2026", "2026 July 14", "2026-07-15", "07-18-2026", "Malformed_Date"),
  dispatch_raw   = c("2026-07-11 09:30:00", "2026-07-13 14:15:00", "2026-07-15 11:00:00", "2026-07-17 17:45:00", "2026-07-19 08:00:00", NA)
)

cat("\n--- [STEP 1] Raw Orders Ingested Matrix ---\n")
print(raw_orders)

# ------------------------------------------------------------------------------
# 2. Resilient Multi-Format Parsing
# ------------------------------------------------------------------------------
# We apply multiple fallback parsing orders to capture mixed formatting styles
# and explicitly handle unparseable anomalies without breaking execution.
parsed_orders <- raw_orders %>%
  mutate(
    # Standardize mixed string fields into clean Date vectors
    order_date = parse_date_time(order_date_raw, orders = c("ymd", "mdy", "dmy")),
    
    # Cast raw dispatch timestamps into unambiguous POSIXct date-time objects (UTC)
    dispatch_time = ymd_hms(dispatch_raw, tz = "UTC")
  )

cat("\n--- [STEP 2] Standardized Date-Time Profiles ---\n")
print(parsed_orders %>% select(order_id, order_date, dispatch_time))

# ------------------------------------------------------------------------------
# 3. Structural Feature Engineering
# ------------------------------------------------------------------------------
# Extract analytical vectors to feed downstream operational reporting or models.
featured_orders <- parsed_orders %>%
  # Filter out corrupt log rows to protect metric aggregations
  filter(!is.na(order_date)) %>%
  mutate(
    # Extract chronological components
    order_year    = year(order_date),
    order_month   = month(order_date, label = TRUE, abbr = TRUE),
    order_day     = day(order_date),
    
    # Extract categorical operational drivers
    order_wday    = wday(order_date, label = TRUE, abbr = FALSE),
    is_weekend    = if_else(order_wday %in% c("Saturday", "Sunday"), TRUE, FALSE),
    dispatch_hour = hour(dispatch_time)
  )

cat("\n--- [STEP 3] Engineered Temporal Features ---\n")
print(featured_orders %>% select(customer, order_wday, is_weekend, dispatch_hour))

# ------------------------------------------------------------------------------
# 4. High-Precision Calculations & Operational Metrics
# ------------------------------------------------------------------------------
# Perform mathematical boundary shifting and absolute velocity calculation.
final_datetime_report <- featured_orders %>%
  mutate(
    # Compute precise continuous lead time window down to fractional hours
    hours_to_dispatch = as.numeric(difftime(dispatch_time, order_date, units = "hours")),
    
    # Establish cohort grouping boundaries using flooring and ceiling
    month_start  = floor_date(order_date, unit = "month"),
    fiscal_week  = ceiling_date(order_date, unit = "week"),
    
    # Calculate order delivery SLA health targets
    is_sla_violated = if_else(hours_to_dispatch > 36.0, TRUE, FALSE)
  )

cat("\n--- [STEP 4] Final Production Datetime Analysis Report ---\n")
print(final_datetime_report %>% 
        select(order_id, customer, hours_to_dispatch, month_start, is_sla_violated))

# ------------------------------------------------------------------------------
# 5. Data Integrity Validation Audit
# ------------------------------------------------------------------------------
cat("\n--- [STEP 5] Pipeline Integrity Validation Summary ---\n")
unparsed_count <- sum(is.na(parsed_orders$order_date))
cat(sprintf("• Malformed records quarantined: %d\n", unparsed_count))
cat(sprintf("• Mean operational dispatch latency: %.2f hours\n", 
            mean(final_datetime_report$hours_to_dispatch, na.rm = TRUE)))

# ==============================================================================
# End of Enhanced Day 12 Script
# ==============================================================================

