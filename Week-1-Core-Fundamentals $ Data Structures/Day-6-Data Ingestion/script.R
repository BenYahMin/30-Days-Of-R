# ==============================================================================
# Day 6: Data Ingestion & Exporting with Built-in Real Data
# Dataset: Motor Trend Car Road Tests (mtcars)
# Author: Benjamin Kithome
# ==============================================================================

# --- Step 1: Prepare Local Workspace & Export Base Dataset ---
dir.create("temp_data", showWarnings = FALSE)

# Load built-in real-world dataset
data("mtcars")

# Convert row names (car models) into an explicit column for clean tabular storage
mtcars_raw <- mtcars
mtcars_raw$car_model <- rownames(mtcars)
rownames(mtcars_raw) <- NULL

# Reorder so 'car_model' is the first column
mtcars_raw <- mtcars_raw[, c("car_model", "mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")]

# Introduce realistic edge-case values for practice
mtcars_raw[3, "hp"] <- "N/A"        # Missing value stored as string
mtcars_raw[7, "wt"] <- ""           # Blank space missing value

# Export to CSV to simulate acquiring an external dataset
write.csv(mtcars_raw, "temp_data/mtcars_raw.csv", row.names = FALSE)
cat("✅ Real-world 'mtcars' dataset prepared and saved to 'temp_data/mtcars_raw.csv'\n")


# --- Step 2: Ingestion using Base R ---
cat("\n--- Loading data with Base R ---\n")

# Base R read with custom NA string mapping
base_df <- read.csv("temp_data/mtcars_raw.csv", na.strings = c("NA", "N/A", ""))

# Inspect structure & summary
head(base_df)
str(base_df)


# --- Step 3: Ingestion using tidyverse ('readr') ---
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
library(readr)

cat("\n--- Loading data with readr ---\n")

# read_csv automatically handles column typing and displays parsing specs
tidy_df <- read_csv("temp_data/mtcars_raw.csv", na = c("NA", "N/A", ""))

# View the tibble output
print(tidy_df)


# --- Step 4: Data Processing & Feature Engineering ---
# Convert engine transmission (am: 0 = Automatic, 1 = Manual) to labeled factors
tidy_df$transmission <- factor(tidy_df$am, levels = c(0, 1), labels = c("Automatic", "Manual"))

# Filter high fuel-efficiency vehicles (MPG > 20)
efficient_cars <- tidy_df[!is.na(tidy_df$mpg) & tidy_df$mpg > 20, ]


# --- Step 5: Exporting Data Across Formats ---
cat("\n--- Exporting Processed Data ---\n")

# 1. Export cleaned data to CSV (readr)
write_csv(efficient_cars, "temp_data/efficient_cars.csv")

# 2. Export to RDS (Preserves R-specific data types like factors)
saveRDS(efficient_cars, "temp_data/efficient_cars.rds")

# 3. Read back RDS to confirm integrity
restored_df <- readRDS("temp_data/efficient_cars.rds")
cat("✅ RDS restored successfully. Class:", class(restored_df)[1], "\n")
cat("   Factor levels preserved for 'transmission':", levels(restored_df$transmission), "\n")


# --- Step 6: Cleanup Workspace ---
unlink("temp_data", recursive = TRUE)
cat("\n🧹 Directory 'temp_data' cleaned successfully.\n")

