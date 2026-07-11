# ==============================================================================
# Day 3: Multi-Dimensional Architectures (Matrices and Arrays)
# Course: 30-Days-Of-R
# Description: Mastering 2D matrices, nD arrays, dimension attributes,
#              indexing mechanics, and matrix arithmetic.
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. Architectural Core Concepts & Creation
# ------------------------------------------------------------------------------
print("--- 1. Creating Matrices ---")

# Method A: Default column-wise filling (R's standard behavior)
matrix_col <- matrix(1:6, nrow = 2, ncol = 3)
print("Column-wise Matrix (Default):")
print(matrix_col)

# Method B: Row-wise filling using byrow = TRUE
matrix_row <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE)
print("Row-wise Matrix:")
print(matrix_row)

# Method C: Vector Binding (Combining existing vectors)
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)

row_bound <- rbind(v1, v2)
col_bound <- cbind(v1, v2)

print("Row-bound (rbind):")
print(row_bound)
print("Column-bound (cbind):")
print(col_bound)

# The Homogeneity Rule (Type Coercion in Matrix)
mixed_matrix <- matrix(c(1, 2, "three", 4), nrow = 2)
print("Coerced Matrix due to character string:")
print(mixed_matrix) # Everything becomes character


# ------------------------------------------------------------------------------
# 2. Indexing, Slicing, and Dimension Dropping
# ------------------------------------------------------------------------------
print("--- 2. Indexing & Slicing [row, column] ---")

mat_demo <- matrix(10:18, nrow = 3, byrow = TRUE)
print("Target Matrix:")
print(mat_demo)

# Extract specific element (Row 2, Column 3)
element <- mat_demo[2, 3]
print(paste("Element at [2,3]:", element))

# Extracting whole structures (leaving a blank dimension)
row_vector <- mat_demo[1, ]
print("Row 1 extracted (Note: Coerced to 1D Vector):")
print(row_vector)
print(paste("Class of extracted row:", class(row_vector)))

# Prevent Dimension Dropping using drop = FALSE
row_matrix <- mat_demo[1, , drop = FALSE]
print("Row 1 extracted with drop = FALSE (Retains Matrix structure):")
print(row_matrix)
print(paste("Class with drop = FALSE:", class(row_matrix)))

# Sub-matrix slicing
sub_mat <- mat_demo[1:2, 2:3]
print("Sliced 2x2 Sub-matrix:")
print(sub_mat)


# ------------------------------------------------------------------------------
# 3. Matrix Math vs. Linear Algebra Operations
# ------------------------------------------------------------------------------
print("--- 3. Matrix Operations ---")

A <- matrix(c(1, 2, 3, 4), nrow = 2)
B <- matrix(c(5, 6, 7, 8), nrow = 2)

# Element-wise multiplication
elem_mult <- A * B
print("Element-wise Multiplication (A * B):")
print(elem_mult)

# True Matrix Multiplication (Linear Algebra)
matrix_mult <- A %*% B
print("True Matrix Multiplication (A %*% B):")
print(matrix_mult)

# Transposition
transposed_A <- t(A)
print("Transposed Matrix A:")
print(transposed_A)


# ------------------------------------------------------------------------------
# 4. Beyond 2D: n-Dimensional Arrays
# ------------------------------------------------------------------------------
print("--- 4. n-Dimensional Arrays ---")

# Create a 3D array: dim = c(rows, columns, layers)
my_array <- array(1:12, dim = c(2, 3, 2))
print("3D Array (2 Rows, 3 Columns, 2 Layers):")
print(my_array)

# Indexing an Array: [row, column, layer]
array_element <- my_array[1, 2, 2]
print(paste("Element at [1, 2, 2]:", array_element))


# ------------------------------------------------------------------------------
# 5. Day 3 Practice Challenge Solutions
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