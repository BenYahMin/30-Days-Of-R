# =====================================================================
# PROJECT: 30 Days of R Analytics & Statistical Frameworks
# MODULE:  Week 1 - Core Fundamentals & Data Structures
# DAY 2:   Vector Architecture, Explicit Coercion, & Element-Wise Math
# =====================================================================
# AUTHOR:  Benjamin Mukungi
# DATE:    July 2026
# =====================================================================

# ---------------------------------------------------------------------
# SECTION 1: ATOMIC VECTOR INITIALIZATION VIA CONCATENATION `c()`
# ---------------------------------------------------------------------
# In R, a vector is a contiguous block of memory containing homogeneous data.
# R does not possess a true scalar type; a single isolated number or string 
# is structurally an atomic vector of length 1. We use the c() function 
# (combine/concatenate) to instantiate vectors of arbitrary lengths.

# 1. Numeric Vector (Double / Real Floating-Point Precision)
# Standard structure for fractional values, asset rates, and percentages.
market_prices <- c(102.50, 104.25, 101.80, 105.00)
print(market_prices)
typeof(market_prices)    # Returns "double"

# 2. Integer Vector (Explicit Whole Numbers)
# Appending the 'L' suffix forces memory optimization, allocating integers 
# rather than doubles. Vital for precise indexing and step iterations.
sample_counts <- c(10L, 15L, 22L, 8L)
print(sample_counts)
typeof(sample_counts)    # Returns "integer"

# 3. Character Vector (Strings / Textual Arrays)
# Created by enclosing items in matching single or double quotation marks.
ticker_symbols <- c("BTC", "ETH", "SOL", "ADA")
print(ticker_symbols)
typeof(ticker_symbols)   # Returns "character"

# 4. Logical Vector (Boolean Flags)
# Holds structural evaluations: TRUE or FALSE. Fully case-sensitive.
# Can be abbreviated as T or F, but explicit spelling is best practice.
is_volatile <- c(TRUE, FALSE, TRUE, TRUE)
print(is_volatile)
typeof(is_volatile)      # Returns "logical"

# ---------------------------------------------------------------------
# SECTION 2: IMPLICIT AND EXPLICIT TYPE COERCION RULES
# ---------------------------------------------------------------------
# CRITICAL RULE: An R vector MUST maintain data homogeneity (same data type).
# If mismatched types are forced together, R automatically applies implicit 
# coercion down a structural hierarchy to prevent memory faults:
# Hierarchy: Character -> Double -> Integer -> Logical (Softest to Strictest)

# Case A: Mixing Logical (Strictest) and Numeric (Double)
# R coerces boolean elements to numerical values: TRUE maps to 1, FALSE to 0.
coerced_numeric <- c(TRUE, FALSE, 5.5)
print(coerced_numeric)   # Output: [1] 1.0 0.0 5.5
typeof(coerced_numeric)  # "double"

# Case B: Mixing Numeric (Double) and Character (Softest)
# R forces every single element into a character string layout.
coerced_character <- c(10.5, "Bitcoin", 44L)
print(coerced_character) # Output: [1] "10.5" "Bitcoin" "44"
typeof(coerced_character) # "character"

# --- Explicit Coercion Utility Functions ---
# Developers can manually cast vector data states using standard 'as.*' functions:
base_logical <- c(TRUE, FALSE, TRUE)
cast_to_numeric <- as.numeric(base_logical) # Converts to: c(1, 0, 1)
print(cast_to_numeric)

# ---------------------------------------------------------------------
# SECTION 3: VECTORIZED MATHEMATICS & MEMORY RECYCLING
# ---------------------------------------------------------------------
# R performs mathematical calculations natively in parallel blocks across 
# array structures. Arithmetic operations are executed element-by-element, 
# dropping the necessity for slow, low-level 'for' loops.

portfolio_a <- c(100, 250, 400)
portfolio_b <- c(150, 200, 450)

# 1. Element-Wise Linear Addition
# Adds position 1 to position 1, position 2 to position 2, and so forth.
combined_portfolio <- portfolio_a + portfolio_b
print(combined_portfolio) # Output: [1] 250 450 850

# 2. Scalar Vector Multiplications
# When multiplied by a singular value (scalar), R automatically expands the 
# scalar across every single element inside the targeted array structure.
yield_factor <- 1.10
portfolio_growth <- portfolio_a * yield_factor
print(portfolio_growth)   # Output: [1] 110 275 440

# --- The Vector Recycling Principle ---
# When evaluating math across two vectors of asymmetrical lengths, R will 
# cyclically repeat ("recycle") the elements of the shorter array sequence.
short_vector <- c(0.5, 2.0)
long_vector  <- c(10, 20, 30, 40)

# The 'short_vector' expands under the hood to match length: c(0.5, 2.0, 0.5, 2.0)
recycled_output <- long_vector * short_vector
print(recycled_output)    # Output: [1]  5 40 15 80

# ---------------------------------------------------------------------
# SECTION 4: DAY 2 CAPSTONE CHALLENGE - CRYPTO ASSET WALLET PROFILE
# ---------------------------------------------------------------------
# OBJECTIVE: Calculate the weighted valuation metrics of a specific digital 
# multi-token wallet using vectorized array pipelines.

# Step 1: Initialize structural asset vectors
assets         <- c("BTC", "ETH", "LINK", "SOL") # Character vector identifiers
quantity       <- c(2.5, 10.0, 150.0, 35.0)      # Double precision token volume
current_prices <- c(60000, 3000, 15, 140)        # Current market valuation index

# Step 2: Compute vectorized position holdings
# Multiplies quantities by prices element-by-element in parallel execution memory.
portfolio_values <- quantity * current_prices

print("--- INDIVIDUAL ASSET VALUES ---")
print(portfolio_values) 
# Expected Output Breakdown:
# BTC:  2.5   * 60000 = 150000
# ETH:  10.0  * 3000  = 30000
# LINK: 150.0 * 15    = 2250
# SOL:  35.0  * 140   = 4900

# Step 3: Aggregate overall portfolio value using the structural sum() tool
total_net_worth <- sum(portfolio_values)

print("--- DAY 2 CAPSTONE METRIC PROCESSING COMPLETE ---")
print(paste("Total Asset Net Worth: $", total_net_worth))
# Expected Output: [1] "Total Asset Net Worth: $ 187150"

# =====================================================================
# END OF DAY 2 SCRIPT - Execution Verified
# =====================================================================