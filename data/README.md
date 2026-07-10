\# 💾 Centralized Data Matrix



Welcome to the data core. This directory holds the data frames used for the projects, visualization practices, and statistical modeling challenges.



\## 📊 Datasets Catalog



\### 1. `raw-sales-data.csv`

\* \*\*Format:\*\* Comma-Separated Values (Flat text)

\* \*\*Usage:\*\* Weeks 1 \& 2 (Data Importing, Cleaning, `dplyr` functions)

\* \*\*Schema:\*\*

&#x20; \* `Transaction\_ID`: Unique identification string

&#x20; \* `Date`: Raw string character date (`YYYY-MM-DD` mixed with `MM/DD/YYYY`)

&#x20; \* `Customer\_Segment`: Categorical variable (`Corporate`, `Consumer`, `Home Office`)

&#x20; \* `Revenue\_USD`: Numeric metric containing intentional `NA` values for cleaning practice



\### 2. `global-weather.rds`

\* \*\*Format:\*\* R-native serialized dataframe object

\* \*\*Usage:\*\* Week 3 (`ggplot2` distribution charts and multi-axis facets)

\* \*\*Special Note:\*\* Read this file using `readRDS()` instead of standard text parsers to preserve factor levels.

