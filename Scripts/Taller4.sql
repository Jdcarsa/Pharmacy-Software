-- 2. Crear un procedimiento almacenado que reciba una cadena y visualice el apellido y el cargo
--de todos los empleados cuyo apellido contenga la cadena especificada. Al finalizar visualizar
--el n�mero de empleados mostrados, que cumplen esa condici�n.

SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF
CREATE OR REPLACE PROCEDURE mostrarEmpleados ( p_cadena  Empleado.empApellidos%TYPE)
   IS 
      CURSOR curEmpleado IS
         SELECT Empleado.empApellidos , Cargo.carNombre
         FROM Empleado JOIN Cargo  ON (Empleado.carId = Cargo.carId)
         WHERE Empleado.empApellidos LIKE '%' || p_cadena || '%';
         
         v_contador NUMBER := 0;
      BEGIN
               FOR resEmp IN curEmpleado LOOP
                  DBMS_OUTPUT.PUT_LINE('Apellidos empleado: ' ||resEmp.empApellidos||' Cargo:' || resEmp.carNombre);
                  v_contador := v_contador + 1;
               END LOOP;
               IF v_contador = 0 THEN
                     RAISE_APPLICATION_ERROR(-20002, 'No existen personas con la cadena: ' || p_cadena);
                  END IF;
                  DBMS_OUTPUT.PUT_LINE('Numero de empleados que contienen ( ' || p_cadena || ' ) : ' ||v_contador);
                  EXCEPTION 
                     WHEN NO_DATA_FOUND THEN
                        DBMS_OUTPUT.PUT_LINE( 'No existen personas con la cadena: ' || p_cadena);
                  WHEN OTHERS THEN
                        DBMS_OUTPUT.PUT_LINE( 'No existen personas con la cadena: ' || p_cadena);
      END mostrarEmpleados;
      

--Ejecutar el segundo punto
EXECUTE mostrarEmpleados('&v_cadenaConcidencia');