# ==============================================================================
# DELTAFLOW RESEARCH // 30 DAYS OF R
# MASTER SOLUTIONS: WEEK 1 (CORE FUNDAMENTALS)
# ==============================================================================

# --- DAY 3: VECTOR MATRIX OPERATION CHALLENGE ---
# Task: Create an atomic vector of pricing anomalies and filter out extremes.
anomalies <- c(14.2, 18.5, 99.1, 12.0, 15.3, 104.2)
clean_anomalies <- anomalies[anomalies < 90.0]
print("Day 3 Solution Vector:")
print(clean_anomalies)


# --- DAY 6: DATA FRAME SUBSETTING ---
# Task: Instantiating a structured data frame from raw vectors and calculating metrics.
portfolio_matrix <- data.frame(
  Asset = c("BTC", "ETH", "SOL", "ADA"),
  Allocation = c(0.40, 0.35, 0.15, 0.10),
  Risk_Score = c(2, 3, 5, 4)
)

# Extract assets where risk exceeds structural baseline (3)
high_risk_assets <- portfolio_matrix[portfolio_matrix$Risk_Score > 3, ]
print("Day 6 Solution Matrix Subset:")
print(high_risk_assets)