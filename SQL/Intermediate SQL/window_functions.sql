-- window fucntions 

select *
from employee_data;

# Number each employee within department
select first_name, last_name, salary, department,
row_number() over(
	partition by department
    order by salary desc
) as row_num,
RANK() over(
	partition by department
    order by salary desc
) as rank_,
DENSE_RANK() over(
	partition by department
    order by salary desc
) as dense_rank_
from employee_data;




# using lag() and lead()
# lag is used to compare with the previous row
# lead is used to compare with the new one

SELECT first_name, department, salary,
       LAG(salary) OVER (PARTITION BY department ORDER BY salary) AS previous_salary,
       LEAD(salary) OVER (PARTITION BY department ORDER BY salary) AS next_salary
FROM employee_data;

#Using NTILE(n)
# n defines the numnber of bucket
#  divide employees into 4 salary quartiles (4 buckets) — lowest to highest


select first_name, last_name, department,
ntile(4) over( order by salary) as salary_quartile
from employee_data;

SELECT first_name, age,
       NTILE(3) OVER (ORDER BY age) AS age_group
FROM employee_data;














