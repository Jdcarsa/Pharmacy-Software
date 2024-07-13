
DROP TABLE ESTUDIANTE CASCADE CONSTRAINTS;
DROP TABLE FACULTAD CASCADE CONSTRAINTS;
DROP TABLE PROFESOR CASCADE CONSTRAINTS;
DROP TABLE PROGRAMA CASCADE CONSTRAINTS;


CREATE TABLE ESTUDIANTE 
   (CODIGO NUMBER, 
	NOMBRE VARCHAR2(100), 
	FECHA_NACIMIENTO DATE,
	PROMEDIO NUMBER(2,1), 
	PROGRAMA_ID NUMBER
   );
--------------------------------------------------------
--  DDL for Table FACULTAD
--------------------------------------------------------

  CREATE TABLE FACULTAD 
   (	FACULTAD_ID NUMBER, 
	NOMBRE VARCHAR2(100), 
	PRESUPUESTOANUAL NUMBER(10,2), 
	TOTALSALARIOS NUMBER(10,2)
   );
--------------------------------------------------------
--  DDL for Table PROFESOR
--------------------------------------------------------

  CREATE TABLE PROFESOR 
   (	CEDULA NUMBER, 
	NOMBRE VARCHAR2(100), 
	SALARIO NUMBER(10,2), 
	FACULTAD_ID NUMBER
   );
--------------------------------------------------------
--  DDL for Table PROGRAMA
--------------------------------------------------------

  CREATE TABLE PROGRAMA 
   (	PROGRAMA_ID NUMBER, 
	NOMBRE VARCHAR2(100),
	FECHA_CREACION DATE, 
	FACULTAD_ID NUMBER
   );
--------------------------------------------------------
--  Constraints for Table PROFESOR
--------------------------------------------------------

  ALTER TABLE PROFESOR MODIFY (CEDULA NOT NULL ENABLE);
  ALTER TABLE PROFESOR MODIFY (NOMBRE NOT NULL ENABLE);
  ALTER TABLE PROFESOR ADD CONSTRAINT PROFESOR_PK PRIMARY KEY (CEDULA) ENABLE;
--------------------------------------------------------
--  Constraints for Table PROGRAMA
--------------------------------------------------------

  ALTER TABLE PROGRAMA MODIFY (PROGRAMA_ID NOT NULL ENABLE);
  ALTER TABLE PROGRAMA MODIFY (NOMBRE NOT NULL ENABLE);
  ALTER TABLE PROGRAMA ADD CONSTRAINT PROGRAMA_PK PRIMARY KEY (PROGRAMA_ID) ENABLE;
--------------------------------------------------------
--  Constraints for Table ESTUDIANTE
--------------------------------------------------------

  ALTER TABLE ESTUDIANTE MODIFY (CODIGO NOT NULL ENABLE);
  ALTER TABLE ESTUDIANTE MODIFY (NOMBRE NOT NULL ENABLE);
  ALTER TABLE ESTUDIANTE MODIFY (PROMEDIO NOT NULL ENABLE);
  ALTER TABLE ESTUDIANTE ADD CONSTRAINT ESTUDIANTE_PK PRIMARY KEY (CODIGO) ENABLE;
--------------------------------------------------------
--  Constraints for Table FACULTAD
--------------------------------------------------------

  ALTER TABLE FACULTAD MODIFY (FACULTAD_ID NOT NULL ENABLE);
  ALTER TABLE FACULTAD MODIFY (NOMBRE NOT NULL ENABLE);
  ALTER TABLE FACULTAD ADD CONSTRAINT FACULTAD_PK PRIMARY KEY (FACULTAD_ID) ENABLE;


--FACULTADES --

INSERT INTO FACULTAD (FACULTAD_ID, NOMBRE,PRESUPUESTOANUAL,
	TOTALSALARIOS) VALUES (100,'ARTES',1000000,0);
INSERT INTO FACULTAD (FACULTAD_ID, NOMBRE,PRESUPUESTOANUAL,
	TOTALSALARIOS) VALUES (200,'DERECHO',11000000,0);
INSERT INTO FACULTAD (FACULTAD_ID, NOMBRE,PRESUPUESTOANUAL,
	TOTALSALARIOS) VALUES (300,'ELECTRONICA',0,0);

--PROGRAMAS--

INSERT INTO PROGRAMA (PROGRAMA_ID, NOMBRE,	FECHA_CREACION, FACULTAD_ID)
VALUES (11, 'ARTES PLASTICAS','10/12/1952',100);
INSERT INTO PROGRAMA (PROGRAMA_ID, NOMBRE,	FECHA_CREACION, FACULTAD_ID)VALUES (12, 'DISEÑO GRAFICO','18/10/1958',100);

INSERT INTO PROGRAMA (PROGRAMA_ID, NOMBRE,	FECHA_CREACION, FACULTAD_ID)VALUES (21, 'CIENCIAS POLITICAS','10/12/2000',200);
INSERT INTO PROGRAMA (PROGRAMA_ID, NOMBRE,	FECHA_CREACION, FACULTAD_ID)VALUES (22, 'DERECHO','10/03/1945',200);

INSERT INTO PROGRAMA (PROGRAMA_ID, NOMBRE,	FECHA_CREACION, FACULTAD_ID)VALUES (31, 'SISTEMAS','10/02/1999',300);
INSERT INTO PROGRAMA (PROGRAMA_ID, NOMBRE,	FECHA_CREACION, FACULTAD_ID)VALUES (32, 'ELECTRONICA','10/12/1852',300);

-- ESTUDIANTES --

INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (111,'Claudia Muñoz','20/03/1976',4.2,11);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (112,'Ciro Velasco','2/04/1986',3.7,11);

INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (121,'Adriana Vargas','13/07/1979',3.5,12);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (122,'Wilson Mosquera','5/05/1996',3.5,12);

INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (211,'Jhoana Sanchez','23/11/1981',3.8,21);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (212,'Dany Gonzalez','11/01/1973',3.9,21);

INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (221,'Karen Ordoñez','20/09/1985',3.0,22);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (222,'Libio Palechor','17/06/1956',3.3,22);

INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (311,'Alexandra Diaz','15/04/1979',4.0,31);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (312,'Juan Paz','25/07/2000',4.3,31);

INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (321,'Dagoberto Romero','18/08/2001',3.4,32);
INSERT INTO ESTUDIANTE (CODIGO, NOMBRE,FECHA_NACIMIENTO, PROMEDIO,PROGRAMA_ID)
VALUES (322,'Lizandro Castillo','3/10/1996',3.7,32);

--PROFESORES ---

INSERT INTO PROFESOR (CEDULA,NOMBRE,SALARIO,FACULTAD_ID)
VALUES (3453,'Eliana Garces',800,100);
INSERT INTO PROFESOR (CEDULA,NOMBRE,SALARIO,FACULTAD_ID)
VALUES (5158,'Edwin Alarcon',800,100);

INSERT INTO PROFESOR (CEDULA,NOMBRE,SALARIO,FACULTAD_ID)
VALUES (3384,'Elizabeth Piedrahita',200,200);
INSERT INTO PROFESOR (CEDULA,NOMBRE,SALARIO,FACULTAD_ID)
VALUES (5834,'Robert Realpe',500,200);

INSERT INTO PROFESOR (CEDULA,NOMBRE,SALARIO,FACULTAD_ID)
VALUES (9149,'Nestor Diaz',500,300);
INSERT INTO PROFESOR (CEDULA,NOMBRE,SALARIO,FACULTAD_ID)
VALUES (2528,'Sara Garces',300,300);


-- Elaborado por JESUS DAVID CARDENAS SANDOVAL 

--Cree un bloque anónimo que pida al usuario el código de un estudiante
--e imprima su nombre.

SET SERVEROUTPUT ON

DECLARE
   v_nombre Estudiante.nombre%TYPE;

BEGIN 
    SELECT Estudiante.nombre 
    INTO v_nombre
    FROM Estudiante
    WHERE  Estudiante.codigo = &v_codigo;
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
END;

------------------------------------------------------------------------------------------------------------------------------------
/*Cree un procedimiento almacenado que reciba como parámetro el
código de un estudiante e imprima en pantalla: el nombre del estudiante,
el código y el programa al que pertenece, con un mensaje como el
siguiente: “El estudiante Juan Paz con código 312 estudia SISTEMAS.”
*/

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE mostrarEstudiante(v_codigo Estudiante.codigo%TYPE)
   AS
     v_nombre Estudiante.nombre%TYPE;
     v_programaID Estudiante.programa_ID%TYPE;
     v_nombrePrograma Programa.nombre%TYPE;
     
     BEGIN
         SELECT Estudiante.nombre , Estudiante.programa_ID , Programa.nombre
         INTO v_nombre,v_programaID, v_nombrePrograma
         FROM Estudiante INNER JOIN Programa ON (Estudiante.programa_ID = Programa.programa_ID)
         WHERE Estudiante.codigo = v_codigo;
         
         DBMS_OUTPUT.PUT_LINE('El estudiante ' || v_nombre || ' con codigo ' || v_codigo || ' estudia ' || v_nombrePrograma);
     END mostrarEstudiante;


  
  BEGIN
  
    mostrarEstudiante(112);
   
  END;
  ------------------------------------------------------------------------------------------------------------------------------------
  /*Cree un procedimiento almacenado que reciba como parámetro el id
de la facultad, y si el presupuesto anual es cero muestre el mensaje por
ejemplo: “La facultad ELECTRONICA no tiene presupuesto” en caso
contrario muestre el presupuesto asignado, por ejemplo: “La facultad
DERECHO tiene un presupuesto de: $11,000,000.00”*/


--Solucion-----------------------------------------------------------------------------------------------------------
  CREATE OR REPLACE PROCEDURE presupuesto(v_id Facultad.facultad_id%TYPE)
   AS
     v_nombre  Facultad.nombre%TYPE;
     v_presupuestoAnual  Facultad.presupuestoAnual%TYPE;
     
     BEGIN
         SELECT Facultad.nombre ,  Facultad.presupuestoAnual 
         INTO v_nombre,v_presupuestoAnual 
         FROM Facultad 
         WHERE Facultad.facultad_id = v_id;
         
         IF v_presupuestoAnual = 0 THEN
            DBMS_OUTPUT.PUT_LINE('La facultad ' || v_nombre || 'NO tiene presupuesto');
        ELSE
           DBMS_OUTPUT.PUT_LINE('La facultad ' || v_nombre || ' tiene presupuesto de '  || TO_CHAR(v_presupuestoAnual, '$999,999,999.00'));
        END IF;
         
     END presupuesto;

  BEGIN
  
    presupuesto(100);
    presupuesto(200);
   
  END;
  
------------------------------------------------------------------------------------------------------------------------------------
/*Cree un procedimiento almacenado que calcule la suma de los salarios de
todos los profesores de una facultad (el id de la facultad se recibe como
parámetro). Si la suma es mayor que el presupuesto anual de la facultad se
muestra el mensaje “La facultad ELECTRONICA no tiene presupuesto para
salarios”, en caso contrario se muestra “La facultad DERECHO tiene un
presupuesto de: $11,000,000.00 de los cuales gasta en salarios $700.00”.*/
 
 
 CREATE OR REPLACE PROCEDURE sumaSalario(p_id Facultad.facultad_id%TYPE)
   AS
     v_nombre  Facultad.nombre%TYPE;
     v_presupuestoAnual  Facultad.presupuestoAnual%TYPE;
     v_suma Profesor.salario%TYPE;
     
     BEGIN
         SELECT SUM(Profesor.salario)
         INTO v_suma
         FROM Profesor
         WHERE Profesor.facultad_id = p_id;
         
         SELECT Facultad.nombre ,  Facultad.presupuestoAnual  
         INTO v_nombre,v_presupuestoAnual 
         FROM Facultad 
         WHERE Facultad.facultad_id = p_id;
         
         IF v_suma > v_presupuestoAnual  THEN
            DBMS_OUTPUT.PUT_LINE('La facultad ' || v_nombre || 'NO tiene presupuesto para salarios');
        ELSE
           DBMS_OUTPUT.PUT_LINE('La facultad ' || v_nombre || ' tiene presupuesto de '  || TO_CHAR(v_presupuestoAnual, '$999,999,999.00'));
           DBMS_OUTPUT.PUT_LINE('de los cuales se gasta ' || TO_CHAR(v_suma, '$999,999,999.00')  || ' en salarios');
        END IF;
         
     END sumaSalario;
     
 BEGIN
  
    sumaSalario(200);
    sumaSalario(300);
   
  END;

------------------------------------------------------------------------------------------------------------------------------------
/* 
Cree un bloque anónimo donde declare cuatro variables: v_cedula,
v_nombre, v_salario y v_idFacultad que serán del mismo tipo de dato de las
columnas respectivas de la tabla Profesor, y que tendrán asignados los datos:
333 para la cedula, ‘profesor1’(para el nombre), 2000 (para salario) y 300
(para facultad). Inserte en la tabla profesor, dicho nombre y el salario
multiplicado por dos. Posteriormente, a través de un bucle simple, continue
haciendo inserciones en la tabla, en cada ciclo: el salario será incrementado
en 1000 y se saldrá del bucle, cuando el salario sea mayor a 10000. Además
tenga en cuenta que la cédula empezará en 333 y se incrementará en cada
ciclo en 111.
Ejecute el procedimiento y despliegue los datos de la tabla professor.
*/

DECLARE 
  v_cedula Profesor.cedula%TYPE := 333;
  v_nombre Profesor.nombre%TYPE := 'Profesor1';
  v_salario Profesor.salario%TYPE := 2000;
  v_idFacultad Profesor.facultad_id%TYPE := 300;

BEGIN

  INSERT INTO PROFESOR (Cedula,Nombre,Salario,Facultad_id)
  VALUES(v_cedula,v_nombre,v_salario*2,v_idFacultad);
  
  WHILE v_salario < 10000 LOOP
             v_salario := v_salario + 1000;
             v_cedula := v_cedula + 111;
             INSERT INTO PROFESOR (Cedula,Nombre,Salario,Facultad_id)
             VALUES(v_cedula,v_nombre,v_salario,v_idFacultad);
    END LOOP;
END;

-- Ejecucion de la tabla profesor
SELECT * 
FROM Profesor;