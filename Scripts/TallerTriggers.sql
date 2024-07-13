/*  
Cree un trigger/disparador que actualice el valor del campo ValorTotal de la tabla Pedido
cuando se modifique el valor de incCantidad de la tabla Incluye.
a. Ejemplo: si el pedido incluía 5 pizzas cada una a 1.000 pesos el valor total debería
estar en 5.000. Si se modifica la cantidad de 5 a 10 debería cambiar el valor total a
10.000.
*/


SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF


CREATE OR REPLACE PACKAGE gestionIncluye AS

  vPedId Pedido.pedId%TYPE;
  vProId Producto.proId%TYPE;
END;

CREATE OR REPLACE TRIGGER tr_actValorTotal
    FOR UPDATE OF incCantidad ON Incluye COMPOUND TRIGGER
            vNuevaCantidad NUMBER:= :New.incCantidad;
            vPrecio NUMBER := 0;
            AFTER EACH ROW IS 
                        BEGIN
                            SELECT pedId 
                            INTO    gestionIncluye.vPedId
                            FROM  Pedido
                            WHERE pedId = :NEW.pedId;
                            
                            SELECT proId
                            INTO    gestionIncluye.vProId
                            FROM  Producto
                            WHERE proId = :NEW.proId;
                            
                     EXCEPTION  
                                 WHEN NO_DATA_FOUND THEN
                                    DBMS_OUTPUT.PUT_LINE('Los datos ingresados no existen');
                                  WHEN OTHERS THEN  
                                    DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error');
            END AFTER EACH ROW;
            
            AFTER STATEMENT IS
                            BEGIN
                            SELECT  producto.proValorVenta
                            INTO    vPrecio
                            FROM  Producto 
                            WHERE proId = gestionIncluye.vProId;
                            
                            UPDATE Pedido
                            SET Pedido.pedValorTotal = vNuevaCantidad * vPrecio
                            WHERE Pedido.pedId = gestionIncluye.vPedId;
                            
                       EXCEPTION  
                                 WHEN NO_DATA_FOUND THEN
                                    DBMS_OUTPUT.PUT_LINE('Los datos ingresados no existen');
                                  WHEN OTHERS THEN  
                                    DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error');
            END AFTER STATEMENT;

        END tr_actValorTotal;    
        
--Lineas de actualizacion correcta
    UPDATE Incluye  SET incCantidad = 20  WHERE pedId = 1001 AND proId = 1;
    UPDATE Incluye  SET incCantidad = 16  WHERE pedId = 1001 AND proId = 7;
    
--Lines De error
  UPDATE Incluye  SET incCantidad = 20  WHERE pedId = 1001 AND proId = 2;
  UPDATE Incluye  SET incCantidad = 16  WHERE pedId = 1016 AND proId = 7;