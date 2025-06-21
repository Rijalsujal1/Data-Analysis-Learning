-- Subquires

-- Using employee_data.csv, write a query to:
-- Show all employees whose salary is above the average
-- Use a subquery in the WHERE clause

# Subquery in WHERE
# Show employees who earn more than the average salary
SELECT first_name, salary
FROM employee_data
WHERE salary > (
  SELECT AVG(salary) FROM employee_data
);


# Subquery in FROM
# Get average salary per department, then filter them

SELECT * 
FROM employee_data
;

SELECT department, avg_salary
FROM (
  SELECT department, AVG(salary) AS avg_salary
  FROM employee_data
  GROUP BY department
) AS dept_avg
WHERE avg_salary > 60000;

# Subquery in SELECT
# Show employee name and total employees

SELECT first_name, last_name,
 (SELECT  count(id) FROM employee_data) as total_employee
FROM employee_data;

SELECT department, AVG(age), MAX(age), MIN(age), COUNT(AGE)
FROM employee_data
GROUP BY department;



SELECT department, AVG(`MAX(age)`)
FROM
(SELECT department, AVG(age), MAX(age), MIN(age), COUNT(AGE)
FROM employee_data
GROUP BY department) AS Agg_table
GROUP BY department
;











