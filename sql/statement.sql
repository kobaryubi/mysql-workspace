DELIMITER //

CREATE PROCEDURE p1 (increment INT)
BEGIN
  DECLARE counter INT DEFAULT 0;
  WHILE counter < 10 DO
    SET counter = counter + increment;
  END WHILE;
END //

DELIMITER ;

-- 13.2.1 CALL Statement
DELIMITER //

CREATE PROCEDURE p2 (OUT ver_param VARCHAR(25), INOUT incr_param INT)
BEGIN
  SELECT VERSION() INTO ver_param;
  SET incr_param = incr_param + 1;
END //

DELIMITER ;

SET @increment = 10;
CALL p2(@version, @increment);
SELECT @version, @increment;

SET @increment = 10;
PREPARE stmt FROM 'CALL p2(?, ?)';
EXECUTE stmt USING @version, @increment;
SELECT @version, @increment;
DEALLOCATE PREPARE stmt;

-- 13.5 Prepared Statements
PREPARE stmt FROM 'SELECT SQRT(POW(?, 2) + POW(?, 2)) AS hypotenuse';
SET @a = 3;
SET @b = 4;
EXECUTE stmt  USING @a, @b;
DEALLOCATE PREPARE stmt;

SET @stmt = 'SELECT SQRT(POW(?, 2) + POW(?, 2)) AS hypotenuse';
PREPARE stmt FROM @stmt;
SET @a = 6;
SET @b = 8;
EXECUTE stmt USING @a, @b;
DEALLOCATE PREPARE stmt;

CREATE TABLE t1 (a INT NOT NULL);
INSERT INTO t1 VALUES (4), (8), (11), (32), (80);
SET @table = 't1';
SET @stmt = CONCAT('SELECT * FROM ', @table);
PREPARE stmt FROM @stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
