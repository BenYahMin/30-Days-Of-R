# Day 7: Introduction to dplyr Basics

Welcome to Day 7! Today, we transition from base R data structures into the powerhouse of data manipulation in R: **dplyr** (part of the `tidyverse`).

## Learning Objectives
* Understand the concept of "Tidy Data" and why `dplyr` is used.
* Master the pipe operator (`%>%` or `|>`) for chaining operations.
* Learn and practice the **5 Core Verbs** of `dplyr`:
  1. `select()`: Extract columns by name.
  2. `filter()`: Subset rows based on conditions.
  3. `mutate()`: Create new variables or modify existing ones.
  4. `arrange()`: Reorder rows.
  5. `summarise()` (with `group_by()`): Reduce multiple values down to a single summary statistic.

## Dataset Used
* `msleep`: An in-built dataset containing sleep times and weights of 83 species of mammals.

## Run the Script
To run the code, make sure you have `dplyr` or `tidyverse` installed:
```R
install.packages("dplyr")