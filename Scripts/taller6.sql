--Ejercicio guia , para guiarse de como hacer lo demas , es muy similar
CREATE OR REPLACE PACKAGE pedidoGestion AS

  PROCEDURE adicionarProductos (  v_cantidad NUMBER  , v_nombre Producto.proNombre%TYPE);
  
    TYPE reg_producto IS RECORD (
    proId Producto.proId%TYPE,
     total NUMBER 
  );
  
  TYPE productosPendientes IS TABLE OF reg_producto;
  
  v_tblProPend productosPendientes;
  
  PROCEDURE establecerIdS ( v_nombre  Sucursal.sucNombre%TYPE);
  
  v_idSucursal Sucursal.sucId%TYPE;

  PROCEDURE esteblecerIdC (v_nombre Cliente.cliNombre%TYPE , v_tel Cliente.cliTelefono%TYPE );
  
  v_idCliente Cliente.cliId%TYPE;

 PROCEDURE esteblecerIdE (v_nombre Empleado.empNombre%TYPE);

 v_idEmpleado Empleado.empId%TYPE;
 
PROCEDURE guardarPedido(v_cantidad NUMBER  , v_nombreP Producto.proNombre%TYPE,
         v_nombreS  Sucursal.sucNombre%TYPE,v_nombreC Cliente.cliNombre%TYPE , v_tel Cliente.cliTelefono%TYPE,
         v_nombreE Empleado.empNombre%TYPE, v_peId NUMBER );
 
END pedidoGestion;


--Ejercicio guia BODY  , para guiarse de como hacer lo demas , es muy similar 
CREATE OR REPLACE PACKAGE BODY pedidoGestion AS



    PROCEDURE adicionarProductos (  v_cantidad NUMBER  , v_nombre Producto.proNombre%TYPE)
        IS
            BEGIN
                SELECT proId , provalorventa*v_cantidad
                BULK COLLECT INTO v_tblProPend
                FROM Producto
                WHERE pronombre LIKE  '%' || v_nombre || '%' ;
            END adicionarProductos ;
     
    PROCEDURE establecerIdS ( v_nombre  Sucursal.sucNombre%TYPE)
        IS
        BEGIN
                SELECT sucId
                INTO v_idSucursal
                FROM Sucursal
                WHERE sucnombre LIKE '%' || v_nombre || '%';
        END establecerIdS;


    PROCEDURE esteblecerIdC ( v_nombre Cliente.cliNombre%TYPE , v_tel Cliente.cliTelefono%TYPE)
        IS
        BEGIN
                SELECT cliId
                INTO v_idCliente
                FROM Cliente
                WHERE cliNombre LIKE '%' || v_nombre || '%' OR cliTelefono = v_tel;
        END esteblecerIdC;
        
            PROCEDURE  esteblecerIdE (v_nombre Empleado.empNombre%TYPE)
                IS
                BEGIN
                        SELECT empId
                        INTO v_idEmpleado
                        FROM Empleado
                        WHERE empNombreCompleto LIKE '%' || v_nombre || '%' AND Empleado.sucId = v_idSucursal;
        END esteblecerIdE;
        

        PROCEDURE guardarPedido(v_cantidad NUMBER  , v_nombreP Producto.proNombre%TYPE,
         v_nombreS  Sucursal.sucNombre%TYPE,v_nombreC Cliente.cliNombre%TYPE , v_tel Cliente.cliTelefono%TYPE,
         v_nombreE Empleado.empNombre%TYPE, v_peId NUMBER )
            IS  
                fechaEntrega DATE;
                BEGIN
                adicionarProductos(v_cantidad , v_nombreP);
                establecerIdS ( v_nombreS);
                esteblecerIdC ( v_nombreC, v_tel);
                esteblecerIdE (v_nombreE);
                
                fechaEntrega := SYSDATE + (20/1440);
                
                INSERT INTO Pedido VALUES (v_peId , v_idCliente , v_idSucursal , v_idEmpleado , 
                SYSDATE , v_tblProPend(1).total , 1 , fechaEntrega);
                

                v_idCliente:= NULL;
                v_idSucursal:= NULL;
                v_idEmpleado:= NULL;
                v_tblProPend := NULL;
            END guardarPedido;

END pedidoGestion;
--Ejecutar hasta qui el ejercicio guia 
-- Ejemplo de funcionamiento
BEGIN 
    pedidoGestion.guardarpedido(10 , 'Pizza de Queso' , 'Pizzeria Sr Pizza' , 'Luz' , 8345690, 'Juan Jose Mosquera Melenge' , 11);
END;


--Ejercicio del taller que se entrega el sabado 
CREATE OR REPLACE PACKAGE packGestionComprasSucursales AS

 TYPE rComparasPendientes IS RECORD (
    cantidadComprada NUMBER,
    proId Producto.proId%TYPE,
    proveedorId  Distribuidor.distId%TYPE,
    sucursalId Sucursal.sucId%TYPE
    
  );
  
  TYPE tComprasPendientes IS TABLE OF rComparasPendientes;
  
  tblCompPendi tComprasPendientes;
  
  PROCEDURE hacerCompra(vCantidad NUMBER  , vNombreP Producto.proNombre%TYPE,
         vNombreS  Sucursal.sucNombre%TYPE, vNombreD Distribuidor.distNombre%TYPE);
         
    PROCEDURE guardarPedido;
END packGestionComprasSucursales;

 --Ejercicio del taller que se entrega el sabado
--No ejecutar hasta tener los procedmientos realizados
CREATE OR REPLACE PACKAGE BODY packGestionComprasSucursales AS

        PROCEDURE hacerCompra(vCantidad NUMBER  , vNombreP Producto.proNombre%TYPE,
         vNombreS  Sucursal.sucNombre%TYPE, vNombreD Distribuidor.distNombre%TYPE)
            IS
                BEGIN
                
                
                
                
         END hacerCompra;        
         
         
         
         PROCEDURE guardarPedido
            IS
                BEGIN
                
                
                
                END guardarPedido;
         
         
         

END packGestionComprasSucursales;