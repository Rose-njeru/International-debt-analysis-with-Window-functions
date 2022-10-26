## Analysis of international debt with Window functions in MY SQL Workbench
### Outline
* Introduction
* Data Analysis

#### Introduction
The International debt CSV table consists of country_name, country_code, indicator_name, indicator_code and debt columns consisting of 2357 rows 
![image](https://user-images.githubusercontent.com/92436079/198059078-62d24116-9d41-4a36-9ba7-e6a6a81ef540.png)
with 124  distinct countries
![image](https://user-images.githubusercontent.com/92436079/198059529-719cf980-67b2-43d4-8c81-3a835a1d65b7.png)
and 25 distinct debt indicators respectively
![image](https://user-images.githubusercontent.com/92436079/198059790-840517dc-23b4-4d6a-a11e-0f8468d5a3bd.png)
* The Objective
~ Determine the accumulation of different debt indicators by countries with Window functions
* The Questions 
~ What is the running total, maximum, minimum and average debt accumulated? 
~ What are the 3 top most debt indicators accumulated by countries? 
~ What else can I find using the data?
#### Data analysis
The first task was to identify the running total, maximum, minimum and average debt accumulated by countries using Aggregate functions SUM (), MAX (), MIN (), AVG () and the OVER () clause, therefore with WINDOW function I aliased the window specification (PARTITION BY country_name ORDER BY debt DESC) creating a WINDOW d.
![image](https://user-images.githubusercontent.com/92436079/198060432-76c6941b-e55a-4107-8341-d753aeae3864.png)
Ranking Functions ROW_NUMBER (), DENSE (), DENSE_RANK () with OVER () clause were used for ranking the debt indicators accumulated by countries using the WINDOW d,
![image](https://user-images.githubusercontent.com/92436079/198060817-43bc1d4d-3648-41e7-b7a1-5db7e1d9bf2a.png)
and using CTE   to determine the top 3 most accumulated debts were 'Disbursements on external debt, long-term (DIS, current US$)','Principal repayments on external debt, long-term (AMT, current US$)’, and 'PPG, official creditors (DIS, current US$)'.
![image](https://user-images.githubusercontent.com/92436079/198061104-3e8fe868-044d-4c31-80da-6226d1cbbf79.png)
 The data used with Analytic Functions FIRST_VALUE (), LAST_VALUE (), NTH_VALUE and Frame_clause that is Frame_ units (ROW|RANGE) to show the relationship between current rows and frame rows, and frame_extent (CURRENT ROW, UNBOUNDED PRECEDING, UNBOUNDED FOLLOWING, PRECEDING, FOLLOWING) to show the start and end points of the frame.
![image](https://user-images.githubusercontent.com/92436079/198065715-c69f12de-8060-48c7-8981-3ce11199e536.png) 
LAG (), LEAD (), NTILE () analytic functions do not have to take the frame clause, therefore be used with OVER () clause and WINDOW d,therefoe
 LAG (), LEAD () showed the rows before and after the current row respectively while NTILE () showed equal distribution of buckets in an ordered partition.
 ![image](https://user-images.githubusercontent.com/92436079/198062615-9136e380-f9e6-4655-99c4-6a033aad74d9.png)
Distribution functions PERCENT_RANK (), CUM_DIST () used with OVER () clause and WINDOW d, PERCENT_RANK () showed the relative rank of each indicator’s debt within country while CUM_DIST () showed the distribution of different debt indicators values
![image](https://user-images.githubusercontent.com/92436079/198062787-4b705bf0-4555-40b5-81e7-5ffeaaf090a2.png)
