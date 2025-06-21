-- Case Statements

select first_name,age,
case
	when age>40 then 'older'
	when age between 30 and 40 then 'mid'
	else 'young'
end as age_level
from employee_data;


select *
from employee_data;


SELECT first_name, last_name, salary,
CASE
	WHEN salary < 70000 then salary * 1.05
    WHEN salary > 70000 then salary * 1.07
    
    -- else salary
END AS Increment
FROM employee_data;
    


    
    
    
    
    
    
    
    