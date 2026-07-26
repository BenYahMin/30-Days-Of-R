# Day 18: Exploratory Data Analysis (EDA) Project

Welcome to Day 18 of the 30 Days of R challenge! Today is a milestone day where we combine everything we've learned over the last three weeks—data cleaning, reshaping, relational joins, datetime manipulation, and advanced `ggplot2` visualization—into a project **Exploratory Data Analysis (EDA) Project**.

## Core Concepts Covered
* **The EDA Workflow**: Formulating questions, data profiling, identifying missingness, and looking for structural anomalies.
* **Feature Engineering Integration**: Creating logical flags, extracting date parts, and aggregating variables on the fly.
* **Visual Hypothesis Testing**: Moving from simple univariate distributions to multi-variable faceted correlations to explain data behavior.
* **Data Storytelling**: Formatting plots systematically so they stand alone as a narrative.

---

## The EDA Framework Blueprint

| Phase | Technical Approach | Key R Functions |
| :--- | :--- | :--- |
| **1. Structure Discovery** | Profile rows, columns, and variable classes | `glimpse()`, `summary()` |
| **2. Target Isolation** | Handle data tidying, missing values, and formatting strings/dates | `str_trim()`, `ymd()`, `replace_na()` |
| **3. Distribution Scanning** | Check the frequency and spread of metrics across groups | `geom_histogram()`, `geom_boxplot()` |
| **4. Structural Relationships** | Uncover patterns and variations via multi-layered visuals | `geom_point()`, `facet_wrap()`, `labs()` |

---

## Project Objective
Complete the tasks inside `main.R` to conduct a mini-EDA report on a mock e-commerce and marketing dataset to answer:
1. Which product segments are driving maximum revenue vs. product returns?
2. How do marketing channel investments correlate with customer engagement across seasons?
3. What unexpected operational insights drop out when factoring in timeline bottlenecks?