-- CTEs
-- Common Table Expressions

-- CTEs Syntax
-- with cte_name as(
-- 	select ...
--     )
-- select ...
-- from cte_name;
select *
from employee_data;
# using the nested query
SELECT *
FROM (
  SELECT department, AVG(salary) AS avg_salary
  FROM employee_data
  GROUP BY department
) AS dept_avg
WHERE avg_salary > 70000;


#using the ctes
# this is more clear and easy to understand


WITH dept_avg as(
	SELECT department, AVG(salary) AS avg_salary
	FROM employee_data
	GROUP BY department
)
select *
FROM dept_avg
WHERE avg_salary > 70000;


-- Find the average bonus per department
-- Then return only departments with average bonus > 10,000

WITH dept_avg as(
	SELECT department, AVG(bonus) AS avg_bonus
	FROM employee_data
	GROUP BY department
)
select *
FROM dept_avg
WHERE avg_bonus > 10000;



# using the multiple ctes

# syntax 
-- WITH cte1 AS (
--   SELECT ... FROM table1
-- ),
-- cte2 AS (
--   SELECT ... FROM cte1
-- ),
-- cte3 AS (
--   SELECT ... FROM cte2
-- )
-- SELECT ...
-- FROM cte3;

# questions
-- CTE 1: Calculate average salary by department
-- CTE 2: Filter departments with average salary > 70,000
-- CTE 3: Join back to main data to get all employees in those departments

WITH avg_dept AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employee_data
  GROUP BY department
),
high_paid_dept AS (
  SELECT *
  FROM avg_dept
  WHERE avg_salary > 70000
),
final_result AS (
  SELECT ed.first_name, ed.last_name, ed.department, ed.salary, hp.avg_salary
  FROM employee_data AS ed
  JOIN high_paid_dept AS hp ON ed.department = hp.department
)
SELECT *,
  ROW_NUMBER() OVER (ORDER BY salary) AS row_num,
  RANK() OVER (ORDER BY salary) AS Ranks,
  DENSE_RANK() OVER (ORDER BY salary) AS dense_Ranks
FROM final_result;













