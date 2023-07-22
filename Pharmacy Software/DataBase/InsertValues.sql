/*Insert into presentation*/
call insertPresentation('Capsule');
call insertPresentation('Aerosol');
call insertAnyData('Presentation','descriptionPresentation, statePresentation'
	,'\'Gel\', \'Active\'');
call insertAnyData('Presentation','descriptionPresentation, statePresentation'
	,'\'Syrup\', \'Active\'');
call insertAnyData('Presentation','descriptionPresentation, statePresentation'
	,'\'Pasta\', \'Active\'');
call insertAnyData('Presentation','descriptionPresentation, statePresentation'
	,'\'Pill\', \'Active\'');
    
    
/*Insert into Laboratory*/
call insertLaboratory('PHARMA', 'Lambayeque', 985481300);
call insertLaboratory('ELIFARMA', 'Lima', 985733594);

call insertAnyData('Laboratory','nameLaboratory, address, phone, 
stateLaboratory','\'FARVET\', \'Lima\' , \'912475603\' , \'Active\'');
call insertAnyData('Laboratory','nameLaboratory, address, phone, 
stateLaboratory','\'ELIFARMA\', \'Amazonas\' , \'912475603\' , \'Active\'');
call insertAnyData('Laboratory','nameLaboratory, address, phone, 
stateLaboratory','\'GLENMARK\', \'Arequipa\' , \'912475603\' , \'Active\'');
call insertAnyData('Laboratory','nameLaboratory, address, phone, 
stateLaboratory','\'GLENTS\', \'Bagua\' , \'912475603\' , \'Active\'');
    
    
/*Insert into Product*/
call insertAnyData('Product','descriptionProduct, concentration, stock, 
cost, salePrice, healthRegister, expirationDate, statusProduct,
idPresentation, idLaboratory',
'\'Ibuprofen\', \'500mg\' , \'200\' , \'10.00\' ,\'15.00\' ,\'EN01867\'
,\'2025-08-08\' ,\'Active\' ,\'Prst-006\' ,\'Lab-001\'');
call insertAnyData('Product','descriptionProduct, concentration, stock, 
cost, salePrice, healthRegister, expirationDate, statusProduct,
idPresentation, idLaboratory',
'\'Naproxen\', \'400mg\' , \'250\' , \'12.00\' ,\'14.00\' ,\'EE035471\'
,\'2025-08-08\' ,\'Active\' ,\'Prst-001\' ,\'Lab-002\'');
call insertAnyData('Product','descriptionProduct, concentration, stock, 
cost, salePrice, healthRegister, expirationDate, statusProduct,
idPresentation, idLaboratory',
'\'Apronax\', \'200mg\' , \'200\' , \'19.00\' ,\'25.00\' ,\'EN01596\'
,\'2025-08-08\' ,\'Active\' ,\'Prst-007\' ,\'Lab-005\'');
call insertAnyData('Product','descriptionProduct, concentration, stock, 
cost, salePrice, healthRegister, expirationDate, statusProduct,
idPresentation, idLaboratory',
'\'Tylenol\', \'15 mg/20ml\' , \'100\' , \'5.00\' ,\'10.00\' ,\'EE03459\'
,\'2025-08-08\' ,\'Active\' ,\'Prst-002\' ,\'Lab-002\'');
call insertAnyData('Product','descriptionProduct, concentration, stock, 
cost, salePrice, healthRegister, expirationDate, statusProduct,
idPresentation, idLaboratory',
'\'Hepabionta\', \'10mg /30ml\' , \'50\' , \'10.00\' ,\'15.00\' ,\'EN01867\'
,\'2025-08-08\' ,\'Active\' ,\'Prst-001\' ,\'Lab-003\'');




/*Insert into Provider*/
call insertAnyData('Provider','nameProvider, numIdentification, Address, 
Email, Phone, Bank, numAccount, stateProvider',
'\'ELIFARMA\', \'0933428595\' , \'Av. Heroes del cenepa 1520\' , \'ex@example.com\' 
,\'33425689\' ,\'BCP\',\'0126544949944884\' ,\'Active\'');


/*Insert into Patient*/
call insertAnyData('Patient','namePatient, sex, numIdentification,
 birthdate, email, phone , address',
'\'Ana Maria Salgago\', \'Female\' , \'888888\' , \'1980-08-08\' ,
\'ex@example.com\' ,\'77777777\'
,\'avenida circuvalar\'');
call insertAnyData('Patient','namePatient, sex, numIdentification,
 birthdate, email, phone , address',
'\'Sofia Salgago\', \'Female\' , \'888888\' , \'1980-08-08\' ,
\'ex@example.com\' ,\'77777777\'
,\'avenida circuvalar\'');
call insertAnyData('Patient','namePatient, sex, numIdentification,
 birthdate, email, phone , address',
'\'Antonio Salgago\', \'Male\' , \'888888\' , \'1980-08-08\' ,
\'ex@example.com\' ,\'77777777\'
,\'avenida circuvalar\'');
call insertAnyData('Patient','namePatient, sex, numIdentification,
 birthdate, email, phone , address',
'\'Fernando Salgago\', \'Male\' , \'888888\' , \'1980-08-08\' ,
\'ex@example.com\' ,\'77777777\'
,\'avenida circuvalar\'');


/*Insert into Employee*/
call insertAnyData('Employee','nameEmployee, lastName, job, sex,
 numIdentification, email, phone, address, statusEmployee',
'\'Fernando\', \'Salgado\' ,\'Admin\' ,\'Male\' , \'888888\' ,
\'ex@example.com\' ,\'77777777\',\'avenida circuvalar\' ,\'Active\'');
call insertAnyData('Employee','nameEmployee, lastName, job, sex,
 numIdentification, email, phone, address, statusEmployee',
'\'Fernanda\', \'Salgado\' ,\'Doctor\' ,\'Female\' , \'9999888\' ,
\'ex@example.com\' ,\'77777777\',\'avenida circuvalar\' ,\'Active\'');
call insertAnyData('Employee','nameEmployee, lastName, job, sex,
 numIdentification, email, phone, address, statusEmployee',
'\'Santiago\', \'Martinez\' ,\'Assistant\' ,\'Male\' , \'1111888\' ,
\'ex@example.com\' ,\'77777777\',\'avenida circuvalar\' ,\'Active\'');
call insertAnyData('Employee','nameEmployee, lastName, job, sex,
 numIdentification, email, phone, address, statusEmployee',
'\'Sandra\', \'Martinez\' ,\'Assistant\' ,\'Female\' , \'1177788\' ,
\'ex@example.com\' ,\'77777777\',\'avenida circuvalar\' ,\'Active\'');



/*Insert into Purchase*/
call insertAnyData('Purchase','idEmployee, idProvider, 
datePurchase, payment, total, statusPURCHASE',
'\'Emp-001\', \'Pvr-001\' , \'2019-08-08\' , 
\'paypal\' ,\'1500.00\' ,\'Normal\'');
