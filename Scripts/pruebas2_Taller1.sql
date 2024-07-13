CREATE TABLE Categoria(
idCategoria INT NOT NULL,
nombreCategoria VARCHAR(20) NOT NULL,
descripcionCategoria VARCHAR(100),
CONSTRAINT PK_Categoria PRIMARY KEY (idCategoria)
);

CREATE TABLE Producto(
idProducto INT NOT NULL,
idCategoria INT NOT NULL,
nombreProducto VARCHAR(20) NOT NULL,
descripcionProducto VARCHAR(100),
precioVentaProducto INT NOT NULL,
precioCompraProducto INT NOT NULL,
cantidadProducto INT NOT NULL,
fechaIngresoProducto DATE,
marcaProducto VARCHAR(40),
CONSTRAINT PK_Producto PRIMARY KEY (idProducto),
CONSTRAINT FK_Producto_Categoria FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(1,'Lacteos', 'alimentos derivados de la leche entre otros');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(2,'Carnes','Carnes preparadas');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(3,'Frutas',' frutos comestibles obtenidos de plantas cultivadas o silvestres');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(4,'Condimentos',' Salsas dulces y picantes, delicias, comida para untar y aderezos');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(5,'Dulceria','Postres, dulces y pan dulce ');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(6,'Verduras','Vegetables cultivados y cosechados en nuestra granja');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(7,'Bebidas','Gaseosas, café, té, cervezas y maltas');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(8,'Granos',' Pasta y cereales');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(9,'Pescado','Pescados, mariscos y mas');
INSERT INTO Categoria(idCategoria,nombreCategoria,descripcionCategoria) VALUES(10,'Harinas','Alimentos ricos en almidón');

INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
INSERT INTO Producto(idProducto, idCategoria, nombreProducto , descripcionProducto,
precioVentaProducto, precioCompraProducto, fechaIngresoProducto , marcaProducto) VALUES ();
