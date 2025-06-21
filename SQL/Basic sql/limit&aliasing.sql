-- Limit & Aliasing

# Limit
# LIMIT controls how many rows are returned by your query.

SELECT *
FROM demo.employee_data
order by age desc 
limit 10 ;

SELECT *
FROM demo.employee_data
order by age desc 
limit 3,4 ;
#start from the 3rd position to next 4th position

# Aliasing
# AS lets you rename a columns or table in result for readiablity or formatting

SELECT department, AVG(bonus) AS Average_Bonus
FROM demo.employee_data
GROUP BY department;

#using both at once
SELECT department, AVG(salary) AS avg_salary
FROM demo.employee_data
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 3;


#challenge
#Get the names and salary of the top 5 highest-paid employees, show salary as Annual_Package.

SELECT first_name, last_name, salary AS Annual_package
FROM demo.employee_data
ORDER BY Annual_package DESC
LIMIT 5;
