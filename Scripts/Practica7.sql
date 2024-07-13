/*
1. Realice un Trigger/disparador que, al hacer una inserción de una tupla para una nueva
COMPRA, donde se deben tener en cuenta las tablas (Distribuidor, Compra, Sucursal y
Producto), se controle que NO hayan datos duplicados.
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF

CREATE OR REPLACE TRIGGER tr_noDuplicados
    BEFORE INSERT ON Compra FOR EACH ROW
        DECLARE
            contador NUMBER :=0 ;
        BEGIN
            SELECT COUNT(*)
            INTO contador
            FROM Compra
            WHERE distId = :NEW.distId AND sucId = :NEW.sucId AND proId = :NEW.proId 
            AND compFecha = :NEW.compFecha;
        
                                    
            IF   contador  = 1 THEN
                  RAISE_APPLICATION_ERROR(-20024 , 'Datos duplicados');
            END IF;
            
            EXCEPTION  
                     WHEN NO_DATA_FOUND THEN
                          NULL;          
            
END tr_noDuplicados;

--Activa el trigger
INSERT INTO COMPRA VALUES (6,8003,1,'10/02/22',70);

--Inserccion Correcta
INSERT INTO COMPRA VALUES (6,8003,1,'04/06/23',70);


/* 2. Realice un Trigger/disparador que al hacer una inserción o actualización de una tupla para
la tabla INCLUYE, esta realice automáticamente la inserción de una nueva tupla en la tabla
PEDIDO. Se debe considerar la cantidad de productos obtenidos de la inserción en INCLUYE,
y con esto, se identificará el respectivo valor de venta, para poder calcular el ValorTotal del
pedido, y almacenarlo en la tabla PEDIDO. Se deben almacenar también los otros datos de
cada columna: la fecha del pedido será la fecha del sistema y la fecha de entrega serán 2
días adicionales, el resto de información necesaria, puede ser cualquier dato.*/

CREATE OR REPLACE TRIGGER tr_insertarPedido
    AFTER INSERT OR UPDATE ON Incluye  FOR EACH ROW
        DECLARE
            contador NUMBER :=0 ;
            regIncluye  Incluye%ROWTYPE;
            valorTotal NUMBER;
        BEGIN
            regIncluye.pedId := :NEW.pedId;
            regIncluye.proId := :NEW.proId;
            regIncluye.incCantidad := :NEW.incCantidad;
            
            SELECT (proValorVenta) * regIncluye.incCantidad 
            INTO valorTotal
            FROM Producto
            WHERE proId = regIncluye.proId;
            
            INSERT INTO Pedido VALUES (regIncluye.pedId , NULL , NULL , NULL ,SYSDATE() ,valorTotal , 1 ,  SYSDATE() + 2);
            
            EXCEPTION  
                     WHEN NO_DATA_FOUND THEN
                          NULL;          
            
END  tr_insertarPedido;

--Activacion de triiger 
INSERT INTO Incluye VALUES (2222,11,1);