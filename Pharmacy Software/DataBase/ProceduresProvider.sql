DELIMITER $
create trigger generateIdProviderTrigger 
before insert on Provider for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Provider) + 1;
    SET NEW.idProvider = CONCAT('Pvr-', LPAD(id , 3, '0'));
end $

DELIMITER $
CREATE PROCEDURE insertProvider(IN pName varchar(80) , in pId int , 
		in pAdress varchar(35), in pEmail varchar(35), in pPhone varchar(20) , 
        in pBank varchar(35) , in pAccount varchar(35))
	BEGIN
		INSERT INTO pharmacy.Provider (`nameProvider`,
				`numIdentification`,`Address`,`Email`,
				`Phone`,`Bank`,`numAccount`,`stateProvider`)
		VALUES (pName,pId,pAdress,pEmail,pPhone,pBank,pAccount,'Active');
END $

DELIMITER $
CREATE PROCEDURE updateProvider(in pIdProvider varchar(11),
		IN pName varchar(80) , in pId int , 
		in pAdress varchar(35), in pEmail varchar(35), in pPhone varchar(20) , 
        in pBank varchar(35) , in pAccount varchar(35))
	BEGIN
        
		UPDATE pharmacy.Provider
        SET `nameProvider` = pName,
		`numIdentification` = pId,
		`Address` = pAdress,
		`Email` = pEmail,
		`Phone` = pPhone,
		`Bank` = pBank,
		`numAccount` = pAccount
        WHERE `idProvider` = pIdProvider;
        
END $


DELIMITER $
CREATE PROCEDURE disableProvider(IN pIdProvider varchar(11))
	BEGIN
        
		UPDATE pharmacy.Provider
        SET stateProvider = 'Disable'
        WHERE idProvider = pIdProvider;
        
END $