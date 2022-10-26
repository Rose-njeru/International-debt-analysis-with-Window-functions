## Analysis of international debt with Window functions in MY SQL Workbench
### Outline
* Introduction
* Data Analysis

#### Introduction
The International debt CSV table consists of country_name, country_code, indicator_name, indicator_code and debt columns consisting of 2357 rows with 124 and 25 distinct countries and debt indicators respectively
* The Objective
~ Determine the accumulation of different debt indicators by countries with Window functions
* The Questions 
~ What is the running total, maximum, minimum and average debt accumulated? 
~ What are the 3 top most debt indicators accumulated by countries? 
~ What else can I find using the data?
#### Data analysis
The first task was to identify the running total, maximum, minimum and average debt accumulated by countries using Aggregate functions SUM (), MAX (), MIN (), AVG () and the OVER () clause, therefore with WINDOW function I aliased the window specification (PARTITION BY country_name ORDER BY debt DESC) creating a WINDOW d.
Ranking Functions ROW_NUMBER (), DENSE (), DENSE_RANK () with OVER () clause were used for ranking the debt indicators accumulated by countries using the WINDOW d and using CTE   to determine the top 3 most accumulated debts were 'Disbursements on external debt, long-term (DIS, current US$)','Principal repayments on external debt, long-term (AMT, current US$)’, and 'PPG, official creditors (DIS, current US$)'.
 The data used with Analytic Functions FIRST_VALUE (), LAST_VALUE (), NTH_VALUE and Frame_clause that is Frame_ units (ROW|RANGE) to show the relationship between current rows and frame rows, and frame_extent (CURRENT ROW, UNBOUNDED PRECEDING, UNBOUNDED FOLLOWING, PRECEDING, FOLLOWING) to show the start and end points of the frame.
LAG (), LEAD (), NTILE () analytic functions do not have to take the frame clause, therefore be used with OVER () clause and WINDOW d.
 LAG (), LEAD () showed the rows before and after the current row respectively while NTILE () showed equal distribution of buckets in an ordered partition.
Distribution functions PERCENT_RANK (), CUM_DIST () used with OVER () clause and WINDOW d, PERCENT_RANK () showed the relative rank of each indicator’s debt within country while        CUM_DIST () showed the distribution of different debt indicators values

