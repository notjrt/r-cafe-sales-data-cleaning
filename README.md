# r-cafe-sales-data-cleaning
Data cleaning practice for a fictitious cafe.

## Objective
Clean and standardise the sales data of a fictitious cafe.

## Tools and Libraries Used
* R
* Tidyverse
* Lubridate

## Data Issues Found
* Incorrect column names.
* "ERROR" values in total_spent column.
* Unknown payment methods.
* Incorrect data types.
* Date parsing problems.

# Steps Taken
1. Standardised column names.
    * Converted to lowercase.
    * Replaced spaces with underscores.
2. Converted types.
    * Converted quantity, price_per_unit, and total_spent to numeric.
3. Business logic validation.
    * Recalculated total_spent so that the totals matched the expected values.
4. Parsed dates.
    * Parsed transaction_date using lubridate.
5. Removed invalid values.
    * Replaced "ERROR" and "UNKNOWN" with "NA"
6. Exported clean dataset.
    * Saved clean dataset to clean_cafe_sales.csv

# Final Result
* Final dataset contains 842 rows and 7 columns.
* Columns standardised and validated.
* All dates successfully parsed.
* No missing values in  financial fields.

# Author
Jayden Tan
