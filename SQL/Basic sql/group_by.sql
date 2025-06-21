-- Group By

SELECT *
FROM demo.player_auction_2024;


SELECT final_price_lakh, franchise
FROM demo.player_auction_2024
GROUP BY final_price_lakh, franchise;

SELECT *
FROM demo.employee_data;

SELECT department, Avg(salary), Max(salary), min(salary), count(salary)
FROM demo.employee_data
group by department;


#: Count Employees per Department
SELECT department, Count(*) as employee_count
from demo.employee_data
group by department;

#Average Salary per Department
SELECT department, Count(*) as employee_count, avg(salary) as Avg_Salary
from demo.employee_data
group by department;

#Total Bonus per Department
SELECT department, sum(bonus) as Total_Bonus
from demo.employee_data
group by department;

# Maximum and Minimum Age per Department
SELECT department, max(age) as MAX_AGE, min(age) as MIN_AGE
from demo.employee_data
group by department;

#Average Bonus of Departments with salary more than 60000

SELECT department, salary, avg(bonus) as AVG_BONUS
from demo.employee_data
where salary >= 60000
group by department, salary;