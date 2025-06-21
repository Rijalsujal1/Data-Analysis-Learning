-- Joins

SELECT * 
FROM demo.employee_data;

SELECT * 
FROM demo.department_details;


-- inner join
# RETURN ONLY MATCHING ROWS FROM BOTH SIDE
SELECT *
FROM demo.employee_data AS ed 
INNER JOIN demo.department_details as dd
	ON ed.department = dd.department
;

SELECT ed.id,first_name, dept_head
FROM demo.employee_data AS ed 
INNER JOIN demo.department_details as dd
	ON ed.department = dd.department
;

SELECT first_name, dept_head
FROM demo.employee_data AS ed 
INNER JOIN demo.department_details as dd
	ON ed.department = dd.department
;


-- Outer Join
# Left join
# return all rows from the left table plus matching rows from the right
SELECT e.first_name, e.department, d.dept_head, d.location
FROM employee_data e
LEFT JOIN department_details d
ON e.department = d.department;


# RIGHT join
# return all the rows from the right table plus matching rows from the right

SELECT e.first_name, e.department, d.dept_head, d.location
FROM employee_data e
RIGHT JOIN department_details d
ON e.department = d.department;

SELECT *
FROM employee_data as e
RIGHT JOIN department_details as d
	ON e.department = d.department
;
    
    
# better data that help to visulaize easily
SELECT *
FROM sample_employee;
SELECT *
FROM sample_department;

-- Inner join

SELECT *
FROM sample_employee as se
INNER JOIN sample_department as sd
	on se.department = sd.department;
    
-- outer join

#left join
SELECT *
FROM sample_employee as se
LEFT JOIN sample_department as sd
	on se.department = sd.department;
    
# right join
SELECT *
FROM sample_employee as se
RIGHT JOIN sample_department as sd
	on se.department = sd.department;

# union
SELECT *
FROM sample_employee as se
LEFT JOIN sample_department as sd
	on se.department = sd.department
UNION
SELECT *
FROM sample_employee as se
RIGHT JOIN sample_department as sd
	on se.department = sd.department;
    
-- Self Join
SELECT *
FROM sample_employee;

SELECT *
FROM sample_employee as e1
JOIN sample_employee as e2
	on e1.emp_id= e2.emp_id;
    
SELECT e1.emp_id as Employee_id,
		e2.department  as department_name
FROM sample_employee as e1
JOIN sample_employee as e2
	on e1.emp_id = e2.emp_id;
    
SELECT e1.emp_id as Employee_id,
		e2.department  as department_name
FROM sample_employee as e1
JOIN sample_employee as e2
	on e1.emp_id +1 = e2.emp_id;
    









-- JOINING MULTIPLE TABLE TOGETHER


SELECT *
FROM employee_new;
SELECT *
FROM departments_new;
SELECT *
FROM salaries;


# USING THE MULTIPLE JOINS
SELECT *
FROM employee_new as  a
JOIN departments_new as b
	ON a.dept_id = b .dept_id
LEFT JOIN salaries as s
	ON a.emp_id = s.emp_id
;
# ABOVE SHOWS EVERYTHING

#NOW DISPLAYING THE SPECIFIC COLUMNS ONLY
SELECT a.emp_id, a.name, b.dept_name, s.salary
FROM employee_new as  a
JOIN departments_new as b
	ON a.dept_id = b .dept_id
LEFT JOIN salaries as s
	ON a.emp_id = s.emp_id
;
