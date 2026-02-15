# ============================
# Script: 02_clean_data.R
# Purpose: Clean cafe sales data
# Author: Jayden Tan
# Date: February 2026
# ============================

library(tidyverse) # Data manipulation tools
library(lubridate) # Data parsing (ymd, dmy, etc)

# Stop script if file path is wrong or the file does not exist
stopifnot(file.exists("data/dirty_cafe_sales.csv"))

# Load the raw dataset
df <- read_csv("data/dirty_cafe_sales.csv")

df <- df %>%
  # 1. Standardise column names:
  #    - to(lower) makes names lowercase
  #    - str_replace_all removes spaces and replaces it with an underscore
  rename_with(~ str_replace_all(tolower(.), " ", "_")) %>%
  
  mutate(
    # 2. Fix bad values
    #    - "ERROR" becomes NA
    #    - "UNKNOWN" becomes NA
    total_spent = na_if(total_spent, "ERROR"),
    payment_method = na_if(payment_method, "UNKNOWN"),
    location = na_if(location, "UNKNOWN"),
    
    # 3. Convert to numeric columns stored as text into real numbers
    quantity = as.numeric(quantity),
    price_per_unit = as.numeric(price_per_unit),
    total_spent = as.numeric(total_spent),
    
    # 4. Parse dates
    transaction_date = dmy(transaction_date)
  ) %>%
  
  mutate(
    # 5. Recalculate total spent (business logic)
    #    - Ensures total_spent is consistent with quantity * price_per_unit
    total_spent = quantity * price_per_unit
  )

# Save the cleaned dataset into a csv 
write_csv(df, "data/clean_cafe_sales.csv")