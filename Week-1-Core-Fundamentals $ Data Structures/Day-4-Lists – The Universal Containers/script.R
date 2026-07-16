# ==============================================================================
# DAY 4: Lists – The Universal Containers
# Course: 30-Days-Of-R
# Description: Breaking the homogeneity rule. Mastering heterogeneous storage,
#              the critical `[` vs `[[` subsetting rules, and named lists.
# Author: Benjamin Kithome
# DATE: 12, July 2024
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. HETEROGENEOUS ARCHITECTURE: WHAT IS A LIST?
# ------------------------------------------------------------------------------
print("--- 1. Breaking the Homogeneity Barrier ---")

# Unlike vectors or matrices, lists are GENERIC vectors. 
# They store pointers to other objects, allowing mixed data types and sizes.
mixed_list <- list(
  integer_vector = 1:3,
  logical_value  = TRUE,
  char_string    = "Hello R",
  inner_matrix   = matrix(1:4, nrow = 2)
)
{
print("The structural summary of our mixed list (str):")
str(mixed_list) # str() is essential for viewing list hierarchies
}

# ------------------------------------------------------------------------------
# 2. SUBSETTING PARADIGMS: THE SINGLE VS. DOUBLE BRACKET DILEMMA
# ------------------------------------------------------------------------------
print("--- 2. Subsetting Mechanics: [ vs [[ ---")

# Rule 1: Single Brackets `[` always return a LIST (a smaller slice of the train).
{
list_slice <- mixed_list[1]
print("Subsetting with single brackets [1]:")
print(list_slice)
print(paste("Class of [1] is:", class(list_slice))) # Still a "list"
}

# Rule 2: Double Brackets `[[` extract the ACTUAL CONTENT inside the container.
{
actual_content <- mixed_list[[1]]
print("Extracting with double brackets [[1]]:")
print(actual_content)
print(paste("Class of [[1]] is:", class(actual_content))) # Returns "integer" vector
}

# ------------------------------------------------------------------------------
# 3. NAMED LISTS & THE `$` OPERATOR
# ------------------------------------------------------------------------------
print("--- 3. Named Lists & Shortcut Operators ---")

# If a list has names, the `$` operator serves as a shortcut for `[[`
print("Extracting by name using $char_string:")
print(mixed_list$char_string)

# You can also use character strings inside double brackets
print("Extracting by string name using [['logical_value']]:")
print(mixed_list[["logical_value"]])


# ------------------------------------------------------------------------------
# 4. MUTABILITY: EXTENDING AND MODIFICATION
# ------------------------------------------------------------------------------
print("--- 4. List Mutability & Growth ---")

developer_profile <- list(name = "Ben", language = "R")

# Adding a new element to an existing list
developer_profile$experience_years <- 3
developer_profile[["status"]] <- "Learning"
print(developer_profile) # status which is learning is added

# Removing an element by assigning NULL
developer_profile$status <- NULL

print("Modified profile list:")
print(developer_profile)


# ------------------------------------------------------------------------------
# 5. FLATTENING LISTS: THE `unlist()` FUNCTION
# ------------------------------------------------------------------------------
print("--- 5. Flattening Lists ---")

# unlist() forces a list back down into an atomic vector. 
# Beware: Day 2 Type Coercion rules will apply immediately!
simple_list <- list(a = 1, b = 2, c = "three")
coerced_vector <- unlist(simple_list)

print("Flattened vector from a mixed list:")
print(coerced_vector) # Everything is forced into a character vector


# ------------------------------------------------------------------------------
# 6. DAY 4 CHALLENGE LABORATORY
# ------------------------------------------------------------------------------
print("--- 6. Challenge Verification ---")

# 1. Create a named list called 'dataset_report' containing:
#    - analyst: Your name (character)
#    - sample_sizes: A vector of 10, 50, 100 (numeric)
#    - configuration: A list containing metric="Accuracy" and optimized=TRUE (nested list)
dataset_report <- list(
  analyst = "Ben",
  sample_sizes = c(10, 50, 100),
  configuration = list(metric = "Accuracy", optimized = TRUE)
)

# 2. Write an expression to isolate the mean of 'sample_sizes' from the list.
calculated_mean <- mean(dataset_report[[2]]) # or dataset_report$sample_sizes
print(paste("Extracted Sample Sizes Mean:", calculated_mean))

# 3. Extract the 'metric' parameter out of the nested configuration list.
extracted_metric <- dataset_report$configuration$metric # or dataset_report[[3]][[1]]
print(paste("Extracted Nested Metric:", extracted_metric))

