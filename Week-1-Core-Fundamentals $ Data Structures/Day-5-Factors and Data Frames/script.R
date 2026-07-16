# ==============================================================================
# DAY 5: Factors & Data Frames – Tabular Core Architectures
# Course: 30-Days-Of-R
# Description: Mastering R's explicit tool for categorical values (Factors) and 
#              the ultimate 2D structural table (Data Frames) used in analytics.
# Author: Benjamin Kithome
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. UNDERSTANDING FACTORS: CATEGORICAL ARCHITECTURE
# ------------------------------------------------------------------------------
print("--- 1. Factors Under the Hood (Nominal vs. Ordinal) ---")

# Nominal Data (Unordered Categories)
shirt_colors <- c("Red", "Blue", "Green", "Blue", "Red")
factor_colors <- factor(shirt_colors)

print("Nominal Factor Output:")
print(factor_colors)
print(paste("Underlying Memory Storage Type:", typeof(factor_colors))) # integer
print("Raw Integer Encodings:")
print(as.integer(factor_colors)) # Showcases the hidden integer vector map

# Ordinal Data (Explicitly Enforcing Rank/Sequence)
satisfaction_scores <- c("Medium", "Low", "High", "Low")
ordered_satisfaction <- factor(
  satisfaction_scores,
  levels = c("Low", "Medium", "High"),
  ordered = TRUE
)

print("Ordinal Factor Output with Ordered Levels:")
print(ordered_satisfaction)
print(paste("Is it greater? Medium > Low:", ordered_satisfaction[1] > ordered_satisfaction[2])) # TRUE
# write code here comparing the three levels


# ------------------------------------------------------------------------------
# 2. DATA FRAMES: THE ULTIMATE 2D ARCHITECTURE
# ------------------------------------------------------------------------------
print("--- 2. Building Data Frames (Heterogeneous Tables) ---")

# Rule: A Data Frame is a named list of equal-length vectors acting as columns.
# It breaks the matrix rule: columns can have totally different data types!
employee_data <- data.frame(
  employee_id = 101:104,
  name        = c("Alice", "Bob", "Charlie", "Diana"),
  salary      = c(55000, 62000, 48000, 71000),
  full_time   = c(TRUE, TRUE, FALSE, TRUE),
  stringsAsFactors = FALSE # Standard default rule in modern R (>= 4.0.0)
)

print("Constructed Employee Data Frame Structure:")
print(employee_data)

# Examining Table Characteristics
print(paste("Rows x Columns (dim):", paste(dim(employee_data), collapse = "x")))
print("Structure Diagnostic View:")
str(employee_data)


# ------------------------------------------------------------------------------
# 3. EXTRACTION, SLICING, AND DATA COHESION
# ------------------------------------------------------------------------------
print("--- 3. Slicing & Extracting from Data Frames ---")

# Method A: Extracting an Entire Column (Returns a vector or factor)
# Via List Slicing Shortcuts ($ or [[ ]])
salaries <- employee_data$salary
print(paste("Extracted Column Vector via $: ", paste(salaries, collapse = ", ")))

# Method B: Coordinate Slicing [row, column]
# Extract Row 2, Column 3 (Bob's Salary)
print(paste("Coordinate Slicing [2,3]:", employee_data[2, 3]))

# Sub-table extraction (Rows 1 to 2, Columns 2 to 3)
sub_table <- employee_data[1:2, c("name", "salary")]
print("Extracted Sub-table slice:")
print(sub_table)


# ------------------------------------------------------------------------------
# 4. CONDITIONAL ROW FILTERING (THE LOGICAL ENGINE)
# ------------------------------------------------------------------------------
print("--- 4. Data Subsetting using Logical Vectors ---")

# Objective: Filter for employees making more than $50,000
high_earner_logical <- employee_data$salary > 50000
print("The Generated Logical Vector Mask:")
print(high_earner_logical) # TRUE, TRUE, FALSE, TRUE

# Passing the logical vector mask into the row slot of [row, column]
high_earners_df <- employee_data[high_earner_logical, ]
print("Filtered Row Matrix Output:")
print(high_earners_df)


# ------------------------------------------------------------------------------
# 5. DAY 5 CHALLENGE LABORATORY
# ------------------------------------------------------------------------------
print("--- 5. Challenge Verification ---")

# 1. Construct a dataframe containing 4 columns: product_name, category (factor), 
#    unit_price, and inventory_count.
inventory_df <- data.frame(
  product_name    = c("Laptop", "Mouse", "Keyboard", "Monitor"),
  category        = factor(c("Tech", "Accessory", "Accessory", "Tech")),
  unit_price      = c(1200, 25, 45, 300),
  inventory_count = c(10, 150, 85, 0)
)

# 2. Add a calculated column called 'total_asset_value' (unit_price * inventory_count)
inventory_df$total_asset_value <- inventory_df$unit_price * inventory_df$inventory_count

# 3. Use logical filtering to return rows where inventory_count is exactly 0 (Out of stock).
out_of_stock_df <- inventory_df[inventory_df$inventory_count == 0, , drop = FALSE]

print("Final Evaluated Challenge Data Frame Layout:")
print(inventory_df)
print("Isolated Out of Stock Records:")
print(out_of_stock_df)