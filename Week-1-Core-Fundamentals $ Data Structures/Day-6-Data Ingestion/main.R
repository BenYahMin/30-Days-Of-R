#---
## 2. `data_ingestion.R`
#This hands-on script generates a temporary mock dataset, guides the learner through reading and writing with Base R and tidyverse packages, and cleanup.
# ==========================================
# Day 6: Data Ingestion (Reading and Writing)
# Author: Benjamin Kithome
# ==========================================

# --- Step 1: Set Up & Helper Mock Data ---
# Since we don't want to break paths, let's write a mock CSV locally to practice on.
# One can always call a csv file with a filepath ill show at the bottom.
dir.create("temp_data", showWarnings = FALSE)

mock_data <- data.frame(
  Employee_ID = c(101, 102, 103, 104),
  Name = c("Alice Jones", "Bob Smith", "Charlie Brown", "Diana Prince"),
  Department = c("HR", "Engineering", "Finance", "Engineering"),
  Salary = c(62000, 85000, NA, 95000), # Notice the NA for missing data
  Join_Date = c("2021-03-15", "2020-11-01", "2023-01-10", "2019-07-22")
)

# Write this mock data frame to our temporary directory
write.csv(mock_data, "temp_data/employees.csv", row.names = FALSE)
cat("✅ Mock data generated and saved to 'temp_data/employees.csv'\n")


# --- Step 2: Ingestion using Base R ---
cat("\n--- Loading data with Base R ---\n")

# Read using read.csv as i said up there
base_df <- read.csv("temp_data/employees.csv")

# Inspect structure
print(head(base_df))
str(base_df) 

# Note: In older R versions (< 4.0.0), strings were automatically converted to factors.
# Today, they stay as 'character' types by default, but you can force factors using:
# read.csv("file.csv", stringsAsFactors = TRUE)


# --- Step 3: Ingestion using tidyverse ('readr') ---
# Make sure to install readr if you haven't yet: install.packages("readr")
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
library(readr)

cat("\n--- Loading data with readr ---\n")

# read_csv automatically prints a helpful parsing specification summary
tidy_df <- read_csv("temp_data/employees.csv")

# Print the "tibble" (tidy's enhanced data frame)
print(tidy_df)


# --- Step 4: Handling Common Import Edge Cases ---

# Scenario A: Dealing with missing value representations (e.g., 'N/A', 'missing', '.', or blank spaces)
# Let's say our data has "N/A" or "null" written as strings. We can explicitly specify them:
# clean_df <- read_csv("temp_data/employees.csv", na = c("NA", "N/A", ""))

# Scenario B: Skipping metadata rows 
# Sometimes files come with explanatory headers. Use 'skip':
# read_csv("file.csv", skip = 3) # Skips the first 3 lines of the file


# --- Step 5: Reading Excel Files ---
# To handle standard Excel (.xlsx) formats:
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
library(readxl)

# (Instructional Example - excel files cannot be generated dynamically easily as pure text)
# excel_df <- read_excel("temp_data/financials.xlsx", sheet = "Q1_Report")


# --- Step 6: Exporting/Writing Out Data ---
cat("\n--- Exporting/Writing Data structures ---\n")

# 1. Export back to CSV using readr (cleaner, faster, no row names)
write_csv(tidy_df, "temp_data/processed_employees.csv")

# 2. Saving as RDS (R Data Serialization)
# This is R's native format. Extremely useful because it preserves ALL R attributes 
# (e.g., factor levels, classes, column types) perfectly.
saveRDS(tidy_df, "temp_data/processed_employees.rds")

# To read it back:
restored_df <- readRDS("temp_data/processed_employees.rds")
cat("✅ RDS read successfully. Class of restored object: ", class(restored_df)[1], "\n")


# --- Step 7: Cleanup Temporary Directory ---
# Keep your repository root clean!
unlink("temp_data", recursive = TRUE)
cat("\n🧹 Cleared temporary sandbox directory.")