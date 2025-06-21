-- String Fucntions

SELECT LENGTH('skyfall');

SELECT first_name, length(first_name)
FROM employee_data
order by 1;


select UPPER('SUjal');
select LOWER('RiJAl');

SELECT first_name, upper(first_name)
FROM employee_data;

SELECT first_name, lower(first_name)
FROM employee_data;


select trim('         sujalrija1          '); 
select ltrim('         sujalrija1          '); 
select rtrim('         sujalrija1          '); 


SELECT department, first_name, 
left(department, 4) ,
right(department,4) ,
substring(first_name,1,2)
FROM employee_data;

select first_name, age,dob, 
substring(dob,1,4) as Year,
substring(dob,6,2) as Month,
substring(dob,9,2) as Day
from employee_data;





select dob, replace(dob, '02', 'FEB')
from employee_data;


select locate('j','sujal');

select first_name, locate('m', first_name)
from employee_data;



select first_name, last_name,
concat(first_name, ' ',last_name) as Full_Name
from employee_data;








