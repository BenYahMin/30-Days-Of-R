# ==========================================
# 30 Days of R
# Day 10: Relational Joins using dplyr
# Authoe: Benjamin Kithome
# ==========================================

# Load required library
library(dplyr)

# 1. Create Mock Datasets, you can also use your previous, the one we created
# A tibble of employees
employees <- tibble(
  emp_id = c(1, 2, 3, 4, 5),
  name = c("Purity", "Cleopus", "Charlie", "Peace", "Eva"),
  dept_id = c(101, 102, 101, 103, NA)
)

# A tibble of departments
departments <- tibble(
  dept_id = c(101, 102, 104),
  dept_name = c("Statistics", "Engineering", "Marketing")
)

print("--- Base Datasets ---")
print(employees)
print(departments)


# 2. Mutating Joins -----------------------------------------------------------
# Mutating joins add new variables to one data frame from matching rows in another.

# A. Inner Join: Keeps only rows with matching keys in both datasets
inner_result <- employees %>% 
  inner_join(departments, by = "dept_id")

print("--- Inner Join ---")
print(inner_result)

# B. Left Join: Keeps all rows from the left dataset, matches from the right
left_result <- employees %>% 
  left_join(departments, by = "dept_id")

print("--- Left Join ---")
print(left_result)

# C. Right Join: Keeps all rows from the right dataset, matches from the left
right_result <- employees %>% 
  right_join(departments, by = "dept_id")

print("--- Right Join ---")
print(right_result)

# D. Full Join: Keeps all rows from both datasets, filling missing values with NA
full_result <- employees %>% 
  full_join(departments, by = "dept_id")

print("--- Full Join ---")
print(full_result)


# 3. Filtering Joins ----------------------------------------------------------
# Filtering joins keep rows from the left dataset based on presence/absence of matches.
# They never add new columns from the right dataset.

# A. Semi Join: Keeps rows in left that HAVE a match in right
semi_result <- employees %>% 
  semi_join(departments, by = "dept_id")

print("--- Semi Join ---")
print(semi_result)

# B. Anti Join: Keeps rows in left that DO NOT HAVE a match in right
anti_result <- employees %>% 
  anti_join(departments, by = "dept_id")

print("--- Anti Join ---")
print(anti_result)


# 4. Advanced: Joining on Different Key Names ---------------------------------
# Mocking a scenario where keys have different column names
locations <- tibble(
  id = c(101, 102),
  city = c("Nairobi", "Mombasa")
)

diff_key_result <- departments %>% 
  left_join(locations, by = c("dept_id" = "id"))

print("--- Join with Different Key Names ---")
print(diff_key_result)

