/*-------------Generate password -------*/
DELIMITER $
CREATE FUNCTION generaratePassword() RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE characteres VARCHAR(100) DEFAULT 
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*';
    DECLARE passwordGenerate VARCHAR(20) DEFAULT '';
    DECLARE i INT DEFAULT 1;
    DECLARE totalCharacteres INT;
    
    SET totalCharacteres = LENGTH(characteres);
    
    WHILE i <= 10 DO
        SET passwordGenerate = CONCAT(passwordGenerate, 
        SUBSTRING(characteres, FLOOR(1 + RAND() * total_caracteres), 1));
        SET i = i + 1;
    END WHILE;
    
    RETURN passwordGenerate;
END $
/*-------------Generate password -------*/



/*-------------Generate user -------*/
DELIMITER $
CREATE FUNCTION generarateUser(pLastName varchar(30) , 
			pCod varchar(11)) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    RETURN CONCAT(pCod,SUBSTRING_INDEX(pLastName, ' ', 1));
END $

/*-------------Generate user -------*/



/*-------------Generate id -------*/
DELIMITER $
CREATE FUNCTION generarateId(pString varchar(5) , 
			pId int) RETURNS VARCHAR(11) DETERMINISTIC
BEGIN
    RETURN CONCAT(pString, LPAD(pId , 3, '0'));
END $
/*-------------Generate id -------*/