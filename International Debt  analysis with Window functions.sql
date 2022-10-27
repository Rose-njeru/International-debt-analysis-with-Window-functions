/* Analysis of the International debt using Window  and Aggregate Functions*/
-- Overview of the table


SELECT * FROM internationaldebt.international_debt;

SELECT DISTINCT country_name,country_code
FROM `internationaldebt`.`international_debt`;

SELECT DISTINCT indicator_name
FROM `internationaldebt`.`international_debt`;


-- Window Functions
SELECT  country_name,debt,indicator_name,
SUM(debt) OVER(d ) AS running_total,
MAX(debt) OVER(d ) AS running_max,
MIN(debt) OVER(d ) AS running_min,
AVG(debt) OVER(d ) AS running_avg
FROM `internationaldebt`.`international_debt`
WINDOW d AS(PARTITION BY country_name ORDER BY debt DESC);

-- Ranking Functions

SELECT DISTINCT country_name,debt,indicator_name,
ROW_NUMBER() OVER(d ) AS row_num,
 RANK() OVER(d ) AS rank_num,
DENSE_RANK()  OVER(d ) AS denserank_num
FROM `internationaldebt`.`international_debt`
WINDOW d AS(PARTITION BY country_name ORDER BY debt DESC);

WITH debts AS(SELECT DISTINCT country_name,debt,indicator_name,
ROW_NUMBER() OVER(d ) AS row_num,
 RANK() OVER(d ) AS rank_num,
DENSE_RANK()  OVER(d ) AS denserank_num
FROM `internationaldebt`.`international_debt`
WINDOW d AS(PARTITION BY country_name ORDER BY debt DESC))
SELECT country_name,indicator_name,debt,row_num
FROM debts
WHERE row_num BETWEEN 1 and 3;
 -- analytic functions

SELECT country_name,debt,indicator_name,
FIRST_VALUE(debt) OVER(PARTITION BY country_name ORDER BY debt DESC ROWS BETWEEN 2 PRECEDING AND UNBOUNDED FOLLOWING ) AS first_one,
LAST_VALUE(debt) OVER(PARTITION BY country_name ORDER BY debt DESC RANGE BETWEEN 2 PRECEDING AND 2 FOLLOWING ) AS last_one,
NTH_VALUE(debt,2) OVER(PARTITION BY country_name ORDER BY debt DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING  ) AS n_value 
FROM `internationaldebt`.`international_debt`;

SELECT country_name,debt,indicator_name,
NTILE(6) OVER(d) AS bucket_num,
LAG(debt,2) OVER(d) AS previous_2_rows, 
LEAD(debt,2) OVER(d ) As Next_2_rows
FROM `internationaldebt`.`international_debt`
WINDOW d AS(PARTITION BY country_name ORDER BY debt DESC);

-- distribution functions
SELECT country_name,debt,indicator_name,
 round( PERCENT_RANK()   OVER(d),2) AS percentage,
 round(  CUME_DIST() OVER(d) ,2) AS distribution
FROM `internationaldebt`.`international_debt`
WINDOW d AS(PARTITION BY country_name ORDER BY debt DESC);
