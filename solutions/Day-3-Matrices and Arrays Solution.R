# ------------------------------------------------------------------------------
# 5. Day 3 Practice Challenge Solution
# ------------------------------------------------------------------------------
print("--- 5. Challenge Verification ---")

# Step 1: 4x4 matrix containing 1:16 filled row-wise
challenge_matrix <- matrix(1:16, nrow = 4, ncol = 4, byrow = TRUE)

# Step 2: Extract the inner 2x2 sub-matrix (rows 2-3, cols 2-3)
inner_matrix <- challenge_matrix[2:3, 2:3]
print("Challenge Step 2 - Inner 2x2 Matrix:")
print(inner_matrix)

# Step 3: Multiply by an identity matrix using %*%
identity_matrix <- diag(2) # Generates a 2x2 Identity Matrix
challenge_result <- inner_matrix %*% identity_matrix
print("Challenge Step 3 - Multiplied by Identity Matrix:")
print(challenge_result)
# Notice our result is the same as the inner slice
