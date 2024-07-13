create table proveedor(
  idProveedor number(10),
  nombreProveedor varchar2(20) not null,
  tefelonoProvedor number(10) not null,
  ubicacionProveedor varchar2(40) not null,
  constraint PK_proveedor primary key(idProveedor)
);

create table sucursal(
  idSucursal number(10),
  nombreSucursal varchar2(20) not null,
  ciudadSucursal varchar2(15) not null,
  direccionSucursal varchar2(40) not null,
  constraint PK_sucursal primary key(idSucursal)
);

create table empleado(
  idEmpleado number(10),
  nombreEmpleado varchar2(15) not null,
  apellidoEmpleado varchar(15) not null,
  edadEmpleado number(3) check(edadEmpleado >0),
  puestoEmpleado varchar2(15)  check(puestoEmpleado like  'Cocinero' or puestoEmpleado like 'Recepcionista' 
  or  puestoEmpleado like' Mesero' or puestoEmpleado like 'Administrador'),
  sueldoEmpleado number(15) not null,
  constraint PK_empleado primary key(idEmpleado)
);

create table cliente(
  idCliente number(10),
  nombreCliente varchar2(15) not null,
  apellidoCliente varchar(15) not null,
  membresiaCliente varchar2(20),
  telefonoCliente number(10),
  ubicacionCliente varchar2(30),
  constraint PK_cliente primary key(idCliente)
);

create table menu(
  idMenu number(10),
  idSucursal number(10),
  nombreMenu varchar2(20) not null,
  precioMenu number(10) not null,
  constraint PK_menu primary key(idmenu),
  constraint FK_menu_sucursal foreign key (idSucursal) references sucursal(idSucursal) 
);

create table producto (
 idProducto  number(10),
 idProveedor number(10),
 fechaExpedicion date not null,
 fechaVencimiento date not null,
 cantidad varchar(6) check(cantidad like  'Baja' or cantidad like  'media' or cantidad like  'Alta'),
 constraint PK_producto primary key(idProducto)
);

create table suministra(
 idSuministro number(10),
 idSucursal number(10),
 idProducto  number(10),
 constraint PK_suministra primary key(idSuministro),
 constraint FK_suministra_sucursal foreign key (idSucursal) references sucursal(idSucursal), 
constraint FK_suministra_producto foreign key(idProducto) references producto(idproducto)
);

create table compraMenu(
 idCompra number(10),
 idCliente number(10),
 idMenu number(10),
 fechaCompra date not null,
 constraint FK_compra_cliente foreign key (idCliente) references cliente(idCliente) ,
 constraint FK_compra_menu foreign key (idMenu) references menu(idMenu) 
);

create table trabaja(
idSucursal number(10),
idEmpleado number(10),
fechaInicio date not null,
fechaFin date not null,
constraint FK_trabaja_sucursal foreign key (idSucursal) references sucursal(idSucursal),
constraint PK_trabaja primary key(idSucursal),
constraint FK_trabaja_empleado foreign key (idEmpleado) references empleado(idEmpleado)
);

create table evento(
idEvento number(10),
idSucursal number(10),
numeroParticipantes number(4) not null,
pedidoEvento varchar2(20) not null,
tipoEvento varchar2(20) check (tipoEvento like 'cumpleaños' or tipoEvento like 'fiesta' or tipoEvento like 'celebracion'),
fechaEvento date not null,
descuentoEvento number(3) not null,
constraint PK_Evento primary key(idEvento),
constraint FK_trabaja_sucursal foreign key (idSucursal) references sucursal(idSucursal)
);

create table domicilio(
idDomicilio number(10),
idSucursal number(10),
 idCliente number(10),
 idMenu   number(10),
 fechaDomicilio date not null,
 ubicacionDomicilio varchar2(40) not null,
 telefonoDomicilio number (10) not null,
 constraint PK_domicilio primary key(idDomicilio),
 constraint FK_domiclio_sucursal foreign key (idSucursal) references sucursal(idSucursal),
  constraint FK_domiclio_cliente foreign key (idCliente) references Cliente(idCliente),
   constraint FK_domiclio_menu foreign key (idMenu) references menu(idMenu)
);
