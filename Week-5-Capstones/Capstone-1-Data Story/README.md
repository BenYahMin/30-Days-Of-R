# Week 5, Capstone 1: Telling a Data Story in R

Welcome to Week 5 of the 30 Days of R challenge! This week is dedicated to comprehensive Capstone Projects. Today, we focus on **Capstone 1: Data Story**, where we move beyond isolated technical scripts to construct an end-to-end data narrative. 

A great data story combines robust data cleaning, exploratory parsing, statistical modeling, and highly customized visuals to reveal an impactful, actionable insight.

## Core Milestones Covered
* **Advanced Data Tidying**: Parsing messy raw logs with embedded JSON-like or delimited features.
* **Statistical Validation**: Applying multiple regression models to confirm observing patterns aren't artifacts of random chance.
* **Polished Storytelling Layouts**: Configuring advanced annotations, themes, and labels to turn raw plots into presentation-ready assets.

---

## The Data Story Workflow Blueprint

| Stage | Objective | R Package / Tool |
| :--- | :--- | :--- |
| **1. Aggregation & Parsing** | Merge cross-sectional profiles and parse complex strings | `dplyr`, `stringr`, `lubridate` |
| **2. Confounding Control** | Evaluate baseline relationships while accounting for secondary variables | `lm()` |
| **3. Narrative Design** | Direct the audience's eye using explicit text pointers and clean scales | `ggplot2::annotate()`, `theme_minimal()` |

---

## Capstone Objective
Complete the tasks inside `main.R` to analyze a multi-channel customer engagement dataset. Your goals are to:
1. Standardize and clean inconsistent channel tagging structures and transaction dates.
2. Fit a regression model evaluating customer spending patterns across regions while controlling for account tenure.
3. Generate a highly polished visualization highlighting a core strategic finding with clear annotations.