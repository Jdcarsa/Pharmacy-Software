--Punto 1

SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF

CREATE OR REPLACE PROCEDURE  mostrarDatosSucursal(p_idSucursal  Sucursal.sucId%TYPE)
   AS
   v_totalVendido Pedido.pedValorTotal%TYPE;
   v_totalComprado Pedido.pedValorTotal%TYPE;
   v_ganancia Pedido.pedValorTotal%TYPE;
   BEGIN
      SELECT SUM(Pedido.pedValorTotal)
      INTO v_totalVendido
      FROM Pedido
      WHERE Pedido.sucId = p_idSucursal;
      
      
      SELECT SUM(Compra.comCantidad*Producto.proValorCompra)
      INTO v_totalComprado
      FROM Compra JOIN Producto ON(Compra.proId = Producto.proId)
      WHERE Compra.sucId = p_idSucursal;
   
      v_ganancia := v_totalVendido - v_totalComprado;
      
       IF v_ganancia < 0 THEN
         DBMS_OUTPUT.PUT_LINE('Sucursal id: ' || p_idSucursal || ' Total vendido: ' || v_totalvendido 
          ||  ' Total comprado: '|| v_totalcomprado || ' La sucursal tiene una perdida de : ' ||v_ganancia);
       ELSE
          DBMS_OUTPUT.PUT_LINE('Sucursal id: ' || p_idSucursal || ' Total vendido: ' || v_totalvendido 
          ||  ' Total comprado: '|| v_totalcomprado || ' Ganancia: ' ||v_ganancia);
       END IF;
       
      
   END mostrarDatosSucursal;
   
   
   BEGIN 
      mostrarDatosSucursal(&p_idSucursal);
   END;

--punto 2
SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF

CREATE OR REPLACE PROCEDURE mostrarEmpleadosSucursal(p_idSucursal Sucursal.SUCID%TYPE)
    AS
        v_NombreCompleto Empleado.EmpNombre%TYPE;
        v_Cargo Cargo.CarNombre%TYPE;
        v_NombreJefe Empleado.EmpNombre%TYPE;
    BEGIN
    FOR empleado IN(
        SELECT e.EmpNombre || ' ' || e.EmpApellidos AS nombre_completo, 
               c.CarNombre AS cargo, 
               j.EmpNombre || ' ' || j.EmpApellidos AS nombre_jefe
        FROM EMPLEADO e INNER JOIN CARGO c ON e.CarID = c.CarId
        LEFT JOIN Empleado j ON e.Jefe_EmpId = j.EmpId
        WHERE e.SUCID = p_idSucursal)
    LOOP
        v_NombreCompleto := empleado.nombre_completo;
        v_Cargo := empleado.cargo;
        v_NombreJefe := empleado.nombre_jefe;
        DBMS_OUTPUT.PUT_LINE(v_NombreCompleto ||  ', ' || v_Cargo || ', ' || v_NombreJefe);
    END LOOP;

    END mostrarEmpleadosSucursal;
    
    BEGIN
        mostrarEmpleadosSucursal(&p_idSucursal);
    END;
    
--Punto 3

SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF

CREATE OR REPLACE PROCEDURE muestraProducto
   AS
   v_cantidad Compra.comCantidad%TYPE;
   v_totalComprado Pedido.pedValorTotal%TYPE;
   v_producto Producto%ROWTYPE;
   v_idProd Producto.proId%TYPE;
   v_suma Compra.comCantidad%TYPE;
   BEGIN      
   
      SELECT MAX(suma)
      INTO v_cantidad 
      FROM (SELECT Compra.proId,SUM(Compra.comCantidad)  as suma
      FROM Compra
      GROUP BY Compra.proId);
      
      SELECT proId
      INTO v_idProd 
      FROM (SELECT Compra.proId,SUM(Compra.comCantidad)  as suma
      FROM Compra
      GROUP BY Compra.proId)
      WHERE suma = v_cantidad;
  
      SELECT *
      INTO v_producto
      FROM Producto
      WHERE Producto.proId = v_idProd;
      
        v_totalComprado := v_producto.proValorCompra * v_cantidad;
      
        DBMS_OUTPUT.PUT_LINE('Producto: ' || v_producto.proNombre 
        || ', Precio de compra: ' || v_producto.proValorCompra 
        ||  ', Precio de venta: '|| v_producto.proValorVenta || ', Cantidad: ' 
        ||v_cantidad  || ', Valor total de las compras: '|| v_totalComprado);
       
   END muestraProducto;
   

    BEGIN 
        muestraProducto;
    END;






