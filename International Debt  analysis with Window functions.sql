/* Analysis of the International debt using Window  and Aggregate Functions*/
-- Overview of the table
SELECT * FROM internationaldebt.international_debt;
-- Window Functions
SELECT country_name,debt,indicator_name,
SUM(debt) OVER(PARTITION BY country_name ORDER BY debt DESC ) AS cumulative_debt
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
MAX(debt) OVER(PARTITION BY country_name ORDER BY debt DESC ) AS max_debt
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
MIN(debt) OVER(PARTITION BY country_name ORDER BY debt DESC ) AS min_debt
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
AVG(debt) OVER(PARTITION BY country_name ORDER BY debt DESC ) AS avg_debt
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
COUNT(debt) OVER(PARTITION BY country_name ORDER BY debt DESC ) AS count_of_debt
FROM `internationaldebt`.`international_debt`;

-- Window Functions

SELECT country_name,debt,indicator_name,
ROW_NUMBER() OVER(PARTITION BY country_name ORDER BY debt DESC ) AS row_num
FROM `internationaldebt`.`international_debt`;
  
SELECT country_name,debt,indicator_name,
RANK() OVER(PARTITION BY country_name ORDER BY debt DESC ) AS rank_num
FROM `internationaldebt`.`international_debt`;

 WITH debts AS (SELECT country_name,debt,indicator_name,
RANK() OVER(PARTITION BY country_name ORDER BY debt DESC ) AS rank_num
FROM `internationaldebt`.`international_debt`)
SELECT country_name,debt,indicator_name
FROM  debts 
WHERE rank_num BETWEEN 1 AND 3;

SELECT country_name,debt,indicator_name,
DENSE_RANK() OVER(PARTITION BY country_name ORDER BY debt DESC ) AS denserank_num
FROM `internationaldebt`.`international_debt`;
 
SELECT country_name,debt,indicator_name,
NTILE(6) OVER(PARTITION BY country_name ORDER BY debt DESC ) AS bucket_num
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
LAG(debt,2) OVER(PARTITION BY country_name ORDER BY debt DESC ) 
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
LEAD(debt,2) OVER(PARTITION BY country_name ORDER BY debt DESC ) 
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
FIRST_VALUE(debt) OVER(PARTITION BY country_name ORDER BY debt DESC ROWS BETWEEN 2 PRECEDING AND UNBOUNDED FOLLOWING ) 
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
LAST_VALUE(debt) OVER(PARTITION BY country_name ORDER BY debt DESC RANGE BETWEEN 2 PRECEDING AND 2 FOLLOWING ) 
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
NTH_VALUE(debt,2) OVER(PARTITION BY country_name ORDER BY debt DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING  ) 
FROM `internationaldebt`.`international_debt`;
-- distribution functions
SELECT country_name,debt,indicator_name,
PERCENT_RANK() OVER(PARTITION BY country_name ORDER BY debt DESC ) 
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
CUME_DIST() OVER(PARTITION BY country_name ORDER BY debt DESC ) 
FROM `internationaldebt`.`international_debt`;
