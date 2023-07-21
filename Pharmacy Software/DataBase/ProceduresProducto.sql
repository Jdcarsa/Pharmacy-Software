DELIMITER $
create trigger generateIdProductTrigger 
before insert on product for each row
begin
	DECLARE id  INT;
    SET id  = (SELECT COUNT(*) FROM Product) + 1;
    SET NEW.idProduct  = generarateId('Pdt-',id);
end $


/*------------- Create ----------*/
DELIMITER $
CREATE PROCEDURE insertProduct(IN pDescription varchar(100), 
		in pConcentration varchar(30),in pStock int ,in pCost decimal(8,2)
        , in pSalePrice decimal(8,2) , in pHealthRegister varchar(20),
		in pEpirationDate date, in pIdPresentation varchar(11)
        ,in pIdLaboratory varchar(11))
	BEGIN
		INSERT INTO pharmacy.Product
		(`descriptionProduct`,`concentration`,`stock`,`cost`,`salePrice`,
		`healthRegister`,`expirationDate`,`statusProduct`,`idPresentation`,
		`idLaboratory`)
		VALUES (pDescription,pConcentration,pStock ,pCos,pSalePrice,
        pHealthRegister,pEpirationDate ,'Active',pIdPresentation, pIdLaboratory);
END $
/*------------- Create ----------*/


/*------------- update ----------*/
delimiter $
CREATE PROCEDURE updateProduct(in pId varchar(11),IN pDescription varchar(100), 
		in pConcentration varchar(30),in pStock int ,in pCost decimal(8,2)
        , in pSalePrice decimal(8,2) , in pHealthRegister varchar(20),
		in pExpirationDate date, in pIdPresentation varchar(11)
        ,in pIdLaboratory varchar(11))
	BEGIN
		UPDATE `pharmacy`.`product`
		SET`descriptionProduct` = pDescription,
		`concentration` = pConcentration,
		`stock` = pStock,
		`cost` = pCost,
		`salePrice` = pSalePrice,
		`healthRegister` = pHealthRegister,
		`expirationDate` = pExpirationDate,
		`idPresentation` = pIdPresentation,
		`idLaboratory` = pIdLaboratory
		WHERE `idProduct` = pId;
END $
/*------------- update ----------*/



/*------------- Disable ----------*/
DELIMITER $
CREATE PROCEDURE disableProduct(IN pIdProduct varchar(11))
	BEGIN
        
		UPDATE pharmacy.Product
        SET statusProduct = 'Disable'
        WHERE idProduct = pIdProduct;
        
END $

/*------------- Disable ----------*/
