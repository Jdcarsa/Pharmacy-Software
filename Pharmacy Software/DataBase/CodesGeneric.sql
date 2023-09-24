
/*------------- Create ----------*/
DELIMITER $
CREATE PROCEDURE insertAnyData(IN nameTable VARCHAR(50)
		,in nameColumns text, IN dataInsert TEXT)
BEGIN
    SET @query = CONCAT('INSERT INTO ', nameTable, ' (', nameColumns, ') 
    VALUES (', dataInsert, ')');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$
/*------------- Create ----------*/

DESCRIBE Presentation;

call insertAnyData('Presentation','descriptionPresentation, statePresentation'
	,'\'Cream\', \'Active\'');
    
    
    
/*------------- Update ----------*/

DELIMITER $
CREATE PROCEDURE updateAnyData(IN nameTable VARCHAR(20),  
					IN dataUpdate TEXT, in nameColumnId  varchar(25)
                    ,IN pId varchar(11))
BEGIN
	SET @query = CONCAT('UPDATE ', nameTable, ' SET ', dataUpdate, ' WHERE ', 
	nameColumnId, ' = ''', pId, '''');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$ 


call updateAnyData('Presentation','descriptionPresentation'
	,'\'Capsule\'','idPresentation','Prst-001');
    
call updateAnyData('Laboratory','nameLaboratory = "Cruz", 
address = "Arg" , phone = "132"', 'idLaboratory','Lab-003');

call updateAnyData('Employee', 'nameEmployee = "Diego"', 'idEmployee' , 'Emp-001');
/*------------- Update ----------*/




/*------------- Disable ----------*/
DELIMITER $
CREATE PROCEDURE disableAnyData(in nameTable  varchar(20), 
		in nameColum varchar(25),in nameColumnId  varchar(25),IN pId varchar(11))
	BEGIN
    
	SET @query = CONCAT('UPDATE ', nameTable, 
    ' SET ', nameColum, ' = ''', 
    'Disable', ''' WHERE ', 
    nameColumnId, ' = ''', pId, '''');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
        
END $
/*------------- Disable ----------*/

call disableAnyData('presentation','statePresentation'
,'idPresentation','Prst-001');


call disableAnyData('employee','statusEmployee'
,'idEmployee','Emp-001');