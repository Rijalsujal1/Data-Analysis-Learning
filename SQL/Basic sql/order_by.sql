-- Order By

SELECT *
FROM demo.employee_data;

# arranging the name in alpabetical order
SELECT *
FROM demo.employee_data
ORDER BY first_name asc;

SELECT *
FROM demo.employee_data
ORDER BY  age, salary desc;


#Example 1: Sort employees by salary (lowest to highest)

Select *
from demo.employee_data;

Select *
from demo.employee_data
order by salary asc;


#Example 2: Sort by age (oldest first)

Select *
from demo.employee_data
order by age desc;

#Example 3: Sort departments by average salary

Select department, avg(salary) as AVG_SALARY
from demo.employee_data
group by department
order by AVG_SALARY ;


#Practice Tasks
#Task 1: List all employees with their department and salary, sorted by salary (highest to lowest)

Select first_name , last_name, department,salary 
from demo.employee_data
order by salary desc ;

#Task 2: List employees by age (youngest first), and show only those with a bonus greater than 8000

Select first_name , last_name, age, bonus
from demo.employee_data
where bonus >= 8000
order by age asc;


#Task 3: Get the top 3 highest-paid employees

Select first_name , last_name, salary
from demo.employee_data
order by salary desc
limit 3;




