# Day 12: Datetime Wrangling in R

Welcome to Day 12 of the 30 Days of R challenge! Today, we shift our focus to **Datetime Wrangling** using the `lubridate` package (part of the tidyverse). Working with dates and times can be notoriously tricky due to time zones, leap years, and inconsistent formatting. `lubridate` makes parsing, manipulating, and doing arithmetic with date-time data painless.

## Core Concepts Covered
* **Parsing Date-Times**: Converting character strings into standard date/datetime objects (`ymd`, `mdy`, `ymd_hms`).
* **Component Extraction**: Pulling out specific parts of a date like year, month, day, or day of the week (`year`, `month`, `wday`).
* **Date Arithmetic**: Adding or subtracting periods/durations and calculating time differences.
* **Rounding Dates**: Floor and ceiling functions for dates (`floor_date`, `ceiling_date`).

---

## Functions Reference Table

| Function | Description | Example |
| :--- | :--- | :--- |
| `ymd(string)` | Parses a string in Year-Month-Day order | `ymd("2026-07-19")` |
| `mdy(string)` | Parses a string in Month-Day-Year order | `mdy("July 19, 2026")` |
| `year(date)` / `month(date)` | Extracts the year or numeric month | `year(today())` |
| `wday(date, label=TRUE)` | Extracts the day of the week as text | `wday(today(), label = TRUE)` |
| `floor_date(date, unit)` | Rounds down a date to the nearest unit (e.g., "month") | `floor_date(today(), "month")` |
| `days(x)` / `months(x)` | Adds/subtracts a calendar period of time | `today() + days(7)` |

---

## Exercises
Complete the tasks inside `main.R` to practice:
1. Parsing inconsistent raw text timestamps into valid R date-time objects.
2. Extracting useful features like the day of the week and hour for exploratory data analysis.
3. Calculating durations between timestamps (e.g., handling delivery or processing times).
4. Aggregating data by rounding dates to the beginning of the month.