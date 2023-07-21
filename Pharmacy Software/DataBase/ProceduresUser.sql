/*---------create user employee-----*/
DELIMITER $
create trigger createUserEmployeeTrigger 
before insert on Employee for each row
begin
	DECLARE id int;
    declare cod varchar(11);    

    SET id  = (SELECT COUNT(*) FROM Contract) + 1;
    SET cod = generarateId('Usr-',id);
    
    INSERT INTO `pharmacy`.`useremployee`(`idUser`,`nameUser`,`employeeUser`,
	`passwordUser`,`typeUser`,`stateUser`,`idEmployee`)
	VALUES (cod, CONCAT(new.nameEmployee, ' ' , 
    new.lastNameEmployee),generarateUser(new.lastNameEmployee,cod)
    ,generaratePassword(),new.job,
    'Active', new.idEmployee );

end $
/*---------create user employee-----*/






/*------------- disable user  ----------*/
DELIMITER $
create trigger updateStatusUserTrigger 
after update on contract for each row
begin
		if NOW() >contractEnd then
			update userEmployee
            set stateUser = 'disable'
            where idEmployee = new.idEmployee;
		end if;

end $
/*------------- disable user  ----------*/

