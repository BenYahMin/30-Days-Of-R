# Day 11: Text Manipulation in R

Welcome to Day 11 of the 30 Days of R challenge! Today, we focus on **Text Manipulation** using the `stringr` package (part of the tidyverse). Mastering string handling is essential for cleaning messy real-world data, extracting specific patterns, and preparing text for analysis.

## Core Concepts Covered
* **String Basics**: Measuring length (`str_length`), combining strings (`str_c`), and extracting substrings (`str_sub`).
* **Pattern Matching**: Detecting patterns (`str_detect`) and counting occurrences (`str_count`).
* **Text Modification**: Changing case (`str_to_upper`, `str_to_lower`, `str_to_title`) and trimming whitespace (`str_trim`).
* **Substitution**: Replacing patterns within strings (`str_replace`, `str_replace_all`).
* **Splitting**: Breaking strings apart into pieces (`str_split`).

---

## Functions Reference Table

| Function | Description | Example |
| :--- | :--- | :--- |
| `str_length(string)` | Counts the number of characters | `str_length("R")` $\rightarrow$ `1` |
| `str_c(..., sep)` | Concatenates multiple strings together | `str_c("R", "programming", sep = " ")` |
| `str_sub(string, start, end)` | Extracts substrings by character position | `str_sub("Analytics", 1, 4)` $\rightarrow$ `"Anal"` |
| `str_detect(string, pattern)` | Returns `TRUE`/`FALSE` if a pattern is found | `str_detect("Data Science", "Data")` |
| `str_replace(string, pattern, replacement)` | Replaces the first match of a pattern | `str_replace("Version 1.1", "1.1", "2.0")` |
| `str_split(string, pattern)` | Splits a string into a list of substrings | `str_split("A,B,C", ",")` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Cleaning inconsistent user-submitted text data (removing whitespace, standardizing case).
2. Extracting specific codes/ID patterns from a combined string column.
3. Replacing outdated product codes with updated naming conventions.