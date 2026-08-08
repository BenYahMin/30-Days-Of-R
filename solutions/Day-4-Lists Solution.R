# ------------------------------------------------------------------------------
# 6. DAY 4 CHALLENGE
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
