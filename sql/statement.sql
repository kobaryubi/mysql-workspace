DELIMITER //

CREATE PROCEDURE p(increment INT)
BEGIN
  DECLARE counter INT DEFAULT 0;
  WHILE counter < 10 DO
    SET counter = counter + increment;
  END WHILE;
END //

DELIMITER ;
