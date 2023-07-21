
/*---------generate id -------*/
DELIMITER $
create trigger generateIdPatientTrigger 
before insert on Patient  for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Product) + 1;
    SET NEW.idPatient  = generarateId('Pte-',id);
end $
/*---------generate id -------*/



/*------------- Create ----------*/
DELIMITER $
CREATE PROCEDURE insertPatient(IN pName varchar(30),in pSex varchar(10), 
		in pId int, in pBirthDate date , in pEmail varchar(30)
        ,in pPhone varchar(20), in pAdress varchar(60))
	BEGIN
		INSERT INTO `pharmacy`.`patient`
		(`idPatient`,`namePatient`,`sex`,`numIdentification`,
		`birthdate`,`email`,`phone`,`address`)
		VALUES(pName,pSex,pId,pBirthDate,pEmail,pPhone,pAdress);

END $
/*------------- Create ----------*/



DELIMITER $
CREATE PROCEDURE updatePatient(in pIdP varchar(11),
		IN pName varchar(30),in pSex varchar(10), 
		in pId int, in pBirthDate date , in pEmail varchar(30)
        ,in pPhone varchar(20), in pAdress varchar(60))
	BEGIN
		UPDATE `pharmacy`.`patient`
		SET `namePatient` = pName,
		`sex` = pSex,
		`birthdate` = pId,
		`email` = pBirthDate,
		`phone` = pEmail,
		`address` = pPhone
		WHERE `idPatient` = pAdress;

END $