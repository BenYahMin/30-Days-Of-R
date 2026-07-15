# ==========================================
# Day 7: Introduction to dplyr Basics
# 30 Days of R Challenge
# Author: Benjamin Kithome
# ==========================================

# 1. Load the tidyverse (which includes dplyr) or just dplyr
# install.packages("dplyr") # Uncomment if not installed
library(dplyr)

# We will use the built-in 'msleep' dataset (mammals sleep data)
data("msleep")
head(msleep)

# ------------------------------------------
# The Pipe Operator (%>% or |>)
# Allows chaining of multiple operations sequentially 
# ------------------------------------------

# ------------------------------------------
# 1. select() - Extract specific columns
# ------------------------------------------
# Select by name
sleep_basic <- msleep %>% 
  select(name, genus, sleep_total, bodywt)

# Helper functions with select: starts_with(), ends_with(), contains()
sleep_time <- msleep %>% 
  select(name, starts_with("sleep"))

# ------------------------------------------
# 2. filter() - Subset rows using logical conditions
# ------------------------------------------
# Filter for mammals that sleep more than 15 hours
heavy_sleepers <- msleep %>% 
  filter(sleep_total > 15)

# Multiple conditions (AND)
heavy_and_light_wt <- msleep %>% 
  filter(sleep_total > 15 & bodywt < 1)

# Categorical matching using %in%
selected_vore <- msleep %>% 
  filter(vore %in% c("herbi", "carni"))

# ------------------------------------------
# 3. mutate() - Create or modify columns
# ------------------------------------------
# Convert sleep_total from hours to minutes and bodywt to grams
sleep_modified <- msleep %>% 
  select(name, sleep_total, bodywt) %>% 
  mutate(
    sleep_total_mins = sleep_total * 60,
    bodywt_g = bodywt * 1000
  )

# ------------------------------------------
# 4. arrange() - Order rows by values of a column
# ------------------------------------------
# Sort by sleep_total in ascending order
sleep_ascending <- msleep %>% 
  arrange(sleep_total)

# Sort by sleep_total in descending order
sleep_descending <- msleep %>% 
  arrange(desc(sleep_total))

# ------------------------------------------
# 5. group_by() & summarise() - Aggregate data
# ------------------------------------------
# Calculate the average and max sleep total for each feeding type (vore)
sleep_summary <- msleep %>% 
  filter(!is.na(vore)) %>%             # Remove NA values in vore
  group_by(vore) %>% 
  summarise(
    avg_sleep = mean(sleep_total),
    max_sleep = max(sleep_total),
    count = n()                        # Counts the number of species per group
  ) %>% 
  arrange(desc(avg_sleep))

print(sleep_summary)