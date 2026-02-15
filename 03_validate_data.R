# ============================
# Script: 03_validate_data.R
# Purpose: Quality control
# Author: Jayden Tan
# Date: February 2026
# ============================

library(tidyverse)

# Loads the cleaned dataset from 02_clean_data
df_clean <- read_csv("data/clean_cafe_sales.csv")

# Overview of the cleaned dataset
summary(df_clean)

# Counts the total missing values across the whole table
sum(is.na(df_clean))

# Validation metrics
# - number of rows
# - total revenue (sum of total_spent)
df_clean %>%
  summarise(
    rows = n(),
    total_revenue = sum(total_spent, na.rm = TRUE)
  )
