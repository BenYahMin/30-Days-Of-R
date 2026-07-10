# ==============================================================================
# DELTAFLOW RESEARCH // 30 DAYS OF R
# MASTER SOLUTIONS: WEEK 2 (THE TIDYVERSE)
# ==============================================================================

library(dplyr)
library(stringr)

# Load the intentional messy raw data structure from the data directory
raw_data <- read.csv("../data/raw-sales-data.csv", stringsAsFactors = FALSE)

print("Executing cleaning pipeline matrix...")

# --- DAY 14: END-OF-WEEK PIPELINE CHALLENGE ---
cleaned_pipeline_output <- raw_data %>%
  # 1. Standardize text cases to clear structural categorization anomalies
  mutate(Customer_Segment = str_to_title(Customer_Segment)) %>%
  
  # 2. Isolate rows where critical metrics are complete (Drop explicit NAs)
  filter(!is.na(Revenue_USD) & Revenue_USD > 0) %>%
  
  # 3. Calculate operational summary aggregates
  group_by(Customer_Segment) %>%
  summarize(
    Total_Volume_USD = sum(Revenue_USD),
    Mean_Transaction_Val = mean(Revenue_USD),
    Transaction_Count = n()
  )

print("Pipeline execution complete. Resulting framework:")
print(cleaned_pipeline_output)