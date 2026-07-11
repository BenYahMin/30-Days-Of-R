# Day 3: Multi-Dimensional Architectures (Matrices and Arrays)

Welcome to Day 3 of the **30-Days-Of-R** curriculum. Today, we scale up from 1D atomic vectors to multi-dimensional layouts while keeping R's core data rules completely intact.

## Learning Objectives
* Understand how dimensions (`dim`) transform atomic vectors into Matrices and Arrays.
* Differentiate between column-wise and row-wise generation.
* Master coordinate indexing (`[row, col]`) and how to prevent matrix structure collapse (`drop = FALSE`).
* Distinctly identify Element-Wise Mathematics (`*`) vs. Matrix Linear Algebra (`%*%`).

---

## Architectural Breakdown

### The Homogeneity Rule Continued
Just like vectors, **matrices and arrays are atomic**. Every element must share the exact same primitive data type. Combining integers, logicals, and character strings inside a matrix will trigger the exact same coercion hierarchy established on Day 2:
$$\text{Logical} \rightarrow \text{Integer} \rightarrow \text{Numeric} \rightarrow \text{Character}$$

### Dimension Anatomy
A matrix is essentially an atomic vector under the hood, but with a `dim` attribute containing a vector of length 2 (`c(rows, columns)`). 

* **Matrix (2D):** Syntaxes utilize `[row, column]`
* **Array (nD):** Extends parameters past two dimensions `[row, column, layer, ...]`

---

## Key Pitfalls & Tricks

### 1. Matrix Multiplication vs. Element-Wise Math
* Use `*` to multiply matching positions across two matrices identically.
* Use `%*%` to execute dot-products/true algebraic matrix cross-multiplication.

### 2. Dimension Dropping
When you extract a single row or single column from a matrix (e.g., `mat[1, ]`), R defaults to simplifying the output into a basic 1D atomic vector. To preserve the matrix architecture during slicing, apply the `drop = FALSE` argument:
```R
# Drops structure, returns vector
vector_output <- mat[1, ] 

# Retains structure, returns a 1xN matrix
matrix_output <- mat[1, , drop = FALSE]