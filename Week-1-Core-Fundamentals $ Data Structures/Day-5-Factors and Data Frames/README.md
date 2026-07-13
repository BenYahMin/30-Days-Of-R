# 📊 Day 5: Factors & Data Frames – Tabular Foundations

Welcome to Day 5 of the **30-Days-Of-R** curriculum. Today, we conclude Week 1's deep dive into data objects by merging everything we've learned into R's foundational structures for data science: **Factors** and **Data Frames**.

---

## 🎯 Learning Objectives
* **Map Categorical Variables:** Master how Factors store labels as space-efficient integer codes.
* **Rank Ordinal Data:** Create explicit sequences with custom ordering levels (`ordered = TRUE`).
* **Navigate Heterogeneous Tables:** Conceptualize Data Frames as named lists of equal-length vectors.
* **Implement Data Masks:** Write dynamic logical vectors to extract complex subsets.

---

## 🗺️ Architectural Breakdown

### 1. Factors Under the Hood
In data science, variables are often descriptive text (e.g., `"Low"`, `"Medium"`, `"High"`). To optimize computer memory and improve calculation speed, R does not keep pasting long text entries across thousands of rows. Instead, a **Factor** strips down the characters and assigns them an internal, compact array of **Integers**, mapping those numbers back to a metadata vector known as **Levels**.



### 2. The Anatomy of a Data Frame
A **Data Frame** is arguably the single most important structure in base R. While a matrix forces every cell to share one single data type, a Data Frame allows columns to have different types (e.g., Column 1 is text, Column 2 is numeric, Column 3 is a factor).

The secret architecture? **A Data Frame is technically a Named List where every single item (column vector) is exactly the same length.** Because it is a list beneath the surface, you can access columns quickly using the list-style `$` structural shortcut.

---

## ⚠️ Key Pitfalls & Tricks

### 1. The `stringsAsFactors` Multi-Version Trap
* **The Background:** Historically (pre-R 4.0.0), whenever you created a data frame or loaded a CSV, base R automatically converted every single character string into a Factor. This broke downstream regex manipulation and text analytics code.
* **Modern Paradigm:** Modern R leaves strings as characters by default. Keep control of your data type architecture—import strings cleanly and explicitly mutate targeted columns into factors using `factor()`.

### 2. Slicing Mechanics `[Row, Column]` vs. List Paths `$`
Because a Data Frame is structurally an amalgamation of a Matrix and a List, you can extract records using two different pathways:
* `df$salary` $\rightarrow$ Accesses the table like a list. Returns a single standalone 1D atomic vector.
* `df[ , 3]` $\rightarrow$ Accesses the table like a 2D matrix. Remember to use `drop = FALSE` if you slice out a single row or column and want to preserve the data frame shape!

---

## 🧪 Day 5 Practice Challenge
Verify your comprehension by reviewing the automated script inside `script.R`:
1. **Structural Assembly:** Build an asset inventory table with explicit factor category assignments.
2. **Feature Multiplication:** Create a dynamic computed vector calculation column directly inside the framework table.
3. **Logical Extraction:** Pass a binary evaluation conditional rule (`== 0`) to extract isolated row slices safely.

---

## 🚀 Week 1 Completed!
Congratulations on finishing the Core Fundamentals & Data Structures module!

**Up Next:** We enter **Control Flow & Functional Programming**, starting with writing vectorized conditionals (`ifelse`), logical looping structures, and custom operational scoping pipelines.