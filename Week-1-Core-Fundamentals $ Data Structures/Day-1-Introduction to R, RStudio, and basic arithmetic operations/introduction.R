# =====================================================================
# PROJECT: 30 Days of R Analytics & Statistical Frameworks
# MODULE:  Week 1 - Core Fundamentals & Data Structures
# DAY 1:   R Language Architecture, Basic Arithmetic, & Variable States
# =====================================================================
# AUTHOR:  Benjamin Kithome
# DATE:    10, July 2026
# =====================================================================

# ---------------------------------------------------------------------
# SECTION 1: ARCHITECTURAL BASICS & CONSOLE EVALUATION
# ---------------------------------------------------------------------
# Since you have R setup lets begin;
# R acts as an interactive evaluation engine (REPL: Read-Eval-Print Loop).
# Statements are parsed sequentially. The '#' character denotes comments,
# These statements are not executed
# They are completely ignored by the R interpreter at runtime.

# When a raw expression is evaluated without assignment, R computes the
# value in volatile execution memory and immediately streams it to stdout
# (the Console), prefixed with an index vector marker '[1]'.

# Let's perform standard scalar calculations:
5 + 3     # Addition
10 - 7    # Subtraction
4 * 3     # Multiplication
20 / 5    # Division

# ---------------------------------------------------------------------
# SECTION 2: OPERATOR PRECEDENCE (BODMAS/PEMDAS)
# ---------------------------------------------------------------------
# R evaluates mathematical operations following strict precedence rules:
# 1. Parentheses ()
# 2. Exponentiation (^)
# 3. Multiplication (*) and Division (/)
# 4. Addition (+) and Subtraction (-)

# Case A: Multiplication evaluated first by default language rules
precedence_default <- 5 + 3 * 2
print(precedence_default)  # Expected output: 11

# Case B: Parentheses override standard operational priority
precedence_override <- (5 + 3) * 2
print(precedence_override) # Expected output: 16

# ---------------------------------------------------------------------
# SECTION 3: EXPONENTIATION, MODULO, AND INTEGER DIVISION
# ---------------------------------------------------------------------
# Beyond common arithmetic, R offers advanced mathematical operators 
# highly relevant to statistical sorting, indexing, and loops.

# 1. Exponentiation: Raising a base number to a specific power
base_cubed <- 2^3          # 2 multiplied by itself 3 times (2 * 2 * 2)
print(base_cubed)          # Expected output: 8

# 2. Modulo (%%): Computes the REMAINDER left over after integer division.
# Crucial for checking parity (even/odd) or cyclical index timing.
remainder_val <- 17 %% 4   # 4 goes into 17 exactly 4 times, leaving a remainder of 1
print(remainder_val)       # Expected output: 1

# 3. Integer Division (%/%): Computes the clean quotient, discarding the remainder.
quotient_val <- 17 %/% 4   # Discards the fractional part (.25)
print(quotient_val)        # Expected output: 4

# ---------------------------------------------------------------------
# SECTION 4: VARIABLE ASSIGNMENT & WORKSPACE MEMORY MANAGEMENT
# ---------------------------------------------------------------------
# To retain data objects for subsequent calculations, they must be bound 
# to a symbolic reference within the global environment workspace memory (RAM).

# The standard assignment operator in R is the left-arrow binary operator (<-).
# Avoid using '=' for variable assignment, as '=' is idiomatically reserved
# for passing named arguments inside function calls.

x <- 10  # Allocates numeric object 10 into symbol 'x'
y <- 4   # Allocates numeric object 4 into symbol 'y'

# Variables can now be manipulated dynamically by referencing their symbols:
total_sum  <- x + y
difference <- x - y

# Printing variable contents to the console:
# Method A: Explicit execution via the print() function
print(total_sum)   # Expected output: 14

# Method B: Implicit printing by calling the variable identifier alone
difference         # Expected output: 6

# WARNING ON CASE SENSITIVITY: 
# R is strictly case-sensitive. The following identifiers point to 
# entirely different memory blocks:
marketData <- 500
marketdata <- 1200

print(marketData)  # Will output 500
print(marketdata)  # Will output 1200

# ---------------------------------------------------------------------
# SECTION 5: DAY 1 CHALLENGE - EXECUTING A FINANCIAL COMPOUND INTEREST MODEL
# ---------------------------------------------------------------------
# OBJECTIVE: Given a cash principal, compound interest rate, and a fixed
# investment horizon, compute the terminal balance of the portfolio.
# Formula: Balance = Principal * (1 + Rate)^Years

# Step 1: Initialize structural constant inputs
principal <- 10000   # Initial capital commitment (e.g., $10,000 USD)
rate      <- 0.05    # Annual compounding growth factor (5.00% continuous)
years     <- 3       # Total holding duration of assets (3-year horizon)

# Step 2: Compute terminal state applying mathematical order of operations
# The expression inside parentheses (1 + rate) runs first.
# The result is raised to the power of 'years' next.
# Finally, that combined structural matrix is multiplied by the 'principal'.
final_balance <- principal * (1 + rate)^years

# Step 3: Stream calculated state to the console interface
print("--- DAY 1 CAPSTONE PORTFOLIO CALCULATION COMPLETE ---")
print(final_balance) # Expected output: 11576.25

# ---------------------------------------------------------------------
# END OF SCRIPT - Run line by line using [Ctrl + Enter] or [Cmd + Return]
# =====================================================================