-- Stored Procedure

DELIMITER $$

CREATE PROCEDURE GetHighSalary()
BEGIN
	  SELECT first_name, salary
	  FROM employee_data
	  WHERE salary > 80000;
END $$

DELIMITER ;

CALL GetHighSalary();






# Stored Procedure with Parameters

DELIMITER $$

CREATE PROCEDURE GetBonusAbove(IN bonus_limit DECIMAL(10,2))
BEGIN
  SELECT first_name, department, bonus
  FROM employee_data
  WHERE bonus > bonus_limit;
END$$

DELIMITER ;

-- Example usage:
CALL GetBonusAbove(12000);



