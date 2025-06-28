-- Temporary Tables

CREATE TEMPORARY TABLE temp_table (
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  address VARCHAR(50)
);

INSERT INTO temp_table (first_name, last_name, address)
VALUES 
  ('Sujal', 'Rijal', 'Kathmandu'),
  ('Nita', 'Sharma', 'Pokhara'),
  ('Raj', 'Thapa', 'Biratnagar');
  
select *
from temp_table;


#tasks
-- Employees with bonus > 10,000
-- Then group by department to count high-bonus employees


-- Step 1: Create a temporary table
CREATE TEMPORARY TABLE bonus_10k AS
SELECT *
FROM employee_data
WHERE bonus > 10000;

-- Step 2: Get number of high-bonus employees per department
SELECT department, COUNT(*) AS high_bonus_count
FROM bonus_10k
GROUP BY department;


# clean update
# manually dropping
drop temporary table if exists bonus_10k;



