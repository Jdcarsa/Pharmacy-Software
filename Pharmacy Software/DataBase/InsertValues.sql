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
    





