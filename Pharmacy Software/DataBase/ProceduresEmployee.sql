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


/*------------- Create ----------*/
DELIMITER $
CREATE PROCEDURE insertEmployee(IN pName varchar(30), in pLastName varchar(30)
		,in pJob varchar(30) ,in pSex varchar(10), in pId int , in pEmail varchar(30),
		in pPhone varchar(20), in pAdress varchar(60))
	BEGIN
		INSERT INTO pharmacy.Employee
		(`nameEmployee`,`lastNameEmployee`,`job`,`sex`,`numIdentification`
        ,`email`,`phone`,`address`,`statusEmployee`)
		VALUES (pName,pLastName,pJob,pSex,pId,pEmail,pPhone,pAdress,'Active');
END $
/*------------- Create ----------*/



/*------------- Update ----------*/
DELIMITER $
CREATE PROCEDURE updateEmployee(IN pName varchar(30), in pLastName varchar(30)
		,in pJob varchar(30) ,in pSex varchar(10), in pId int 
        , in pEmail varchar(30),in pPhone varchar(20), in pAdress varchar(60))
	BEGIN
        
		UPDATE pharmacy.Employee
		SET
		`nameEmployee` = pName,
        `lastNameEmployee` = pLastName,
		`job` = pJob,
		`sex` = pSex,
		`numIdentification` = pId,
		`email` = pEmail,
		`phone` = pPhone,
		`address` = pAddress
		WHERE `idEmployee` = pIdEmployee;
END $
/*------------- update ----------*/


/*------------- Disable ----------*/
DELIMITER $
CREATE PROCEDURE disableEmployee(IN pIdEmployee varchar(11))
	BEGIN
        
		UPDATE pharmacy.Employee
        SET statusEmployee = 'Disable'
        WHERE idEmployee = pIdEmployeer;
        
END $

/*------------- Disable ----------*/








/*------------- generate salary ----------*/
DELIMITER $
create function generateSalary(pJob varchar(30)) returns DECIMAL(10, 2) DETERMINISTIC
	BEGIN
    declare vSalary DECIMAL(10, 2);
    set vSalary = CASE
        WHEN pJob like 'Doctor' THEN  3500000
        WHEN pJob like 'Assistant' THEN 1500000
        WHEN pJob like 'Admin' THEN  2500000
        ELSE  0
    END;
    
    return vSalary;
END $    
/*------------- generate salary ----------*/


/*------------- update all related tables  ----------*/
delimiter $
create trigger updateDataEmployeeTrigger 
after update on Employee for each row
	begin
		update contract
		set statusContract = new.statusEmployee
        where idEmployee = new.idEmployee;
        
        update userEmployee
        set stateUser = new.statusEmployee
        where idEmployee = new.idEmployee;
    
end  $
/*------------- update all related tables  ----------*/