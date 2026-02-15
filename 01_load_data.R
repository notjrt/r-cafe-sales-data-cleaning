# ============================
# Script: 01_load_data.R
# Purpose: Data observation
# Author: Jayden Tan
# Date: February 2026
# ============================


library(tidyverse)

# Read the raw (dirty) dataset from the /data folder into a tibble.
df_raw <- read_csv("data/dirty_cafe_sales.csv")

# Structure check: shows column names, types, and example values.
glimpse(df_raw)

# Summary for each column
summary(df_raw)
