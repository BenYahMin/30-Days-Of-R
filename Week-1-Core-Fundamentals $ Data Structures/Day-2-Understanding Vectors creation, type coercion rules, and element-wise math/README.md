# Day 2: Vector Architecture, Type Coercion, and Element-Wise Mathematics

## Overview
Welcome to Day 2 of the 30 Days of R curriculum. Today's focus centers on **Atomic Vectors**, which form the bedrock of all data tracking, manipulation, and statistical programming inside the R language engine. In R, single values (scalars) do not exist independently; they are simply represented as vectors containing a single element (length = 1).

---

## Core Learning Objectives
By the completion of this module, you will master:
1. **Vector Construction:** Utilizing the collection function `c()` to build contiguous arrays.
2. **Data Homogeneity:** Navigating the strict memory rules governing atomic data types.
3. **Implicit & Explicit Coercion:** Understanding the hierarchy R uses to resolve mixed data types.
4. **Vectorized Operations:** Executing parallel mathematical transformations without explicit loops.
5. **Recycling Mechanics:** Predicting engine behaviors when performing asymmetric vector calculations.

---

## Technical Concept Breakdown

### 1. Vector Types
R categorizes basic atomic arrays into four distinct data structures:
* **Double (Numeric):** Floating-point values for continuous statistical metrics.
* **Integer:** Whole numbers denoted explicitly with an `L` suffix (e.g., `10L`).
* **Character:** Textual data arrays and categorical string constants.
* **Logical:** Boolean states holding strictly `TRUE` or `FALSE` valuations.

### 2. The Type Coercion Hierarchy
When data types are mixed inside a single vector, R silently converts the elements to the least restrictive format to maintain structural uniformity. 

The coercion chain operates as follows:

$$\text{Character} \longrightarrow \text{Numeric (Double)} \longrightarrow \text{Integer} \longrightarrow \text{Logical}$$



### 3. Element-Wise Transformations
Vector operations in R are fully optimized down to compiled C/Fortran layers under the hood. When calculating with two vectors of identical length, calculations map directly to matching indices:

```text
Vector A: [ 100, 250, 400 ]
             +    +    +
Vector B: [ 150, 200, 450 ]
             =    =    =
Result:   [ 250, 450, 850 ]