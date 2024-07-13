
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