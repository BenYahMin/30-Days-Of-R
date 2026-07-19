# ==============================================================================
# Day 11: Text Manipulation with stringr
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(tidyverse)

# ------------------------------------------------------------------------------
# 1. Setup Mock Dataset
# ------------------------------------------------------------------------------
# Simulating a messy dataset containing customer transaction logs
messy_data <- tibble(
  transaction_id = 1:5,
  customer_name = c("  alice SMITH", "bob jones ", "Charlie Brown", "DIANA prince", "  evan   "),
  product_code = c("PROD_9942_ACTIVE", "PROD_1022_PENDING", "PROD_4421_ACTIVE", "PROD_8831_INACTIVE", "PROD_0021_PENDING"),
  notes = c("Received order.", "Error: Invalid card", "shipped standard shipping", "Returned item", "Follow-up required.")
)

print("--- Original Messy Data ---")
print(messy_data)

# ------------------------------------------------------------------------------
# 2. Text Cleaning & Standardization
# ------------------------------------------------------------------------------
# Tasks: Clean up names by trimming whitespace and fixing inconsistent casing.
cleaned_data <- messy_data %>%
  mutate(
    # Trim leading and trailing whitespace
    customer_name = str_trim(customer_name),
    # Format names to Title Case
    customer_name = str_to_title(customer_name)
  )

print("--- Standardized Names ---")
print(cleaned_data %>% select(transaction_id, customer_name))

# ------------------------------------------------------------------------------
# 3. Extracting and Splitting Substrings
# ------------------------------------------------------------------------------
# Tasks: Isolate the numeric ID and the status from the product_code column.
extracted_data <- cleaned_data %>%
  mutate(
    # Extract the 4-digit ID using str_sub (positions 6 to 9)
    numeric_id = str_sub(product_code, 6, 9),
    
    # Alternatively, use str_split to extract status (takes the 3rd element)
    status = map_chr(str_split(product_code, "_"), ~ .x[3])
  )

print("--- Extracted Code Data ---")
print(extracted_data %>% select(customer_name, numeric_id, status))

# ------------------------------------------------------------------------------
# 4. Pattern Detection and Replacement
# ------------------------------------------------------------------------------
# Tasks: Flag orders containing errors and rename 'PENDING' to 'AWAITING_REVIEW'.
final_report <- extracted_data %>%
  mutate(
    # Detect if 'Error' is present in the notes (case-insensitive flag optional, here exact)
    has_error = str_detect(notes, "Error"),
    
    # Replace PENDING with a cleaner description label
    product_code = str_replace(product_code, "PENDING", "AWAITING_REVIEW")
  )

print("--- Final Processed Report ---")
print(final_report)

# ==============================================================================
# End of Day 11 Script
# ==============================================================================