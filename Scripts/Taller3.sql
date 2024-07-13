-- 1. Crear una función que reciba el ID de una sucursal (SucId) y retorne el número de vehículos
--que tiene dicha sucursal, y el número de empleados asociados a dicha sucursal.


SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF

CREATE OR REPLACE FUNCTION numEmpVeh(p_id IN Sucursal.sucId%TYPE) 
  RETURN VARCHAR2
   IS
     v_numVehiculo NUMBER(3);
     v_numEmpleado NUMBER(3);
     v_total VARCHAR2(60);
     noVehiculos EXCEPTION;
     BEGIN
     
        SELECT COUNT(Vehiculo.vehId) 
        INTO v_numVehiculo
        FROM Vehiculo
        WHERE Vehiculo.sucId = p_id;
        
        SELECT COUNT(Empleado.empId)
        INTO v_numEmpleado
        FROM Empleado
        WHERE Empleado.sucId = p_id;
        
        v_total := 'Numero de vehiculos: ' || v_numVehiculo || ' Numero de empleados: ' || v_numEmpleado ;
        
        RETURN v_total ;
        
        IF v_numVehiculo <= 0 THEN
             RAISE noVehiculos;
        END IF;
        
        EXCEPTION 
          WHEN noVehiculos THEN 
             DBMS_OUTPUT.PUT_LINE('La sucursal id: ' || p_id || ' NO tiene vehiculos' );
           WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('La sucursal id: ' || p_id || 'NO se encuentra registrada' );
           WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error' );
        
     END numEmpVeh;
     
DECLARE
  
  v_num VARCHAR2(60);
 BEGIN 
   v_num:=numEmpVeh(&v_idSucursal);
   
     DBMS_OUTPUT.PUT_LINE('La sucursal id: ' || :v_idSucursal || ' tiene ' || v_num  );

 END;
 
SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF

CREATE OR REPLACE FUNCTION obtener_sucursal_con_mas_pedidos(proID IN NUMBER) 
RETURN VARCHAR2 
IS
  v_sucursal SUCURSAL.SUCNOMBRE%TYPE;
BEGIN
  SELECT SUCURSAL.SUCNOMBRE
  INTO v_sucursal
  FROM PEDIDO
  JOIN INCLUYE ON PEDIDO.PEDID = INCLUYE.PEDID
  JOIN SUCURSAL ON PEDIDO.SUCID = SUCURSAL.SUCID
  WHERE INCLUYE.PROID = proID
  GROUP BY PEDIDO.SUCID, SUCURSAL.SUCNOMBRE
  ORDER BY COUNT(*) DESC
  FETCH FIRST 1 ROW ONLY;
  
  RETURN v_sucursal;
END;


DECLARE
  v_proID NUMBER;
  v_sucursal VARCHAR2(50);
BEGIN
    v_proID := &proID;
    v_sucursal := obtener_sucursal_con_mas_pedidos(v_proID);
    DBMS_OUTPUT.PUT_LINE('La sucursal con más pedidos del producto ' || v_proID || ' es: ' || v_sucursal);
END;

 
 /* 3 Crear una función que dado el ID de la sucursal (SucId), obtenga su saldo. El saldo se calcula
de acuerdo con la suma de los valores totales de pedidos realizados (en la tabla pedidos hay
un atributo pedValorTotal que se debe tener en cuenta), menos la suma del valor total de
compras de productos que se han realizado en dicha sucursal (en la tabla Compras, se
almacena la cantidad de productos comprados, y de la tabla productos se debe tomar el
valor de compra, para poder obtener el valor de las compras realizadas).*/


SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF

CREATE OR REPLACE FUNCTION obtenerSaldo(p_id IN Sucursal.sucId%TYPE)
  RETURN Pedido.pedValorTotal%TYPE
    IS 
       v_totalPedidos Pedido.pedValorTotal%TYPE := 0;
       v_totalCompras Producto.proValorCompra%TYPE :=0;
       v_cantidad Compra.comCantidad%TYPE;
       v_totalProducto Producto.proValorCompra%TYPE :=0;
    BEGIN 
         
         FOR pedido IN (SELECT Pedido.pedValorTotal as Total
         INTO v_totalPedidos 
         FROM Pedido
         WHERE Pedido.sucID = p_id)
         LOOP 
         v_totalPedidos := v_totalPedidos + pedido.Total;
         END LOOP;
         
         FOR producto IN (SELECT Compra.comCantidad as Cantidad , Producto.proValorCompra as Valor
                                     FROM Compra JOIN Producto ON ( Compra.proId = Producto.proId)
                                     WHERE Compra.sucId = p_id ) 
          LOOP
              v_cantidad := Producto.Cantidad;
              v_totalProducto := Producto.Valor;
              v_totalCompras := v_totalCompras + (v_cantidad*v_totalProducto);
          END LOOP;
          RETURN  v_totalPedidos - v_totalCompras;   
          
        EXCEPTION 
           WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('La sucursal id: ' || p_id || 'NO se encuentra registrada' );
           WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error' );
                
    END obtenerSaldo;


  DECLARE 
    perdidas EXCEPTION;
    saldo NUMBER(10);
  BEGIN 
   saldo := obtenerSaldo(&v_SucursalID);
   IF saldo < 0 THEN
      RAISE perdidas;
   END IF;
    DBMS_OUTPUT.PUT_LINE('La sucursal id ' || :v_SucursalID || ' Tiene un saldo de: ' || saldo);
     EXCEPTION 
      WHEN  perdidas THEN 
         DBMS_OUTPUT.PUT_LINE('La sucursal id ' || :v_SucursalID || ' Tiene perdidas: ' || saldo);
         
  END;
    
    
SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF
    
 DECLARE 
  TYPE distribuidorRec IS RECORD (
     disId Distribuidor.distId%TYPE,
     disNombre Distribuidor.distNombre%TYPE,
     disDireccion Distribuidor.distDireccion%TYPE,
     disTelefono Distribuidor.distTelefono%TYPE,
     cantidad Compra.comCantidad%TYPE
   );
   v_dis distribuidorRec;
   maxCantidad Compra.comCantidad%TYPE;
  BEGIN
   SELECT MAX(comCantidad)
   INTO maxCantidad
   FROM COMPRA
   WHERE Compra.sucId = &v_SucursalID;
   
   SELECT Distribuidor.distId,Distribuidor.distNombre,Distribuidor.distDireccion,Distribuidor.distTelefono, Compra.comCantidad
   INTO v_dis.disId , v_dis.disNombre , v_dis.disDireccion,v_dis.disTelefono, v_dis.cantidad
   FROM COMPRA JOIN  Distribuidor ON (compra.distId = Distribuidor.distId)
   WHERE Compra.sucId = &v_SucursalID AND Compra.comCantidad = maxCantidad ;
   
   DBMS_OUTPUT.PUT_LINE(v_dis.disId || ' , '|| v_dis.disNombre || ' , '|| v_dis.disDireccion || ' , '||v_dis.disTelefono|| ' , '|| v_dis.cantidad );
 END;
    
SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF
    
   DECLARE 
      TYPE tabla IS TABLE OF Empleado.empNombreCompleto%TYPE INDEX BY PLS_INTEGER;
       t_nombre tabla;
   BEGIN
      SELECT Empleado.empNombreCompleto BULK COLLECT
      INTO t_nombre
      FROM PEDIDO JOIN EMPLEADO ON (Pedido.sucId = Empleado.sucId)
      WHERE Empleado.sucId = &v_sucID AND Pedido.pedEstado = 1;
      
      FOR i IN  t_nombre.FIRST.. t_nombre.LAST LOOP
         DBMS_OUTPUT.PUT_LINE( i || ' ' || t_nombre(i));
      END LOOP;
   END;
    