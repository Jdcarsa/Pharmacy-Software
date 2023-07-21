DELIMITER $
create trigger generateIdLabTrigger 
before insert on laboratory for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM laboratory) + 1;
    SET NEW.idLaboratory = CONCAT('Lab-', LPAD(id , 3, '0'));
end $


DELIMITER $
CREATE PROCEDURE insertLaboratory(IN pName varchar(35), 
	In pAdress varchar(35), in pPhone int)
	BEGIN
		INSERT INTO pharmacy.laboratory (nameLaboratory,
		address,phone,stateLaboratory)
		VALUES (pName,pAdress,pPhone,'Active');
END $

DELIMITER $
CREATE PROCEDURE updateLaboratory(IN pIdLab varchar(11), 
				IN pName varchar(35), 
				In pAdress varchar(35), in pPhone int)
	BEGIN

		UPDATE pharmacy.laboratory
        SET nameLaboratory =  pName, address = pAdress,
        phone = pPhone
        WHERE idLaboratory = pIdLab;
        
END $

call updateLaboratory('Lab-003','FARVET', 'Lima', 912475603);

DELIMITER $
CREATE PROCEDURE disableLaboratory(IN pIdLaboratory varchar(11))
	BEGIN
        
		UPDATE pharmacy.Laboratory
        SET stateLaboratory = 'Disable'
        WHERE idLaboratory= pIdLaboratory;
        
END $

call disableLaboratory('Lab-003');