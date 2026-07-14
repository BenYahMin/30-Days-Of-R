# Day 6: Data Ingestion (Reading and Writing Data)

Welcome to Day 6 of the **30-Days-Of-R** challenge! Now that we understand R's core data structures (Vectors, Matrices, Lists, Factors, and Data Frames), it's time to learn how to import external data into R and export our processed results back out. 

Data ingestion is the gateway to real-world data analysis.

---

## 📚 Core Learning Objectives

By the end of today, you will know how to:
1. Import tabular text files (CSV, TSV) using **Base R** and the modern **tidyverse (`readr`)** package.
2. Read Excel spreadsheets using the **`readxl`** package.
3. Handle common ingestion hurdles (missing values, header mismatches, skipping metadata rows).
4. Export data structures back to local files (CSV, RDS, and RData).

---

## 📦 Methods Overview

| Ingestion Task | Base R Method | Modern/Fast Package | Output Object |
| :--- | :--- | :--- | :--- |
| **Read CSV** | `read.csv()` | `readr::read_csv()` | Data Frame / Tibble |
| **Read Tab-Delimited** | `read.delim()` | `readr::read_tsv()` | Data Frame / Tibble |
| **Read Excel** | *N/A (Requires Package)* | `readxl::read_excel()` | Tibble |
| **Write CSV** | `write.csv()` | `readr::write_csv()` | File on disk |
| **Save R-Specific Binary** | `saveRDS()` | *N/A* | `.rds` file |

---

## 🧠 Key Concepts & Best Practices

### 1. Base R vs. `readr`
While Base R functions (`read.csv`) are always available, the `readr` package (part of the Tidyverse) offers significant advantages:
* **Speed:** Up to 10x faster for large datasets.
* **Smart Parsing:** Automatically guesses column types without converting strings to factors by default (a historically annoying behavior of older Base R).
* **Progress Bars:** Highly helpful for monitoring large file imports.

### 2. Working Directory Awareness
Always know where R is looking. You can check and set your working directory using:
```R
getwd() # Get current directory
# setwd("path/to/folder") # Set new directory (Use with caution in collaborative scripts!)