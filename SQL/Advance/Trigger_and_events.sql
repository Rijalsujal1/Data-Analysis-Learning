-- Trigers and Events


CREATE TABLE employee_backup (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  department VARCHAR(100),
  date_time DATETIME 
);

DELIMITER $$

CREATE TRIGGER backup_new_employee
AFTER INSERT ON employee_data
FOR EACH ROW
BEGIN
  INSERT INTO employee_backup (first_name, department, inserted_on)
  VALUES (NEW.first_name, NEW.department, NOW());
END$$

DELIMITER ;


INSERT INTO employee_data (first_name, last_name, age, department, salary, bonus, dob)
VALUES ('Rohan', 'Thapa', 29, 'HR', 65000, 8000, '1996-01-01');


SELECT * FROM employee_backup;
select * from employee_data;


CREATE TABLE employee_deleted_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  department VARCHAR(100),
  salary DECIMAL(10,2),
  deleted_at DATETIME
);

DELIMITER $$

CREATE TRIGGER log_deleted_employee
BEFORE DELETE ON employee_data
FOR EACH ROW
BEGIN
  INSERT INTO employee_deleted_log (first_name, last_name, department, salary, deleted_at)
  VALUES (OLD.first_name, OLD.last_name, OLD.department, OLD.salary, NOW());
END$$

DELIMITER ;

DELETE FROM employee_data
WHERE first_name = 'Rohan';

SELECT * FROM employee_deleted_log;
SELECT * FROM employee_data;





-- EVENTS
# schedule automater





delimiter $$

create  event delete_retire
on schedule every 30 second
do 
begin
	delete
	from employee_data
    where age>= 55;

end$$
delimiter ; 

show variables like 'events%';

SET GLOBAL event_scheduler = ON;

CREATE EVENT delete_low_bonus
ON SCHEDULE EVERY 1 DAY
DO
  DELETE FROM employee_data
  WHERE bonus < 2000;
  






CREATE EVENT insert_test_employee
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 10 second
DO
  INSERT INTO employee_data (first_name, last_name, age, department, salary, bonus, dob)
  VALUES ('Auto', 'Inserted', 30, 'Test', 40000, 1000, '1995-01-01');

select *
from employee_data;

DROP EVENT IF EXISTS insert_test_employee;

