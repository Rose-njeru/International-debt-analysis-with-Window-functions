# Outline
Introduction
Data analysis
# Introduction
The International_debt CSV table consists of country_name,country_code,indicator_name,indicator_code and  debt  columms
The task was to identify the accumulation of diffrebt debt indicators among countries,therefore with the use  Window functions;Aggregate Functions,Ranking Functions,Analytical Functions and Distribution Functions
Firstly i imported the international_debt CSV file in My SQL Workbench then used SELECT,FROM clauses to have overview of the data
Secondly   Aggregate functions SUM(),MAX(),MIN(),AVG()  determined the cumulative,maximum,minimum and average debt accumulated  by diffrent countries  with the OVER() Window frame 
With Ranking functions ROW_NUMBER(),DENSE(),DENSE_RANK() and window frame OVER()  determined the value of debt indicators among countries,  using CTE on the RANK() window frame, 'Disbursements on external debt, long-term (DIS, current US$)','Principal repayments on external debt, long-term (AMT, current US$)',and 'PPG, official creditors (DIS, current US$)' are the top 3 most accumulated debts by countries
Analytic Functions LAG(),LEAD(),FIRST_VALUE(),LAST_VALUE(),NTH_VALUE,NTILE()  using OVER() window frame and ROWS AND RANGE between either the preceding,current and following rows determined the previous,next  debt values of rows as well first,last values,ntile() determined the bucket number of debt indicators among countries
Distribution functions PERCENT_RANK(),CUM_DIST() determined the distribution of debt values within the group of diffrent debt indicators
