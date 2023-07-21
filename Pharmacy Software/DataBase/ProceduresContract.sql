/*------------- create contract ----------*/
DELIMITER $
create trigger createContractTrigger 
before insert on Employee for each row
begin
	DECLARE id int;
    declare cod varchar(11);
    declare salary decimal (8,2);
    declare job varchar(30);
    
    set job =  new.job;
    set salary = generateSalary(job);
    SET id  = (SELECT COUNT(*) FROM Contract) + 1;
    SET cod = CONCAT('Ctra-', LPAD(id , 3, '0'));
    
    INSERT INTO `pharmacy`.`contract`(`idContract`,`idEmployee`,`nameEmployee`,
	`contractDate`,`contractEnd`,`salary`)
	VALUES (cod,new.idEmployee, CONCAT(new.nameEmployee, ' ' , 
    new.lastNameEmployee),NOW(),(NOW() + INTERVAL 6 MONTH) , salary );

end $
/*------------- create contract ----------*/


