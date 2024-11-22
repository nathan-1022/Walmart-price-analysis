#### Preamble ####
# Purpose: Simulates data on Canadian groceries from Walmart.
# Author: Zhengjie Zhu
# Date: 14 November 2024
# Contact: zhuzhengjie2020@gmail.com
# License: MIT
# Pre-requisites: The `tidyverse` package has been installed
# Any other information needed? Ascertain you are in the `Walmart Grocery Price` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(2024)

#### Simulate data ####

# Generate simulated data
simulated_data <- tibble(
  vendor = rep("Walmart", 2000), 
  current_price = round(runif(2000, 0, 500), 3),  # Simulated current prices 
  old_price = round(runif(2000, 0, 1000), 3)  # Simulated old prices 
)

write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
