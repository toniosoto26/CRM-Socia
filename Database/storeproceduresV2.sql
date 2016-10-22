DELIMITER //
CREATE PROCEDURE getConsecutive( IN conceptIn varchar(45), OUT consecutiveOut INT )
BEGIN
    SELECT 
      consecutive INTO consecutiveOut 
	FROM crm_consecutives
    WHERE 
      concept = conceptIn  FOR UPDATE  ;

    UPDATE crm_consecutives SET consecutive = consecutiveOut+1 WHERE concept = conceptIn;
END;
//
DELIMITER ;