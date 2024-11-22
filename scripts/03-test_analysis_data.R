#### Preamble ####
# Purpose: Verifies the properties and structure of the analysis dataset.
# Author: Zhengjie Zhu
# Date: 14 November 2024
# Contact: zhuzhengjie2020@gmail.com
# License: MIT
# Pre-requisites:
# - The `tidyverse` and `testthat` packages are installed and loaded
# - 02-clean_data.sql must have been executed in DB Browser for SQLite
# - Exported the analysis dataset as .csv from DB Browser for SQLite and is in the "data/02-analysis_data" folder
# Any other information needed? Ascertain you are in the `Walmart Grocery Price` rproj

#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")

# Test that the dataset has 163801 rows
test_that("dataset has 163801 rows", {
  expect_equal(nrow(analysis_data), 163801)
})

# Test that the 'vendor' column contains "Walmart"
test_that("'vendor' column contains only Walmart", {
  expect_true(all(analysis_data$vendor == "Walmart"))
})

# Test that the 'current_price' and 'old_price' columns are numeric types
test_that("'current_price' and 'old_price' are numeric", {
  expect_type(analysis_data$current_price, "double")
  expect_type(analysis_data$old_price, "double")
})
