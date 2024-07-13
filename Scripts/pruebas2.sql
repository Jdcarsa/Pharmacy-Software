-- pregunta 1
select idCompra,Menu_ID,fechaCompra, menu.nombreMenu
from compra inner join Menu on compra.Menu_id = menu.idMenu
where fechaCompra between '2022-01-01' and '2022-01-31';

-- pregunta 2
select sum(cantidad) as "cantidad suministrada", nombreProveedor
from producto inner join proveedor on idProveedor=proveedor_ID
group by nombreProveedor
order by "cantidad suministrada";

--3
select sucursal.nombreSucursal , count(evento.tipoEvento)  as "Numero Evento"
from sucursal join evento on (sucursal.idSucursal = evento.sucursal_ID)
group by sucursal.nombreSucursal
order by "Numero Evento" desc
fetch  first 1 rows only;






--4
select sucursal.nombreSucursal, empleado.nombreEmpleado , empleado.edadEmpleado
from sucursal join trabaja on (sucursal.idSucursal = trabaja.sucursal_ID)
join empleado on (trabaja.empleado_ID = empleado.idEmpleado)
where empleado.edadEmpleado >25
order by empleado.edadEmpleado desc;

--5
select sucursal.nombreSucursal , evento.tipoEvento, evento.num_participantes
from sucursal join evento on (sucursal.idSucursal = evento.sucursal_ID);


--6
select cliente.nombreCliente, cliente.apellidoCliente, count(cliente.idCliente) as "COMPRAS"
from cliente join compra on (cliente.idcliente = compra.cliente_id)
join menu on (compra.menu_id = menu.idmenu) 
group by cliente.nombreCliente,cliente.apellidoCliente, cliente.idCliente
order by "COMPRAS" desc
fetch  first 1 rows only;


--7
select  sum(menu.precioMenu) as "GANANCIAS"
from cliente join compra on (cliente.idcliente = compra.cliente_id)
join menu on (compra.menu_id = menu.idmenu) 
where cliente.membresiaCliente like 'si';


--8

select  sum(menu.precioMenu) as "GANANCIAS"
from cliente join compra on (cliente.idcliente = compra.cliente_id)
join menu on (compra.menu_id = menu.idmenu) 
where cliente.membresiaCliente like 'no';



--9
SELECT  sucursal.nombreSucursal,empleado.nombreEmpleado,empleado.sueldoEmpleado
from sucursal join trabaja on (sucursal.idsucursal = trabaja.sucursal_ID)
join empleado on (trabaja.empleado_ID = empleado.idEmpleado)
order by empleado.nombreEmpleado asc;



--10
SELECT proveedor.nombreProveedor,sucursal.nombresucursal,producto.idproducto
from producto join suministra on (producto.idProducto = suministra.producto_ID) 
join sucursal on (suministra.sucursal_id = sucursal.idsucursal) 
join proveedor on (producto.idproducto = proveedor.idproveedor)
where sucursal.nombresucursal like 'La Casa del Mar';

--11
select producto.idProducto, producto.fecha_vencimiento
from producto 
where producto.fecha_vencimiento > (select current_date from dual);

--12
select sucursal.nombreSucursal,cliente.nombreCliente ,
cliente.apellidoCliente,domicilio.idDomicilio from sucursal
join domicilio on (sucursal.idSucursal = domicilio.sucursal_ID)
join cliente on (domicilio.cliente_ID = cliente.idCliente)
where sucursal.nombreSucursal like 'La Trattoria';

--13
select sucursal.nombreSucursal, empleado.puestoEmpleado,
count(empleado.puestoEmpleado) as "Numero de empleados"
from sucursal join trabaja on (sucursal.idSucursal = trabaja.sucursal_ID)
join empleado on (trabaja.empleado_ID = empleado.idEmpleado)
group by sucursal.nombreSucursal,empleado.puestoEmpleado
order by "Numero de empleados" desc;


-- pregunta 14
select Trunc(avg(empleado.sueldoEmpleado),2) as "Sueldo promedio" ,
empleado.puestoEmpleado, sucursal.nombreSucursal
from empleado inner join trabaja on empleado_id=idempleado inner
join sucursal on trabaja.sucursal_id = idSucursal
group by empleado.puestoEmpleado, sucursal.nombreSucursal;


--16
select idCompra, menu.nombreMenu,sucursal.nombreSucursal as "Sucursal/empresaEntrega"
from compra inner join menu on compra.menu_id = menu.idmenu  
inner join MenuSucursal on menuSucursal.idMenu = compra.Menu_id 
inner join Sucursal on  menuSucursal.idSucursal = sucursal.idSucursal
union 
select Domicilio.idDomicilio, menu.nombreMenu, domicilio.tipoEntrega  as "sucursal/empresaEntrega"
from Domicilio inner join menu on domicilio.Menu_id = menu.idmenu;

CREATE TABLE Sucursal (
    idSucursal INT PRIMARY KEY,
    nombreSucursal VARCHAR(255),
    direccionSucursal VARCHAR(255),
    ciudadSucursal VARCHAR(255)
);

-- Creaci?n de la tabla Empleado
CREATE TABLE Empleado (
    idEmpleado INT PRIMARY KEY,
    nombreEmpleado VARCHAR(255),
    apellidoEmpleado VARCHAR(255),
    edadEmpleado INT,
    puestoEmpleado VARCHAR(255),
    sueldoEmpleado DECIMAL(10,2)
);


-- Creaci?n de la tabla Trabaja
CREATE TABLE Trabaja (
	Empleado_ID INT PRIMARY KEY,
    Sucursal_ID INT,
    Fecha_inicial DATE,
    Fecha_final DATE,
    FOREIGN KEY (Sucursal_ID) REFERENCES Sucursal(idSucursal),
    FOREIGN KEY (Empleado_ID) REFERENCES Empleado(idEmpleado)
);

-- Creaci?n de la tabla Men?
CREATE TABLE Menu (
    idMenu INT PRIMARY KEY,
    nombreMenu VARCHAR(255),
    precioMenu DECIMAL(10,2)
);

-- Creaci?n de la tabla menuSucursal
CREATE TABLE menuSucursal (
    idMenu INT,
    idSucursal INT,
    PRIMARY KEY (idMenu, idSucursal),
    FOREIGN KEY (idMenu) REFERENCES Menu(idMenu),
    FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)
);

-- Creaci?n de la tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nombreCliente VARCHAR(255),
    apellidoCliente VARCHAR(255),
	membresiaCliente VARCHAR(2),
    ubicacionCliente VARCHAR(255),
    telefonoCliente VARCHAR(255)
);

-- Creaci?n de la tabla Compra
CREATE TABLE Compra (
    idCompra INT PRIMARY KEY,
    Menu_ID INT,
    Cliente_ID INT,
    fechaCompra DATE,
    FOREIGN KEY (Menu_ID) REFERENCES Menu(idMenu),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(idCliente)
);

-- Creaci?n de la tabla Domicilio
CREATE TABLE Domicilio (
    idDomicilio INT PRIMARY KEY,
	Sucursal_ID INT,
    Menu_ID INT,
    Cliente_ID INT,
    fechaDomicilio DATE,
    TipoEntrega VARCHAR(255),
    telefonoDomicilio VARCHAR(255),
    UbicacionDomicilio VARCHAR(255),
	FOREIGN KEY (Sucursal_ID) REFERENCES Sucursal(idSucursal),
    FOREIGN KEY (Menu_ID) REFERENCES Menu(idMenu),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(idCliente)
);

-- Creaci?n de la tabla Evento
CREATE TABLE Evento (
    idEvento INT PRIMARY KEY,
    Sucursal_ID INT,
    Num_participantes INT,
	pedidoEvento VARCHAR(255),
    tipoEvento VARCHAR(255),
    fechaEvento DATE,
    descuentoEvento DECIMAL(10,2),
    FOREIGN KEY (Sucursal_ID) REFERENCES Sucursal(idSucursal)
);

-- Creaci?n de la tabla Proveedor
CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    nombreProveedor VARCHAR(255),
    ubicacionProveedor VARCHAR(255),
    telefonoProveedor VARCHAR(255)
);

-- Creaci?n de la tabla Producto
CREATE TABLE Producto (
	idProducto INT PRIMARY KEY,
	Proveedor_ID INT,
	Fecha_expedicion DATE,
    Fecha_vencimiento DATE,
	Cantidad INT,
	FOREIGN KEY (Proveedor_ID) REFERENCES Proveedor(idProveedor)
);

-- Creaci?n de la tabla Suministra
CREATE TABLE Suministra (
    idSuministro INT PRIMARY KEY,
    Sucursal_ID INT,
	Producto_ID INT,
    FOREIGN KEY (Sucursal_ID) REFERENCES Sucursal(idSucursal),
	FOREIGN KEY (Producto_ID) REFERENCES Producto(idProducto)
);


--INSERCIONES DE SUCURSALES

INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (1, 'El Jard?n de las Delicias', 'Calle 19 #82-11', 'Bogot?');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (2, 'La Casa del Mar', 'Calle 3 #2-55', 'Cartagena');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (3, 'La Trattoria', 'Carrera 14 #82-51', 'Medell?n');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (4, 'El Rinc?n de la Abuela', 'Calle 8 #9-20', 'Cali');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (5, 'La Caba?a del Chef', 'Carrera 5 #18-89', 'Barranquilla');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (6, 'El Horno del Panadero', 'Calle 12 #45-78', 'Bogot?');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (7, 'La Trattoria', 'Calle 10 #22-55', 'Cartagena');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (8, 'El Sabor de la Casa', 'Carrera 7 #35-51', 'Medell?n');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (9, 'La Pizzer?a', 'Calle 5 #15-20', 'Cali');
INSERT INTO Sucursal (idSucursal, nombreSucursal, direccionSucursal, ciudadSucursal) VALUES (10, 'El Bistro', 'Carrera 8 #50-89', 'Barranquilla');

--INSERCIONES DE EMPLEADOS

INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (1, 'Juan', 'Perez', 35, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (2, 'Maria', 'Garcia', 30, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (3, 'Pedro', 'Martinez', 25, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (4, 'Camila', 'Rodriguez', 22, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (5, 'Lucas', 'Gonzalez', 28, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (6, 'Valentina', 'Santos', 24, 'Mesera', 11000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (7, 'Diego', 'Castro', 32, 'Jefe de cocina', 30000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (8, 'Andres', 'Gomez', 30, 'Repartidor', 14000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (9, 'Isabella', 'Herrera', 26, 'Mesero', 12500); 
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (10, 'Juan David', 'Naranjo', 30, 'Gerente de Sucursal', 45000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (11, 'Juan', 'Perez', 35, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (12, 'Maria', 'Garcia', 30, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (13, 'Pedro', 'Martinez', 25, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (14, 'Camila', 'Rodriguez', 22, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (15, 'Lucas', 'Gonzalez', 28, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (16, 'Valentina', 'Santos', 24, 'Mesera', 11000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (17, 'Diego', 'Castro', 32, 'Jefe de cocina', 30000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (18, 'Andres', 'Gomez', 30, 'Repartidor', 14000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (19, 'Isabella', 'Herrera', 26, 'Mesero', 12500);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (20, 'Juan David', 'Naranjo', 30, 'Gerente de Sucursal', 45000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (21, 'Juliana', 'Lopez', 32, 'Gerente', 55000); 
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (22, 'Sofia', 'Jimenez', 27, 'Cajero', 16000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (23, 'Mateo', 'Ruiz', 29, 'Mesero', 13000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (24, 'Andrea', 'Diaz', 25, 'Cocinero', 22000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (25, 'Santiago', 'Alvarez', 31, 'Lavavajillas', 9000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (26, 'Mauricio', 'Fernandez', 24, 'Mesero', 11000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (27, 'Sebastian', 'Garcia', 30, 'Repartidor', 14500);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (28, 'Karina', 'Herrera', 26, 'Mesera', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (29, 'Leonardo', 'Naranjo', 22, 'Jefe de cocina', 25000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (30, 'Angela', 'Cortez', 28, 'Cajera', 17000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (31, 'Juan', 'Perez', 35, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (32, 'Maria', 'Garcia', 30, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (33, 'Pedro', 'Martinez', 25, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (34, 'Camila', 'Rodriguez', 22, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (35, 'Lucas', 'Gonzalez', 28, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (36, 'Valentina', 'Garcia', 25, 'Mesera', 12500);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (37, 'Mauricio', 'Fernandez', 24, 'Mesero', 11000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (38, 'Sebastian', 'Garcia', 30, 'Repartidor', 14500);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (39, 'Karina', 'Herrera', 26, 'Mesera', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (40, 'Leonardo', 'Naranjo', 22, 'Jefe de cocina', 25000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (41, 'Natalia', 'Lopez', 28, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (42, 'Diego', 'Perez', 25, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (43, 'Andrea', 'Sanchez', 30, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (44, 'Juan', 'Garcia', 22, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (45, 'Sofia', 'Martin', 24, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (46, 'Natalia', 'Lopez', 28, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (47, 'Diego', 'Perez', 25, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (48, 'Andrea', 'Sanchez', 30, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (49, 'Juan', 'Garcia', 22, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (50, 'Sofia', 'Martin', 23, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (51, 'Juan', 'Castro', 22, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (52, 'Ana', 'Romero', 30, 'Cocinera', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (53, 'Diego', 'Garcia', 25, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (54, 'Isabella', 'Martinez', 22, 'Repartidor', 14500);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (55, 'Juan', 'Garcia', 23, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (56, 'Sofia', 'Rodriguez', 28, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (57, 'Carlos', 'Perez', 30, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (58, 'Valeria', 'Sanchez', 25, 'Mesera', 12500);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (59, 'Felipe', 'Garcia', 24, 'Mesero', 11000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (60, 'Isabella', 'Martinez', 22, 'Jefa de cocina', 25000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (61, 'Mateo', 'Garcia', 28, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (62, 'Catalina', 'Perez', 25, 'Cajera', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (63, 'Mauricio', 'Sanchez', 30, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (64, 'Valentina', 'Garcia', 22, 'Cocinera', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (65, 'Lucas', 'Martin', 24, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (66, 'Juan', 'Lopez', 28, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (67, 'Maria', 'Perez', 25, 'Cajera', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (68, 'Pedro', 'Sanchez', 30, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (69, 'Camila', 'Garcia', 22, 'Cocinera', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (70, 'Lucas', 'Martin', 24, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (71, 'Juan', 'Lopez', 28, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (72, 'Maria', 'Perez', 25, 'Cajera', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (73, 'Pedro', 'Sanchez', 30, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (74, 'Camila', 'Garcia', 22, 'Cocinera', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (75, 'Lucas', 'Martin', 24, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (76, 'Valentina', 'Garcia', 25, 'Mesera', 12500);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (77, 'Mauricio', 'Fernandez', 24, 'Mesero', 11000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (78, 'Sebastian', 'Garcia', 30, 'Repartidor', 14500);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (79, 'Karina', 'Herrera', 26, 'Mesera', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (80, 'Leonardo', 'Naranjo', 22, 'Jefe de cocina', 25000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (81, 'Natalia', 'Lopez', 28, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (82, 'Diego', 'Perez', 25, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (83, 'Andrea', 'Sanchez', 30, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (84, 'Juan', 'Garcia', 22, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (85, 'Sofia', 'Martin', 24, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (86, 'Juan', 'Rodriguez', 35, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (87, 'Maria', 'Garcia', 30, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (88, 'Pedro', 'Martinez', 25, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (89, 'Camila', 'Rodriguez', 22, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (90, 'Lucas', 'Gonzalez', 28, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (91, 'Juan', 'Perez', 35, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (92, 'Maria', 'Garcia', 30, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (93, 'Pedro', 'Martinez', 25, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (94, 'Camila', 'Rodriguez', 22, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (95, 'Lucas', 'Gonzalez', 28, 'Lavavajillas', 8000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (96, 'Andres', 'Castro', 29, 'Gerente', 50000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (97, 'Juliana', 'Giraldo', 31, 'Cajero', 15000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (98, 'Sebastian', 'Lopez', 26, 'Mesero', 12000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (99, 'Valentina', 'Garcia', 23, 'Cocinero', 20000);
INSERT INTO Empleado (idEmpleado, nombreEmpleado, apellidoEmpleado, edadEmpleado, puestoEmpleado, sueldoEmpleado) VALUES (100, 'Mauricio', 'Fernandez', 27, 'Lavavajillas', 8000);

--INSERCIONES DE TRABAJA

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (1, 1, '2023-01-23', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (2, 1, '2022-01-01', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (3, 1, '2022-01-06', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (4, 1, '2022-01-02', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (5, 1, '2022-01-01', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (6, 1, '2022-02-01', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (7, 1, '2022-01-01', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (8, 1, '2022-01-03', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (0, 1, '2022-01-02', NULL);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (10, 1, '2022-01-01', NULL);

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (11, 2, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (12, 2, '2022-03-05', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (13, 2, '2022-02-01', '2022-09-05');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (14, 2, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (15, 2, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (16, 2, '2022-02-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (17, 2, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (18, 2, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (19, 2, '2022-03-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (20, 2, '2022-01-01', null);

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (21, 3, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (22, 3, '2022-03-15', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (23, 3, '2022-02-01', '2022-09-05');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (24, 3, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (25, 3, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (26, 3, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (27, 3, '2022-03-15', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (28, 3, '2022-02-01', '2022-09-05');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (29, 3, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (30, 3, '2022-04-01', null);

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (31, 4, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (32, 4, '2022-03-15', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (33, 4, '2022-02-01', '2022-09-05');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (34, 4, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (35, 4, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (36, 4, '2022-01-01', '2022-07-05');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (37, 4, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (38, 4, '2022-03-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (39, 4, '2022-02-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (40, 4, '2022-08-01', null);

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (41, 5, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (42, 5, '2022-03-05', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (43, 5, '2022-02-01', '2022-09-05');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (44, 5, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (45, 5, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (46, 5, '2022-10-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (47, 5, '2022-03-09', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (48, 5, '2022-02-08', '2022-09-06');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (49, 5, '2022-05-07', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (50, 5, '2022-04-06', null);

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (51, 6, '2022-06-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (52, 6, '2022-03-15', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (53, 6, '2022-06-01', '2022-03-02');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (54, 6, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (55, 6, '2022-03-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (56, 6, '2022-10-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (57, 6, '2022-03-09', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (58, 6, '2022-02-08', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (59, 6, '2022-05-03', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (60, 6, '2022-04-06', null);

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (61, 7, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (62, 7, '2022-03-05', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (63, 7, '2022-02-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (64, 7, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (65, 7, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (66, 7, '2022-10-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (67, 7, '2022-03-19', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (68, 7, '2022-02-08', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (69, 7, '2022-05-07', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (70, 7, '2022-04-06', null);

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (71, 8, '2022-01-11', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (72, 8, '2022-02-05', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (73, 8, '2022-02-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (74, 8, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (75, 8, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (76, 8, '2022-12-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (77, 8, '2022-03-09', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (78, 8, '2022-02-08', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (79, 8, '2022-01-07', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (80, 8, '2022-04-06', '2022-10-06');

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (81, 9, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (82, 9, '2022-03-05', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (83, 9, '2022-02-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (84, 9, '2022-03-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (85, 9, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (86, 9, '2022-10-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (87, 9, '2022-03-09', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (88, 9, '2022-05-08', '2022-09-06');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (89, 9, '2022-05-07', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (90, 9, '2022-02-06', null);

INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (91, 10, '2022-01-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (92, 10, '2022-03-05', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (93, 10, '2022-02-01', '2022-09-05');
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (94, 10, '2022-05-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (95, 10, '2022-04-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (96, 10, '2022-10-01', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (97, 10, '2022-04-06', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (98, 10, '2022-02-06', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (99, 10, '2022-05-06', null);
INSERT INTO Trabaja (Empleado_ID, Sucursal_ID, Fecha_inicial, Fecha_final) VALUES (100, 10, '2022-04-06', null);

--INSERCIONES DE MENU

INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (1, 'Pizza pepperoni', 12000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (2, 'Hamburguesa con queso', 9000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (3, 'Ensalada Caesar', 8000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (4, 'Arroz con pollo', 11000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (5, 'Salchipapa', 10000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (6, 'Ceviche de pescado', 16000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (7, 'Arepas con queso', 6000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (8, 'Bandeja paisa', 25000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (9, 'Salchipapa Super', 20000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (10, 'Churrasco con chimichurri', 30000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (11, 'Pizza Margarita', 10000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (12, 'Pizza Napolitana', 10000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (13, 'Pizza Vegetariana', 11000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (14, 'Pizza de 4 quesos', 15000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (15, 'Pizza de Pollo BBQ', 13000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (17, 'Hamburguesa Sencilla', 12000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (18, 'Pescado frito', 14000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (19, 'Papas fritas', 3000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (20, 'Chuleta de cerdo', 9000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (21, 'Jugo de naranja', 5000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (22, 'Coca Cola', 4000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (23, 'Agua mineral', 3000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (24, 'Cerveza', 6000);
INSERT INTO Menu (idMenu, nombreMenu, precioMenu) VALUES (25, 'Granizado', 12000);

--INSERCIONES DE MENUSUCURSAL

INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (1, 1);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (20, 1);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (12, 1);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (23, 1);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (25, 1);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (15, 2);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (4, 2);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (3, 2);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (24, 2);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (25, 2);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (12, 3);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (13, 3);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (14, 3);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (20, 3);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (21, 3);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (18, 4);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (11, 4);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (8, 4);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (21, 4);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (22, 4);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (19, 5);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (17, 5);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (1, 5);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (23, 5);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (24, 5);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (3, 6);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (6, 6);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (9, 6);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (24, 6);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (25, 6);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (3, 7);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (15, 7);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (14, 7);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (20, 7);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (21, 7);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (4, 8);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (2, 8);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (19, 8);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (22, 8);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (24, 8);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (11, 9);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (12, 9);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (13, 9);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (14, 9);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (15, 9);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (18, 10);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (5, 10);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (7, 10);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (8, 10);
INSERT INTO menuSucursal (idMenu, idSucursal) VALUES (21, 10);

--INSERCIONES DE CLIENTE

INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (1, 'Juan', 'P?rez', 'no', 'Calle 72 #10-25, Bogot?', '3102345678');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (2, 'Maria', 'G?mez', 'no', 'Carrera 45 #67-89, Medell?n', '4123456789');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (3, 'Pedro', 'Mart?nez', 'si', 'Calle 5 #12-34, Cali', '3142345678');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (4, 'Ana', 'S?nchez', 'no', 'Calle 12 #34-56, Cartagena', '4123456789');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (5, 'Luis', 'Rodr?guez', 'no', 'Calle 34 #56-78, Barranquilla', '3142345678');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (6, 'Sofia', 'Garcia', 'no', 'Calle 85 #17-29, Bogot?', '3111234567');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (7, 'Carlos', 'Martinez', 'no', 'Carrera 12 #34-56, Medell?n', '4124234567');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (8, 'Andres', 'Gonzalez', 'si', 'Calle 23 #45-67, Cali', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (9, 'Carmen', 'Ramirez', 'no', 'Calle 56 #78-90, Cartagena', '4124234567');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (10, 'Juan Carlos', 'Jimenez', 'no', 'Calle 78 #90-12, Barranquilla', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (11, 'Jorge', 'Lopez', 'no', 'Calle 12 #34-56, Medellin', '4123456789');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (12, 'Victor', 'Garcia', 'no', 'Calle 34 #56-78, Cali', '3142345678');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (13, 'Mauricio', 'Garcia', 'no', 'Calle 56 #78-90, Barranquilla', '4124234567');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (14, 'Luisa', 'Martinez', 'si', 'Calle 78 #90-12, Cartagena', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (15, 'Felipe', 'Jimenez', 'no', 'Calle 90 #12-34, Bogot?', '4123456789');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (16, 'Samantha', 'Perez', 'no', 'Calle 23 #45-67, Barranquilla', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (17, 'Juliana', 'Garcia', 'no', 'Calle 56 #78-90, Bogot?', '4124234567');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (18, 'Esteban', 'Martinez', 'no', 'Calle 78 #90-12, Medellin', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (19, 'Isabella', 'Garcia', 'si', 'Calle 90 #12-34, Cali', '4123456789');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (20, 'Valentina', 'Jimenez', 'no', 'Calle 12 #34-56, Cartagena', '3142345678');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (21, 'Juan', 'Rodriguez', 'no', 'Calle 23 #45-67, Medellin', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (22, 'Camila', 'Garcia', 'no', 'Calle 56 #78-90, Cartagena', '4124234567');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (23, 'Mateo', 'Martinez', 'no', 'Calle 78 #90-12, Bogot?', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (24, 'Valeria', 'Garcia', 'si', 'Calle 90 #12-34, Barranquilla', '4123456789');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (25, 'Emilia', 'Jimenez', 'no', 'Calle 12 #34-56, Cali', '3142345678');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (26, 'Benjamin', 'Garcia', 'no', 'Calle 23 #45-67, Barranquilla', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (27, 'Nicolas', 'Martinez', 'no', 'Calle 56 #78-90, Medellin', '4124234567');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (28, 'Sofia', 'Garcia', 'no', 'Calle 78 #90-12, Cali', '3143567890');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (29, 'Valentina', 'Jimenez', 'si', 'Calle 90 #12-34, Cartagena', '4123454123');
INSERT INTO Cliente (idCliente, nombreCliente, apellidoCliente, membresiaCliente, ubicacionCliente, telefonoCliente) VALUES (30, 'Juan', 'Jimenez', 'si', 'Calle 90 #12-34, Cartagena', '5452564123');

--INSERCIONES DE COMPRA

INSERT INTO Compra (idCompra, Menu_ID, Cliente_ID, fechaCompra) VALUES (1, 6, 23, '2022-01-01');
INSERT INTO Compra (idCompra, Menu_ID, Cliente_ID, fechaCompra) VALUES (2, 2, 5, '2022-01-02');
INSERT INTO Compra (idCompra, Menu_ID, Cliente_ID, fechaCompra) VALUES (3, 3, 7, '2022-01-03');
INSERT INTO Compra (idCompra, Menu_ID, Cliente_ID, fechaCompra) VALUES (4, 12, 8, '2022-06-01');
INSERT INTO Compra (idCompra, Menu_ID, Cliente_ID, fechaCompra) VALUES (5, 15, 2, '2022-07-15');
INSERT INTO Compra (idCompra, Menu_ID, Cliente_ID, fechaCompra) VALUES (6, 18, 3, '2022-08-20');
INSERT INTO Compra (idCompra, Menu_ID, Cliente_ID, fechaCompra) VALUES (7, 21, 1, '2022-09-10');
INSERT INTO Compra (idCompra, Menu_ID, Cliente_ID, fechaCompra) VALUES (8, 24, 2, '2022-10-05');


--Inserciones proveedor
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(1,'Los cedros','Calle 5 #5-23 San agustin', '3204894532');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(2,'MaxIndustrias','Carrera 2b #2-23 Barranquilla ', '3104904512');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(3,'Distrotodo','Calle 10 #10-75 Botoga', '3129871532');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(4,'Arrayanes','Carrera 1A #1-02 Cali', ' 3006721233');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(5,'Agrodistribuciones','Carrea 20 #20-27 Medellin', '3104554532');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(6,'Comercializadora de lacteos ','Calle 6 #6-23 Ibague', ' 3239865112');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(7,'Sigma alimentos','Carrera 10 #10-02 Bogota', '3112335572');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(8,'Bimbo','Carrera 8 #8-14 Bogota', '3203210987');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(9,'Carnes S.A.S','Calle 3 #3-02 Medellin', '3117984567');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(10,'Maricos y peces S.AS','Carrera 1 #1-78 Cartagena', '3144532111');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(11,'Comercilizadora cosecha y granos','Calle 5 #5-78 Cali', '3114561231');
INSERT INTO Proveedor(idProveedor, nombreProveedor, ubicacionProveedor, telefonoProveedor) VALUES(12,'Surtimerca S.A.S','Carrera 10 #10-15 Ibague', '3159977333');

--Inserciones producto
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (1,1,'2023-01-01','2023-02-02',100);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (2,1,'2023-01-03','2023-02-02',200);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (3,2,'2023-01-29','2023-03-02',300);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (4,2,'2023-01-12','2023-02-23',50);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (5,3,'2023-01-11','2023-02-02',250);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (6,3,'2023-02-11','2023-04-11',75);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (6,4,'2023-01-08','2023-02-02',60);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (7,4,'2023-01-12','2023-02-02',20);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (8,4,'2023-01-07','2023-02-02',110);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (9,9,'2023-01-11','2023-02-15',400);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (10,6,'2023-01-12','2023-03-12',250);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (11,9,'2023-01-06','2023-02-02',10);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (12,7,'2023-01-11','2023-02-15',20);
INSERT INTO Producto(idProducto, Proveedor_ID , fecha_expedicion , fecha_vencimiento , cantidad) VALUES (13,8,'2023-01-12','2023-03-12',30);

--inserciones suministra 
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (1,1,1);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (2,1,2);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (3,1,3);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (4,5,3);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (5,4,3);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (6,4,3);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (7,2,8);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (8,3,9);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (9,6,5);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (10,5,6);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (11,7,9);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (12,2,11);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (13,3,12);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (14,8,3);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (15,8,7);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (16,1,4);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (17,7,6);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (18,8,7);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (19,4,4);
INSERT INTO Suministra(idSuministro,Sucursal_ID, Producto_ID) VALUES (20,2,7);

-- INSERCI?N DOMICILIO

INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (1, 2, 7, 11, '2022-11-11', 'Express', '3109876543', 'Calle 85 #17-29, Bogot?');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (2, 1, 4, 12, '2022-10-12', 'Rappi', '3120987654', 'Carrera 12 #34-56, Medell?n');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (3, 3, 15, 8, '2022-09-02', 'Express', '3143219876', 'Calle 23 #45-67, Cali');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (4, 1, 1, 3, '2022-10-05', 'Didi', '3142345678', 'Calle 5 #12-34, Cali');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (5, 2, 7, 6, '2022-12-15', 'express', '3111234567', 'Calle 85 #17-29, Bogot?');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (6, 3, 12, 12, '2022-11-5', 'normal', '3143567890', 'Calle 34 #56-78, Cali');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (7, 1, 3, 6, '2022-07-12', 'Didi', '3111234567', 'Calle 85 #17-29, Bogot?');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (8, 2, 18, 7, '2022-08-5', 'Rappi', '4124234567', 'Carrera 12 #34-56, Medell?n');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (9, 3, 14, 8, '2022-09-2', 'Domicilio', '3143567890', 'Calle 23 #45-67, Cali');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (14, 3, 2, 7, '2022-11-2', 'Delivery', '4124234567', 'Carrera 12 #34-56, Medell?n');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (15, 1, 5, 9, '2022-10-5', 'Delivery', '4124234567', 'Calle 56 #78-90, Cartagena');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (16, 4, 8, 12, '2022-09-12', 'Delivery', '3142345678', 'Calle 34 #56-78, Cali');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (17, 2, 5, 1, '2022-07-2', 'Domicilio', '3102345678', 'Calle 72 #10-25, Barranquilla');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (18, 1, 18, 2, '2022-08-10', 'Recoger en tienda', '4123456789', 'Carrera 45 #67-89, Barranquilla');
INSERT INTO Domicilio (idDomicilio, Sucursal_ID, Menu_ID, Cliente_ID, fechaDomicilio, TipoEntrega, telefonoDomicilio, UbicacionDomicilio) VALUES (19, 3, 24, 3, '2022-09-15', 'Domicilio', '3142345678', 'Calle 5 #12-34, Cali');

-- INSERCI?N EVENTO

INSERT INTO Evento (idEvento, Sucursal_ID, Num_participantes, pedidoEvento, tipoEvento, fechaEvento, descuentoEvento) VALUES (1,10, 15, 'Pizza pepperoni, Hamburguesa con queso, Ensalada Caesar', 'Cumplea?os', '2022-10-12', 0.05);
INSERT INTO Evento (idEvento, Sucursal_ID, Num_participantes, pedidoEvento, tipoEvento, fechaEvento, descuentoEvento) VALUES (2, 7, 20, 'Arroz con pollo, Jugo de Naranja, Ceviche de pescado', 'Boda', '2022-11-22', 0.10);
INSERT INTO Evento (idEvento, Sucursal_ID, Num_participantes, pedidoEvento, tipoEvento, fechaEvento, descuentoEvento) VALUES (3, 5, 25, 'Bandeja paisa, Salchipapa Super, Churrasco con chimichurri', 'Reuni?n de negocios', '2022-12-15', 0.15);
INSERT INTO Evento (idEvento, Sucursal_ID, Num_participantes, pedidoEvento, tipoEvento, fechaEvento, descuentoEvento) VALUES (4, 1, 50, 'Bandeja paisa, Hamburguesa con queso, Coca Cola, Jugo de Naranja', 'Fiesta de Grado', '2022-09-15', 0.1);
INSERT INTO Evento (idEvento, Sucursal_ID, Num_participantes, pedidoEvento, tipoEvento, fechaEvento, descuentoEvento) VALUES (5, 2, 30, 'Pizza pepperoni, Ensalada Caesar, Cerveza, Granizado de limon', 'Reunion de negocios', '2022-11-22', 0.05);
INSERT INTO Evento (idEvento, Sucursal_ID, Num_participantes, pedidoEvento, tipoEvento, fechaEvento, descuentoEvento) VALUES (6, 3, 40, 'Arroz con pollo, Pescado frito, Agua mineral, Jugo de Naranja', 'Boda', '2022-12-31', 0.15);

