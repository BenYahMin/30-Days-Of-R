### File 2: `Day08/dplyr_aggregations.R`
# ==========================================
# Day 8: dplyr Aggregations
# 30 Days of R Challenge
# Author: Benjamin Kithome
# ==========================================

# Load required libraries
library(dplyr)

# Let's use the built-in 'mtcars' and 'iris' datasets for practice.
head(mtcars)
head(iris)

# ------------------------------------------
# 1. Basic Summaries using summarise()
# ------------------------------------------
# Reducing columns to single-value metrics
car_stats <- mtcars %>%
  summarise(
    avg_mpg   = mean(mpg, na.rm = TRUE),
    max_hp    = max(hp),
    total_qty = n() # Count of total rows
  )

print("--- Overall Car Stats ---")
print(car_stats)


# ------------------------------------------
# 2. Grouped Summaries using group_by() + summarise()
# ------------------------------------------
# Grouping by cylinders ('cyl') to calculate average horsepower and fuel efficiency
grouped_cyl <- mtcars %>%
  group_by(cyl) %>%
  summarise(
    avg_hp  = mean(hp),
    avg_mpg = mean(mpg),
    car_count = n()
  ) %>%
  ungroup() # Best practice: Always ungroup to avoid sticky group behaviors!

print("--- Stats by Cylinder ---")
print(grouped_cyl)


# ------------------------------------------
# 3. Multi-level Grouping
# ------------------------------------------
# Grouping by multiple variables: Transmission (am: 0 = auto, 1 = manual) and Cylinders
multi_grouped <- mtcars %>%
  group_by(am, cyl) %>%
  summarise(
    avg_mpg = mean(mpg),
    .groups = "drop" # Alternative way to automatically ungroup after summarise()
  )

print("--- Stats by Transmission and Cylinder ---")
print(multi_grouped)


# ------------------------------------------
# 4. Quick Frequencies with count()
# ------------------------------------------
# count() is shorthand for group_by() %>% summarise(n = n())
species_counts <- iris %>%
  count(Species, sort = TRUE) # 'sort = TRUE' orders by highest frequency

print("--- Species Counts ---")
print(species_counts)


# ------------------------------------------
# 5. Grouped mutate() (Window Calculations)
# ------------------------------------------
# If we use mutate() on a grouped dataset, it calculates the summary 
# statistic but retains all original rows (broadcasting the group statistic).
iris_percentage <- iris %>%
  group_by(Species) %>%
  mutate(
    species_avg_petal = mean(Petal.Length),
    diff_from_avg     = Petal.Length - species_avg_petal
  ) %>%
  select(Species, Petal.Length, species_avg_petal, diff_from_avg) %>%
  ungroup()

print("--- Sample of Grouped Mutate ---")
print(head(iris_percentage, 10))
