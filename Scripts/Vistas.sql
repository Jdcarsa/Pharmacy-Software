CREATE OR REPLACE VIEW DETALLES_PROGRAMA 
  AS 
     SELECT P.programa_id , P.nombre nombre_programa, 
    P.fecha_creacion , F.facultad_id , F.nombre nombre_facultad
     
     FROM Programa P INNER JOIN Facultad F ON (P.facultad_id = F.facultad_id);
     

CREATE OR REPLACE TRIGGER  tr_programaDetalles
  INSTEAD OF INSERT ON DETALLES_PROGRAMA FOR EACH ROW 
       DECLARE 
         NUMPRO NUMBER;
         NUMFAC NUMBER;
         
         BEGIN 
           SELECT COUNT(*) INTO NUMFAC
           FROM FACULTAD
           WHERE FACULTAD_ID = :NEW.FACULTAD_ID;
           
           SELECT COUNT(*) INTO NUMPRO
           FROM PROGRAMA
           WHERE PROGRAMA_ID = :NEW.PROGRAMA_ID;
           
           IF NUMFAC = 0 THEN
              INSERT INTO FACULTAD (FACULTAD_ID , NOMBRE) VALUES (:NEW.FACULTAD_ID , :NEW.NOMBRE_FACULTAD);
           END IF;
           
           IF NUMPRO = 0 THEN
               INSERT INTO PROGRAMA VALUES (:NEW.PROGRAMA_ID , :NEW.NOMBRE_PROGRAMA , NULL , :NEW.FACULTAD_ID);
           END IF;
END;     


INSERT INTO DETALLES_PROGRAMA  VALUES (10,'medicina' , '13/07/2011',12,'SALUD');

SELECT * FROM detalles_programa;