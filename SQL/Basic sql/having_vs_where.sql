-- Having vs Where

SELECT *
FROM demo.employee_data;

#using the where 
#WHERE — Filter rows before grouping

#include employees older than 30 before calculating average salary.
SELECT department, avg(salary) as avg_salary
FROM demo.employee_data
where age>30
group by department;


#using having - Filetrs groups after grouping
# First groups employees, then filters out departments with 2 or fewer employees

SELECT distinct department
FROM demo.employee_data;

SELECT department, count(*) total_employee
FROM demo.employee_data
group by department
having total_employee >=3;


SELECT department, AVG(salary) AS avg_salary
FROM employee_data
WHERE age > 30
GROUP BY department
HAVING AVG(salary) > 60000;


#Find departments that have more than 2 employees earning over 50,000, and 
# sort them by average bonus descending.

Select department, avg(bonus)
From demo.employee_data
where salary >50000
group by department
having count(*) >2
ORDER BY avg(bonus) desc;







