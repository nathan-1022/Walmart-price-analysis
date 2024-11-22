#### Preamble ####
# Purpose: Verifies the properties and structure of the simulated dataset.
# Author: Zhengjie Zhu
# Date: 14 November 2024
# Contact: zhuzhengjie2020@gmail.com
# License: MIT
# Pre-requisites:
# - The `tidyverse` and `testthat` packages are installed and loaded
# - 00-simulate_data.R have been executed
# Any other information needed? Ascertain you are in the `Wal,art Grocery Price` rproj


#### Workspace setup ####
library(tidyverse)
library(testthat)

simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

library(testthat)

# Test that the dataset has 2000 rows
test_that("dataset has 2000 rows", {
  expect_equal(nrow(simulated_data), 2000)
})

# Test that the 'vendor' column contains "Walmart"
test_that("'vendor' column contains only Walmart", {
  expect_true(all(simulated_data$vendor == "Walmart"))
})

# Test that the 'current_price' and 'old_price' columns are numeric types
test_that("'current_price' and 'old_price' are numeric", {
  expect_type(simulated_data$current_price, "double")
  expect_type(simulated_data$old_price, "double")
})

