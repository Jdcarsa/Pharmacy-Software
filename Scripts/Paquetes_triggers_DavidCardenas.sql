
CREATE OR REPLACE PACKAGE PRO_GESTION AS

  CURSOR cur_program RETURN Programa%ROWTYPE;
  
  FUNCTION numEst( p_programaId Programa.programa_id%TYPE)
  RETURN NUMBER;
  
  PROCEDURE guardarDatos ;
  
  
  TYPE reg_prom IS RECORD (
  nombrePrograma Programa.nombre%TYPE,
  fechaCreacion Programa.fecha_creacion%TYPE
  );
  
  TYPE tbAninadaProm IS TABLE OF reg_prom;
  v_tblProm tbAninadaProm;
  
  v_idFacultad Facultad.facultad_id%TYPE;
  
END;


CREATE OR REPLACE PACKAGE BODY PRO_GESTION AS
/* Un cursor que retorne los datos de todos los programas creados antes
del año 2000.*/
  CURSOR cur_program RETURN Programa%ROWTYPE IS
   SELECT * FROM Programa
   WHERE FECHA_CREACION <= TO_DATE('01/01/2000' , 'dd/mm/yyyy');
  /*Una función que retorne el número de estudiantes de un programa
determinado. Se recibe como parámetro el programa_Id. */
  FUNCTION numEst( p_programaId Programa.programa_id%TYPE)
    RETURN NUMBER
      IS 
      v_numEst NUMBER (5) := 0;
      BEGIN
          SELECT COUNT(Estudiante.codigo)
          INTO v_numEst
          FROM Estudiante
          WHERE Estudiante.programa_id = p_programaId;
      RETURN v_numEst;
       EXCEPTION 
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error.');
      END numEst;
      
      /* Un procedimiento que guarde en una tabla anidada pública del
paquete Nombre y Fecha de creación de todos los programas.*/

      PROCEDURE guardarDatos
        IS
        BEGIN 
         SELECT Programa.nombre , Programa.fecha_creacion
         BULK COLLECT INTO v_tblProm 
         FROM Programa;
         EXCEPTION 
           WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error.');
        END guardarDatos;
      
END;

/* Cree un bloque anónimo que muestre los nombres de los programas
creados antes del año 2000 usando el cursor creado en el punto anterior.*/
SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF
BEGIN 
  FOR reg_programa IN PRO_GESTION.cur_program LOOP
    DBMS_OUTPUT.PUT_LINE('Programa : ' || reg_programa.nombre || ' Id: ' || reg_programa.programa_id 
    || ' Fecha Creacion: ' || reg_programa.fecha_creacion || ' Facultad Id: ' || reg_programa.facultad_id);
    END LOOP;

END;

/*Cree un bloque anónimo que use la función del paquete creado en el
primer punto. */
SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero de estudiantes : ' || PRO_GESTION.numEst(11) || ' Programa id: 11');
END;


--Crear un trigger que no permita insertar más de 5 facultades.
CREATE OR REPLACE TRIGGER tr_noInsertar
    BEFORE INSERT ON FACULTAD
       DECLARE 
          v_numFilas NUMBER;
          BEGIN
             SELECT COUNT(Facultad.facultad_id) 
             INTO v_numFilas
             FROM Facultad;
             IF v_numFilas = 5 THEN
                RAISE_APPLICATION_ERROR(-20025 , 'NO se pueden ingresar mas de 5 facultades');
            END IF;
            EXCEPTION 
              WHEN OTHERS THEN
                  RAISE_APPLICATION_ERROR(-20025 , 'NO se pueden ingresar mas de 5 facultades');
        END;
        
-- PRUEBA DE FUNCIONAMIENTO tr_noINSERTAR
INSERT INTO FACULTAD (FACULTAD_ID, NOMBRE,PRESUPUESTOANUAL,TOTALSALARIOS) VALUES (400,'Sistemas',2000000,0);
INSERT INTO FACULTAD (FACULTAD_ID, NOMBRE,PRESUPUESTOANUAL,TOTALSALARIOS) VALUES (500,'Educacion',2000000,0);
INSERT INTO FACULTAD (FACULTAD_ID, NOMBRE,PRESUPUESTOANUAL,TOTALSALARIOS) VALUES (600,'Civil',2000000,0);


/* Crear un trigger que evite que se
asocie un estudiante a un
programa que pertenezca a una
facultad sin profesores. Recuerde
que el campo Programa_Id del
estudiante puede ser nulo.*/


CREATE OR REPLACE TRIGGER tr_verificaProfesores
    BEFORE INSERT ON Estudiante FOR EACH ROW
      WHEN ( NEW.programa_id IS NOT NULL)
       DECLARE 
          v_numProfs NUMBER;
          BEGIN
             SELECT COUNT(Profesor.cedula) 
             INTO v_numProfs
             FROM Programa JOIN Profesor ON (Profesor.facultad_id = Programa.facultad_id) 
             WHERE Programa.programa_id = :NEW.programa_id;
             IF v_numProfs = 0 THEN
                RAISE_APPLICATION_ERROR(-20024 , 'NO se pueden ingresar estudiantes a un programa sin profesores');
            END IF;
        END;

--Prueba de funcionamiento tr_verificaProfsores
INSERT INTO PROGRAMA (PROGRAMA_ID, NOMBRE,	FECHA_CREACION, FACULTAD_ID)VALUES (35, 'Edu.Fisica','10/12/1952',500);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (300,'Juan Ordoñez','20/09/1985',3.0,35);

/*Crear un trigger que no permita tener más de 10 estudiantes por
programa. */
CREATE OR REPLACE TRIGGER tr_noEstudiantePrograma
    BEFORE INSERT ON ESTUDIANTE FOR EACH ROW
    WHEN ( NEW.programa_id IS NOT NULL)
       DECLARE 
          v_numFilas NUMBER;
          BEGIN
             SELECT COUNT(Estudiante.codigo) 
             INTO v_numFilas
             FROM Estudiante 
             WHERE Estudiante.programa_id = :NEW.programa_id;
             
             IF v_numFilas = 10 THEN
                RAISE_APPLICATION_ERROR(-20027 , 'NO se pueden ingresar mas de 10 estudiantes por programas');
            END IF;
        END;
--Prueba de funcionaiento del trigger
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (110,'Laura Zambrano','20/09/1985',3.0,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (113,'Jose Flores','20/09/1985',3.0,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (114,'Julian Lopez','20/09/1985',3.0,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (115,'Erika Valencia','20/09/1985',3.0,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (116,'Juan Rodriguez','20/09/1985',3.0,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (117,'Sandra Ortiz','20/09/1985',3.0,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (118,'Robert Rojas','20/09/1985',3.0,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (119,'Juan Martinez','20/09/1985',3.0,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)VALUES (101,'Luis Martinez','20/09/1985',3.0,11);



/*
Cada vez que se intenta insertar un programa con una Facultad_id que no
existe, se dispara un trigger que crea una facultad con el id proporcionado
y nombre: ‘FacultadTemporal’.
*/
SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF

CREATE OR REPLACE TRIGGER tr_noExisteFacultad
    BEFORE INSERT ON PROGRAMA FOR EACH ROW
       DECLARE 
          v_idFacultad Facultad.facultad_id%TYPE := 0;
          BEGIN
          
          SELECT COUNT(facultad_id)
          INTO v_idFacultad
          FROM facultad
          WHERE facultad_id = :NEW.facultad_id;
          
          IF v_idFacultad = 0  THEN
              DBMS_OUTPUT.PUT_LINE('NO existe una facultad con el id: ' || :NEW.facultad_id  || ' Se procedera a crear una nueva');
              INSERT INTO FACULTAD (FACULTAD_ID, NOMBRE,PRESUPUESTOANUAL,TOTALSALARIOS) 
              VALUES (:NEW.facultad_id,'Facultad Temporal' , NULL , NULL );
          END IF;
        END;
        
INSERT INTO PROGRAMA (PROGRAMA_ID, NOMBRE,	FECHA_CREACION, FACULTAD_ID)VALUES (111, 'Lic Matematicas','10/12/1952',1);
        
        
/* Tabla mutante */
--Primer trigger
CREATE OR REPLACE TRIGGER tr_act_salarios
  AFTER UPDATE OF SALARIO OR DELETE  ON PROFESOR FOR EACH ROW
  BEGIN 
       SELECT Facultad.facultad_id
       INTO PRO_GESTION.v_idFacultad
       FROM Facultad
       WHERE Facultad.facultad_id = :NEW.facultad_id;
  END;
  
  
 --Segundo trigger 
CREATE OR REPLACE TRIGGER tr_act_salarios_2
  AFTER UPDATE OF SALARIO OR DELETE  ON PROFESOR
  DECLARE 
  v_total Profesor.salario%TYPE;
  BEGIN 
       SELECT SUM(Profesor.salario)
       INTO v_total
       FROM Profesor
       WHERE Profesor.facultad_id = PRO_GESTION.v_idFacultad;
       
       UPDATE  Facultad  
       SET  Facultad.totalSalarios = v_total 
       WHERE Facultad.facultad_id = PRO_GESTION.v_idFacultad;
  END;
  
--Prueba de funcionamiento de triger actualizar salarios
UPDATE PROFESOR SET SALARIO = 400  WHERE CEDULA = 111;

--Trigger compuesto
CREATE OR REPLACE TRIGGER tr_compuesto_sal
  FOR  UPDATE OF SALARIO OR DELETE  ON PROFESOR COMPOUND TRIGGER
   
    v_total Profesor.salario%TYPE;
    
      AFTER EACH ROW IS 
         BEGIN
            SELECT Facultad.facultad_id
            INTO PRO_GESTION.v_idFacultad
            FROM Facultad
             WHERE Facultad.facultad_id = :NEW.facultad_id;
         END AFTER EACH ROW;
         
         
      AFTER STATEMENT IS
        BEGIN
            SELECT SUM(Profesor.salario)
             INTO v_total
             FROM Profesor
            WHERE Profesor.facultad_id = PRO_GESTION.v_idFacultad;
            
            UPDATE  Facultad  
            SET  Facultad.totalSalarios = v_total 
            WHERE Facultad.facultad_id = PRO_GESTION.v_idFacultad;
        END AFTER STATEMENT;
        
   END;
   
--Comprobracion de trigger compuesto , desativar el trigger anterior "tr_act_salario 1 y 2"
   UPDATE PROFESOR SET SALARIO = 400  WHERE CEDULA = 333;