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
