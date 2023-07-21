


DELIMITER $
CREATE PROCEDURE insertPresentation(IN descriptionPresentation varchar(35))
	BEGIN
		INSERT INTO pharmacy.presentation (descriptionPresentation,
		statePresentation)
		VALUES (descriptionPresentation,'Active');
END $



DELIMITER $
CREATE PROCEDURE updatePresentation(IN pIdPresentation varchar(11), 
				IN pDescriptionPresentation varchar(35))
	BEGIN
        
		UPDATE pharmacy.presentation
        SET descriptionPresentation =  pDescriptionPresentation
        WHERE idPresentation = pIdPresentation;
        
END $

DELIMITER $
CREATE PROCEDURE disablePresentation(IN pIdPresentation varchar(11))
	BEGIN
        
		UPDATE pharmacy.presentation
        SET statePresentation = 'Disable'
        WHERE idPresentation = pIdPresentation;
        
END $

call disablePresentation('Prst-001');



