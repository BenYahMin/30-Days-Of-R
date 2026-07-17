# ==========================================
# Day 9: Data Reshaping with tidyr
# 30 Days of R Challenge
# Author: Benjamin Kithome
# ==========================================

# Load required package
library(tidyverse)

# ------------------------------------------
# 1. Setup Sample Data Sets
# ------------------------------------------

# Wide Dataset (e.g., Quarterly Business Revenue)
wide_data <- tibble(
  company = c("AlphaInc", "BetaCo", "GammaLtd"),
  Q1_2025 = c(150, 210, 95),
  Q2_2025 = c(180, 240, 110),
  Q3_2025 = c(210, 220, 125)
)

# Messy Delimited Dataset
messy_data <- tibble(
  id = 1:3,
  info = c("25-Male-NY", "31-Female-CA", "19-Nonbinary-TX")
)

# Print initial data
print("Original Wide Data:")
print(wide_data)

# ------------------------------------------
# 2. Reshaping Wide to Long (pivot_longer)
# ------------------------------------------
print("--- Pivoting to Long Format ---")

long_data <- wide_data %>%
  pivot_longer(
    cols = starts_with("Q"),
    names_to = "quarter",
    values_to = "revenue"
  )

print(long_data)

# ------------------------------------------
# 3. Reshaping Long to Wide (pivot_wider)
# ------------------------------------------
print("--- Pivoting back to Wide Format ---")

restored_wide <- long_data %>%
  pivot_wider(
    names_from = quarter,
    values_from = revenue
  )

print(restored_wide)

# ------------------------------------------
# 4. Splitting and Combining Columns
# ------------------------------------------
print("--- Separating and Uniting Columns ---")

# Separate a messy column into three distinct variables
separated_data <- messy_data %>%
  separate_wider_delim(
    cols = info,
    delim = "-",
    names = c("age", "gender", "state")
  )

print("Separated Data:")
print(separated_data)

# Recombine columns back together using unite
united_data <- separated_data %>%
  unite(
    col = "demographics",
    age, gender, state,
    sep = " | "
  )

print("United Data:")
print(united_data)