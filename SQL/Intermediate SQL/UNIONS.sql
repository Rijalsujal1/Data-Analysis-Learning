-- UNIONS

SELECT *
FROM sample_employee;
SELECT *
FROM sample_department;

-- using union
SELECT *
FROM sample_employee
UNION DISTINCT -- BY DEFAULT ITS DISTINCT
SELECT *
FROM sample_department;

-- Using Union all
SELECT *
FROM sample_employee
UNION ALL
SELECT *
FROM sample_department;