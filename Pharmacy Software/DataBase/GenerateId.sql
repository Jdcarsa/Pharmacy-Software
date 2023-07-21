    
/*------------- generate id presentation ----------*/
DELIMITER $
create trigger generateIdTrigger 
before insert on Presentation for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Presentation) + 1;
    SET NEW.idPresentation = CONCAT('Prst-', LPAD(id , 3, '0'));
end $
/*------------- generate id presentation ----------*/



/*------------- secuence ----------*/

DELIMITER $
create trigger generateIdEmployeeTrigger 
before insert on Employee for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Employee) + 1;
    SET NEW.idEmployee = CONCAT('Emp-', LPAD(id , 3, '0'));
end $
/*------------- secuence ----------*/



/*---------generate id patient-------*/
DELIMITER $
create trigger generateIdPatientTrigger 
before insert on Patient  for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Product) + 1;
    SET NEW.idPatient  = generarateId('Pte-',id);
end $
/*---------generate id -------*/


/*---------generate id -------*/
DELIMITER $
create trigger generateIdProviderTrigger 
before insert on Provider for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Provider) + 1;
    SET NEW.idProvider = CONCAT('Pvr-', LPAD(id , 3, '0'));
end $
/*---------generate id -------*/




/*---------generate id -------*/


DELIMITER $
create trigger generateIdProductTrigger 
before insert on product for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Product) + 1;
    SET NEW.idProduct  = generarateId('Pdt-',id);
end $


/*---------generate id -------*/






/*---------generate id -------*/

DELIMITER $
create trigger generateIdLabTrigger 
before insert on laboratory for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM laboratory) + 1;
    SET NEW.idLaboratory = CONCAT('Lab-', LPAD(id , 3, '0'));
end $



/*---------generate id -------*/




/*---------generate id patient-------*/

DELIMITER $
create trigger generateIdPurchaseTrigger 
before insert on Purchase  for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Purchase) + 1;
    SET NEW.idPurchase  = generarateId('Pur-',id);
end $
/*---------generate id -------*/



/*---------generate id patient-------*/
/* sales check , detailsales ,  */
DELIMITER $
create trigger generateIdClinicHistoryTrigger 
before insert on ClinicHistory  for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM ClinicHistory) + 1;
    SET NEW.idClinicHistory  = generarateId('Clht-',id);
end $
/*---------generate id -------*/



/*---------generate id patient-------*/
/* sales check , detailsales ,  */

/*---------generate id -------*/