/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO 
(
   CARID                INT                 not null,
   CARNOMBRE            VARCHAR(120),
   CARDESCRIPCION       VARCHAR(1024),
   constraint PK_CARGO primary key (CARID)
);
/
/*==============================================================*/
/* Table: CARGOXUBICACION                                       */
/*==============================================================*/
create table CARGOXUBICACION 
(
   SUCID                INT                 not null,
   CARID                INT                 not null,
   constraint PK_CARGOXUBICACION primary key (SUCID, CARID)
);
/
/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   CLIID                INT                 not null,
   CLINOMBRE            VARCHAR(128),
   CLIDIRECCION         VARCHAR(256),
   CLITELEFONO          VARCHAR(128),
   constraint PK_CLIENTE primary key (CLIID)
);
/
/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA 
(
   PROID                INT                 not null,
   DISTID               INT                 not null,
   SUCID                INT                 not null,
   COMPFECHA            DATE                 not null,
   COMCANTIDAD          INT,
   constraint PK_COMPRA primary key (PROID, DISTID, SUCID, COMPFECHA)
);
/
/*==============================================================*/
/* Table: DISTRIBUIDOR                                          */
/*==============================================================*/
create table DISTRIBUIDOR 
(
   DISTID               INT                 not null,
   DISTNOMBRE           VARCHAR(128),
   DISTDIRECCION        VARCHAR(256),
   DISTTELEFONO         VARCHAR(128),
   constraint PK_DISTRIBUIDOR primary key (DISTID)
);
/
/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   EMPID                INT                 not null,
   SUCID                INT,
   CARID                INT,
   JEFE_EMPID           INT,
   EMPNOMBRE            VARCHAR(120),
   EMPAPELLIDOS         VARCHAR(120),
   EMPNOMBRECOMPLETO    VARCHAR(256),
   constraint PK_EMPLEADO primary key (EMPID)
);
/
/*==============================================================*/
/* Table: INCLUYE                                               */
/*==============================================================*/
create table INCLUYE 
(
   PEDID                INT                 not null,
   PROID                INT                 not null,
   INCCANTIDAD          INT                  not null,
   constraint PK_INCLUYE primary key (PEDID, PROID)
);
/
/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO 
(
   PEDID                INT                 not null,
   CLIID                INT,
   SUCID                INT,
   EMPID                INT,
   PERFECHAHORAPEDIDO   DATE,
   PEDVALORTOTAL        INT,
   PEDESTADO            INT,
   PERFECHAHORAENTREGA  DATE,
   constraint PK_PEDIDO primary key (PEDID)
);
/
/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   PROID                INT                 not null,
   PRONOMBRE            VARCHAR(128),
   PRODESCRIPCION       VARCHAR(256),
   PROVALORCOMPRA       INT,
   PROVALORVENTA        INT,
   constraint PK_PRODUCTO primary key (PROID)
);
/
/*==============================================================*/
/* Table: REALIZA                                               */
/*==============================================================*/
create table REALIZA 
(
   TURID                INT                 not null,
   EMPID                INT                 not null,
   REALFECHA            DATE                 not null,
   VEHID                INT,
   constraint PK_REALIZA primary key (TURID, EMPID, REALFECHA)
);
/
/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL 
(
   SUCID                INT                 not null,
   SUCNOMBRE            VARCHAR(256),
   constraint PK_SUCURSAL primary key (SUCID)
);
/
/*==============================================================*/
/* Table: TURNO                                                 */
/*==============================================================*/
create table TURNO 
(
   TURID                INT                 not null,
   SUCID                INT,
   TURDIA               INT,
   TURHORAINICIO        INT,
   TURHORAFIN           INT,
   constraint PK_TURNO primary key (TURID)
);
/
/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO 
(
   VEHID                INT                 not null,
   SUCID                INT,
   VEHPLACA             VARCHAR(128),
   VEHMODEL             INT,
   VEHMARCA             VARCHAR(128),
   VEHCC                INT,
   constraint PK_VEHICULO primary key (VEHID)
);
/
alter table CARGOXUBICACION
   add constraint FK_CARGOXUB_CON_CARGO foreign key (CARID)
      references CARGO (CARID);
/
alter table CARGOXUBICACION
   add constraint FK_CARGOXUB_EN_SUCURSAL foreign key (SUCID)
      references SUCURSAL (SUCID);
/
alter table COMPRA
   add constraint FK_COMPRA_A_DISTRIBU foreign key (DISTID)
      references DISTRIBUIDOR (DISTID);
/
alter table COMPRA
   add constraint FK_COMPRA_DE_PRODUCTO foreign key (PROID)
      references PRODUCTO (PROID);
/
alter table COMPRA
   add constraint FK_COMPRA_REALIZA_SUCURSAL foreign key (SUCID)
      references SUCURSAL (SUCID);
/
alter table EMPLEADO
   add constraint FK_EMPLEADO_JEFE_EMPLEADO foreign key (JEFE_EMPID)
      references EMPLEADO (EMPID);
/
alter table EMPLEADO
   add constraint FK_EMPLEADO_TIENE_CARGOXUB foreign key (SUCID, CARID)
      references CARGOXUBICACION (SUCID, CARID);
/
alter table INCLUYE
   add constraint FK_INCLUYE_EN_PEDIDO foreign key (PEDID)
      references PEDIDO (PEDID);
/
alter table INCLUYE
   add constraint FK_INCLUYE_SE_PRODUCTO foreign key (PROID)
      references PRODUCTO (PROID);
/
alter table PEDIDO
   add constraint FK_PEDIDO_ENTREGA_EMPLEADO foreign key (EMPID)
      references EMPLEADO (EMPID);
/
alter table PEDIDO
   add constraint FK_PEDIDO_REFERENCE_CLIENTE foreign key (CLIID)
      references CLIENTE (CLIID);
/
alter table PEDIDO
   add constraint FK_PEDIDO_REFERENCE_SUCURSAL foreign key (SUCID)
      references SUCURSAL (SUCID);
/
alter table REALIZA
   add constraint FK_REALIZA_CON_VEHICULO foreign key (VEHID)
      references VEHICULO (VEHID);
/
alter table REALIZA
   add constraint FK_REALIZA_REALIZA_EMPLEADO foreign key (EMPID)
      references EMPLEADO (EMPID);
/
alter table REALIZA
   add constraint FK_REALIZA_REALIZA_TURNO foreign key (TURID)
      references TURNO (TURID);
/
alter table TURNO
   add constraint FK_TURNO_EN_SUCURSAL foreign key (SUCID)
      references SUCURSAL (SUCID);
/
alter table VEHICULO
   add constraint FK_VEHICULO_PERTENECE_SUCURSAL foreign key (SUCID)
      references SUCURSAL (SUCID);
/

-------------------------------------INSERTAR DATOS-----------------------------------------------------------------------------
/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
insert into SUCURSAL values(01,'Pizzeria Sr Pizza');
insert into SUCURSAL values(02,'Pizzeria Pits');
insert into SUCURSAL values(03,'Pizzeria Primos');
insert into SUCURSAL values(04,'Pizzeria La Pizzara');
insert into SUCURSAL values(05,'Pizzeria Paccos');
insert into SUCURSAL values(06,'Pizzeria Drive');
/*==============================================================*/
/* Table: DISTRIBUIDOR                                          */
/*==============================================================*/
/*insert into DISTRIBUIDOR values (distID,distNombre,distDireccion,distTelefono);*/
insert into DISTRIBUIDOR values (8001,'Distri - Pollos la Quinta','Calle 5 N 38-26','8394484');
insert into DISTRIBUIDOR values (8002,'Salsamentaria Don Jeronimo','Carrera 9 N 2-45','8321210');
insert into DISTRIBUIDOR values (8003,'Postobon','Calle 17 N 48-206','8202015');
insert into DISTRIBUIDOR values (8004,'Salsamentaria La Blanca','Carrera 9 N 8-102','8361232');

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
insert into CLIENTE values (0031,'Luz Marina Riascos','Edf. Valle de Lili Ap 502',8345690);
insert into CLIENTE values (0032,'Liliana Vasquez Bonilla','Cra 6 No. 7-67',1187654);
insert into CLIENTE values (0033,'Beatriz Helena Caldon Pino','Cra 7 No. 4-56',6856309);
insert into CLIENTE values (0034,'Manuel Eduardo Orozco Rios','Cra 8 Cll 6 Esq',8679043);
insert into CLIENTE values (0035,'Jose Alexander Chacon Dorado','Cra 5A No 6-45',8343422);
insert into CLIENTE values (0036,'Sara Marcela Camargo','Cra 22 No. 3-35',7653238);
insert into CLIENTE values (0037,'Ramiro Alfonso Ordoñez Sandoval','Cra 76 Cll 54 Esq',7888843);
insert into CLIENTE values (0038,'Sandra Isabel Valencia Valencia','Cra 76 No. 5-43',7698765);
insert into CLIENTE values (0039,'Carlos Fabián Dorado','Cra 7 No. 15-3',5898765);
insert into CLIENTE values (0040,'Gabriel Felipe Hernández','Cra 12 No. 3-44',3216548);
insert into CLIENTE values (0041,'Carolina Rivera Orozco','Cra 20 No. 6-89',7698765);
insert into CLIENTE values (0042,'Andrés Mamián','Cra 3 No. 11-17',5248760);
insert into CLIENTE values (0043,'Sara Marcela Guzmán','Cra 5 No. 1-20',4608763);
insert into CLIENTE values (0044,'Jorge Ricardo Segura','Cra 3 No. 12-3',5438760);
insert into CLIENTE values (0045,'Diegio Alexander Pinto','Calle 6 No. 7-78',1098725);

/*==============================================================*/
/* Table: CARGO                                            	   */
/*==============================================================*/
insert into CARGO values(100,'Administrador','Encargado de las finanzas y sostenimiento de la sucursal');
insert into CARGO values(101,'Cajero','Encargado de recibir los dineros por las compras realizadas');
insert into CARGO values(102,'Mesero','Encargado de llevar bebidas y productos, además de limpiar las mesas');
insert into CARGO values(103,'Cocinero','Encargado de hacer las pizzas.');
insert into CARGO values(104,'Repartidor','Encargado de llevar los productos a los clientes.');
insert into CARGO values(105,'Auxiliar de cocina','Encargado de ayudar al mesero en su labores.');
insert into CARGO values(106,'Contador','Encargado de realizar las cuentas de la pizzeria.');
insert into CARGO values(107,'Compras','Encargado de realizar las compras con de la materia prima de las pizzas.');
insert into CARGO values(108,'Publicista','Encargado de hacer la publicidad de la pizzeria.');

/*==============================================================*/
/* Table: CARGOXUBICACION                                       */
/*==============================================================*/
insert into CARGOXUBICACION values(01,100);
insert into CARGOXUBICACION values(01,101);
insert into CARGOXUBICACION values(01,102);
insert into CARGOXUBICACION values(01,103);
insert into CARGOXUBICACION values(01,104);
insert into CARGOXUBICACION values(01,106);

insert into CARGOXUBICACION values(02,100);
insert into CARGOXUBICACION values(02,101);
insert into CARGOXUBICACION values(02,102);
insert into CARGOXUBICACION values(02,103);
insert into CARGOXUBICACION values(02,104);
insert into CARGOXUBICACION values(02,105);
insert into CARGOXUBICACION values(02,107);

insert into CARGOXUBICACION values(03,100);
insert into CARGOXUBICACION values(03,101);
insert into CARGOXUBICACION values(03,102);
insert into CARGOXUBICACION values(03,103);
insert into CARGOXUBICACION values(03,104);
insert into CARGOXUBICACION values(03,105);
insert into CARGOXUBICACION values(03,106);
insert into CARGOXUBICACION values(03,108);

insert into CARGOXUBICACION values(04,101);
insert into CARGOXUBICACION values(04,102);
insert into CARGOXUBICACION values(04,103);
insert into CARGOXUBICACION values(04,104);
insert into CARGOXUBICACION values(04,105);
insert into CARGOXUBICACION values(04,108);

insert into CARGOXUBICACION values(05,100);
insert into CARGOXUBICACION values(05,101);
insert into CARGOXUBICACION values(05,102);
insert into CARGOXUBICACION values(05,103);
insert into CARGOXUBICACION values(05,104);
insert into CARGOXUBICACION values(05,105);
insert into CARGOXUBICACION values(05,107);

insert into CARGOXUBICACION values(06,100);
insert into CARGOXUBICACION values(06,101);
insert into CARGOXUBICACION values(06,102);
insert into CARGOXUBICACION values(06,103);
insert into CARGOXUBICACION values(06,104);
insert into CARGOXUBICACION values(06,105);
insert into CARGOXUBICACION values(06,106);
insert into CARGOXUBICACION values(06,107);
insert into CARGOXUBICACION values(06,108);


/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
insert into EMPLEADO values (0001,01,100,null,'Juan Jose','Mosquera Melenge','Juan Jose Mosquera Melenge');
insert into EMPLEADO values (0002,01,101,0001,'Omar Alexander','Montoya Ramirez','Omar Alexander Montoya Ramirez');
insert into EMPLEADO values (0003,01,102,0001,'Luisa Maria','Serna Lopez','Luisa Maria Serna Lopez');
insert into EMPLEADO values (0004,01,103,0001,'Juan Carlos','Perez Idrobo','Juan Carlos Perez Idrobo');
insert into EMPLEADO values (0005,01,104,0001,'Adrian Vespucio','Chantre Penagos','Adrian Vespucio Chantre Penagos');
insert into EMPLEADO values (0006,01,106,0001,'Jesus Olmedo','Ordoñez Paz','Jesus Olmedo Ordoñez Paz');

insert into EMPLEADO values (0007,02,100,null,'Olga Patricia','Joaquin Quilindo','Olga Patricia Joaquin Quilindo');
insert into EMPLEADO values (0008,02,101,0007,'Manuel Jose','Navia Silva','Manuel Jose Navia Silva');
insert into EMPLEADO values (0009,02,102,0007,'Daniel Ivan','Collazos Rivera','Daniel Ivan Collazos Rivera');
insert into EMPLEADO values (0010,02,103,0007,'Carlos Julian','Devia','Carlos Julian Devia');
insert into EMPLEADO values (0011,02,104,0007,'Fabian Fernando','Rendon Lopez','Fabian Fernando Rendon Lopez');
insert into EMPLEADO values (0012,02,105,0007,'Carlos Mario','Gomez Velasco','Carlos Mario Gomez Velasco');
insert into EMPLEADO values (0013,02,107,0007,'Lucia','Gomez Sanchez','Lucia Gomez Sanchez');

insert into EMPLEADO values (0014,03,100,null,'Helmer','Rengifo Martinez','Helmer Rengifo Martinez');
insert into EMPLEADO values (0015,03,101,0014,'Jaime Alejandro','Cordoba Meneses','Jaime Alejandro Cordoba Meneses');
insert into EMPLEADO values (0016,03,102,0014,'Edith','Varona Muñoz','Edith Varona Muñoz');
insert into EMPLEADO values (0017,03,103,0014,'Laura Maria','Rengifo Espinosa','Laura Maria Rengifo Espinosa');
insert into EMPLEADO values (0018,03,104,0014,'Camilo Andres','Plaza Gonzales','Camilo Andres Plaza Gonzales');
insert into EMPLEADO values (0019,03,105,0014,'Liliana Rocio','Mera Rivera','Liliana Rocio Mera Rivera');
insert into EMPLEADO values (0020,03,106,0014,'Monica Lorena','Martinez','Monica Lorena Martinez');
insert into EMPLEADO values (0021,03,108,0014,'Sandra Liliana','Rodriguez Ruiz','Sandra Liliana Rodriguez Ruiz');

insert into EMPLEADO values (0022,04,101,0022,'Edward Etelvino','Gomez Lopez','Edward Etelvino Gomez Lopez');
insert into EMPLEADO values (0023,04,102,0022,'Lucy Viviana','Araujo Gomez','Lucy Viviana Araujo Gomez');
insert into EMPLEADO values (0024,04,103,0022,'Daniel Felipe','Carvajal Velazques','Daniel Felipe Carvajal Velazques');
insert into EMPLEADO values (0025,04,104,0022,'Juan Carlos','Mosquera Muñoz','Juan Carlos Mosquera Muñoz');
insert into EMPLEADO values (0026,04,105,0022,'Annie','Castillo Narvaez','Annie Castillo Narvaez');
insert into EMPLEADO values (0027,04,108,0022,'Luis Eduardo','Velasco Sarria','Luis Eduardo Velasco Sarria');

insert into EMPLEADO values (0028,05,100,null,'James Manuel','Galindo Rivera','James Manuel Galindo Rivera');
insert into EMPLEADO values (0029,05,101,0028,'Hector Andres','Hormaza Sanchez','Hector Andres Hormaza Sanchez');
insert into EMPLEADO values (0030,05,102,0028,'James Diego','Narvaez Fajardo','Juan Diego Narvaez Fajardo');
insert into EMPLEADO values (0031,05,103,0028,'Simon','Sanchez Russ','Simon Sanchez Russ');
insert into EMPLEADO values (0032,05,104,0028,'Cindy Johana','Velasco Ortega','Cindy Johana Velasco Ortega');
insert into EMPLEADO values (0033,05,105,0028,'Lucy','Trochez Galindez','Lucy Trochez Galindez');
insert into EMPLEADO values (0034,05,107,0028,'Valentina Lorena','Gomez','Valentina Lorena Gomez');

insert into EMPLEADO values (0035,06,100,null,'Luis Felipe','Martinez Trochez','Luis Felipe Martiinez Trochez');
insert into EMPLEADO values (0036,06,101,0035,'Rosa','Lopez Delgado','Rosa Lopez Delgado');
insert into EMPLEADO values (0037,06,102,0035,'Luisa Manuela','Calvo Hormaza','Luisa Manuela Calvo Hormaza');
insert into EMPLEADO values (0038,06,103,0035,'Carlos Javier','Gaviria Molano','Carlos Javier Gaviria Molano');
insert into EMPLEADO values (0039,06,104,0035,'Camilo Jose','Ruiz Lopez','Camilo Jose Ruiz Lopez');
insert into EMPLEADO values (0040,06,105,0035,'Sandra Lorena','Morales Castro','Sandra Lorena Morales Castro');
insert into EMPLEADO values (0041,06,106,0035,'Saul Andres','Gaviria Sanchez','Saul Andres Gaviria Sanchez');
insert into EMPLEADO values (0042,06,107,0035,'Carolina Andrea','Andrade Rosales','Carolina Andrade Rosales');
insert into EMPLEADO values (0043,06,108,0035,'Jesus David','Gomez Muñoz','Jesus David Gomez Muñoz');

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
insert into VEHICULO values (1001,01,'XSD 082',2004,'Yamaha',120);
insert into VEHICULO values (1002,02,'CAD 807',1991,'Renault',1300);
insert into VEHICULO values (1003,03,'ABS 563',2007,'Pulsar',700);
insert into VEHICULO values (1004,04,'AFG 081',2004,'Honda',130);
insert into VEHICULO values (1005,05,'THY 876',2004,'Honda',550);
insert into VEHICULO values (1006,01,'XSD 435',2014,'Yamaha',120);
insert into VEHICULO values (1007,01,'SYD 981',2022,'BMW',140);
insert into VEHICULO values (1008,02,'MJT 238',2021,'FORD',160);
insert into VEHICULO values (1009,03,'ADS 819',2018,'MAZDA',300);
insert into VEHICULO values (1010,03,'PXA 139',2008,'RENAULT',230);
insert into VEHICULO values (1011,04,'XCS 213',2022,'FORD',540);
insert into VEHICULO values (1012,06,'ALZ 817',2002,'HONDA',1881);
insert into VEHICULO values (1013,06,'PQJ 018',2014,'MAZDA',543);

/*==============================================================*/
/* Table: TURNO                                                 */
/*==============================================================*/
insert into TURNO values (1,01,1,12,19);
insert into TURNO values (2,01,0,19,24);
insert into TURNO values (3,02,1,12,19);
insert into TURNO values (4,02,0,19,24);
insert into TURNO values (5,03,1,12,19);
insert into TURNO values (6,03,0,19,24);
insert into TURNO values (7,04,1,12,19);
insert into TURNO values (8,04,0,19,24);
insert into TURNO values (9,05,1,12,19);
insert into TURNO values (10,05,0,19,24);
insert into TURNO values (11,06,3,17,22);
insert into TURNO values (12,06,4,15,21);

/*==============================================================*/
/* Table: REALIZA                                               */
/*==============================================================*/
insert into REALIZA values (1,0001,'04/03/2022',1002);
insert into REALIZA values (2,0001,'04/03/2022',1012);
insert into REALIZA values (1,0002,'04/03/2022',null);
insert into REALIZA values (2,0002,'04/03/2022',null);
insert into REALIZA values (1,0003,'04/03/2022',1005);
insert into REALIZA values (2,0003,'04/03/2022',null);
insert into REALIZA values (1,0004,'04/03/2022',1013);
insert into REALIZA values (2,0004,'04/03/2022',null);
insert into REALIZA values (1,0005,'04/03/2022',1001);
insert into REALIZA values (2,0005,'04/03/2022',1001);
insert into REALIZA values (1,0006,'04/03/2022',null);
insert into REALIZA values (2,0006,'04/03/2022',null);
insert into REALIZA values (3,0007,'05/03/2022',1001);
insert into REALIZA values (4,0007,'05/03/2022',null);
insert into REALIZA values (3,0008,'05/03/2022',1003);
insert into REALIZA values (4,0008,'05/03/2022',null);
insert into REALIZA values (3,0009,'05/03/2022',null);
insert into REALIZA values (4,0009,'05/03/2022',null);
insert into REALIZA values (3,0010,'05/03/2022',1002);
insert into REALIZA values (4,0010,'05/03/2022',null);
insert into REALIZA values (3,0011,'05/03/2022',1002);
insert into REALIZA values (4,0011,'05/03/2022',1002);
insert into REALIZA values (3,0012,'05/03/2022',null);
insert into REALIZA values (4,0012,'05/03/2022',1009);
insert into REALIZA values (5,0013,'06/03/2022',null);
insert into REALIZA values (6,0013,'06/03/2022',1011);
insert into REALIZA values (5,0014,'06/03/2022',null);
insert into REALIZA values (6,0014,'06/03/2022',1010);
insert into REALIZA values (5,0015,'06/03/2022',null);
insert into REALIZA values (6,0015,'06/03/2022',null);
insert into REALIZA values (5,0016,'06/03/2022',1007);
insert into REALIZA values (6,0016,'06/03/2022',null);
insert into REALIZA values (5,0017,'06/03/2022',1003);
insert into REALIZA values (6,0017,'06/03/2022',1003);
insert into REALIZA values (5,0018,'06/03/2022',null);
insert into REALIZA values (6,0018,'06/03/2022',null);
insert into REALIZA values (7,0019,'07/03/2022',null);
insert into REALIZA values (8,0019,'07/03/2022',1007);
insert into REALIZA values (7,0020,'07/03/2022',null);
insert into REALIZA values (8,0020,'07/03/2022',1012);
insert into REALIZA values (7,0021,'07/03/2022',1002);
insert into REALIZA values (8,0021,'07/03/2022',null);
insert into REALIZA values (7,0022,'07/03/2022',1009);
insert into REALIZA values (8,0022,'07/03/2022',null);
insert into REALIZA values (7,0023,'07/03/2022',1004);
insert into REALIZA values (8,0023,'07/03/2022',1004);
insert into REALIZA values (7,0024,'07/03/2022',null);
insert into REALIZA values (8,0024,'07/03/2022',1008);
insert into REALIZA values (9,0025,'08/03/2022',null);
insert into REALIZA values (10,0025,'08/03/2022',1005);
insert into REALIZA values (9,0026,'08/03/2022',null);
insert into REALIZA values (10,0026,'08/03/2022',null);
insert into REALIZA values (9,0027,'08/03/2022',null);
insert into REALIZA values (10,0027,'08/03/2022',1010);
insert into REALIZA values (9,0028,'08/03/2022',null);
insert into REALIZA values (10,0028,'08/03/2022',1008);
insert into REALIZA values (9,0029,'08/03/2022',1005);
insert into REALIZA values (10,0029,'08/03/2022',1005);
insert into REALIZA values (9,0030,'08/03/2022',null);
insert into REALIZA values (10,0030,'08/03/2022',1004);
insert into REALIZA values (11,0031,'09/04/2022',null);
insert into REALIZA values (12,0031,'10/04/2022',null);
insert into REALIZA values (10,0032,'11/04/2022',1001);
insert into REALIZA values (09,0032,'12/04/2022',null);
insert into REALIZA values (03,0033,'12/04/2022',1002);
insert into REALIZA values (02,0033,'13/04/2022',null);
insert into REALIZA values (11,0034,'01/04/2022',1003);
insert into REALIZA values (09,0034,'02/04/2022',1010);
insert into REALIZA values (04,0035,'04/04/2022',null);
insert into REALIZA values (06,0036,'05/03/2022',1007);
insert into REALIZA values (02,0036,'08/03/2022',null);
insert into REALIZA values (10,0037,'09/03/2022',1003);
insert into REALIZA values (02,0037,'02/03/2022',1012);
insert into REALIZA values (04,0038,'03/05/2022',1006);
insert into REALIZA values (10,0038,'02/05/2022',null);
insert into REALIZA values (12,0039,'05/03/2022',1004);
insert into REALIZA values (05,0039,'06/07/2022',null);
insert into REALIZA values (09,0040,'03/02/2022',1004);
insert into REALIZA values (04,0040,'05/05/2022',null);
insert into REALIZA values (10,0041,'07/02/2022',1002);
insert into REALIZA values (10,0041,'01/01/2022',1007);
insert into REALIZA values (11,0042,'02/04/2022',null);
insert into REALIZA values (03,0042,'03/01/2022',1013);
insert into REALIZA values (02,0043,'07/02/2022',1005);
insert into REALIZA values (01,0043,'01/09/2022',1002);


/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
insert into PRODUCTO values(01,'Pizza de Queso','Pizza tradicional con trocitos de queso molido',6000,10000);
insert into PRODUCTO values(02,'Pizza Napoleana','Pizza con pasta glaciada de salsa marinera',7500,12000);
insert into PRODUCTO values(03,'Pizza de Pollo','Contiene pollo desmenuzado y salsa de ajo',9000,15000);
insert into PRODUCTO values(04,'Pizza Egipcia','Contiene tocineta y varias salsas',9500,15500);
insert into PRODUCTO values(05,'Pizza de pollo en Barbecue','Contiene trozos de pollo con salsa de barbecue',9000,15000);
insert into PRODUCTO values(06,'Gaseosa Postobón 500 ml','Gaseosa de cualquier sabor de tamaño personal',800,1000);
insert into PRODUCTO values(07,'Gaseosa Postobón 3L','Gaseosa de cualquier sabor tamaño familiar',4000,5000);
insert into PRODUCTO values(08,'Jugo Hit 500 ml','Jugo de cualquier sabor de tamaño personal',900,1200);
insert into PRODUCTO values(09,'Jugo Hit 3L','Jugo de cualquier sabor tamaño familiar',4000,6000);
insert into PRODUCTO values(10,'Malteada','Deliciosa malteada de tamaño personal del sabor que escoja',1200,2000);
insert into PRODUCTO values(11,'Jugo Natural','Hecho con pulpa de fruta natural, hay todos los sabores',900,1500);
insert into PRODUCTO values(12,'Queso','Queso parmesano rayado',3000,3500);
insert into PRODUCTO values(13,'Jamón','Jamón tajado, 20 unidades cada paquete',5000,6500);
insert into PRODUCTO values(14,'Polvo de hornear','Polvo para subir el volumen y contextura de la masa',3500,3900);
insert into PRODUCTO values(15,'Levadura','Útil para aumentar volúmen a la masa',2600,3200);
insert into PRODUCTO values(16,'Harina de trigo','Bulto de harina de trigo fortificada especial para panadería',850000,900000);
insert into PRODUCTO values(17,'Champiñones','Grandes champiñones cortados a la mitad',4000,8000);
insert into PRODUCTO values(18,'Pechuga de pollo','Kg pechuga de pollo desmenuzada, lista para recetas',6700,9200);
insert into PRODUCTO values(19,'Paquete de salsas','Salsa de ajo, mayonesa, salsa de tomate, salsa rosada, salsa de ajo',12000,15000);
insert into PRODUCTO values(20,'Mantequilla','Mantequilla light con sal',3500,4000);

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
insert into COMPRA values (06,8003,01,'10/02/22',30);
insert into COMPRA values (07,8003,01,'10/04/22',20);
insert into COMPRA values (08,8003,01,'10/06/22',20);
insert into COMPRA values (11,8003,01,'10/06/22',25);
insert into COMPRA values (12,8002,01,'10/02/22',300);
insert into COMPRA values (13,8002,01,'10/05/22',300);
insert into COMPRA values (14,8002,01,'10/07/22',30);
insert into COMPRA values (15,8002,01,'10/01/22',2);
insert into COMPRA values (16,8002,01,'10/08/22',7);
insert into COMPRA values (17,8002,01,'10/09/22',10);
insert into COMPRA values (18,8001,01,'10/10/22',30);
insert into COMPRA values (19,8002,01,'10/04/22',7);
insert into COMPRA values (20,8002,01,'10/06/22',2);
insert into COMPRA values (06,8003,02,'11/04/22',30);
insert into COMPRA values (07,8003,02,'11/08/22',25);
insert into COMPRA values (09,8003,02,'11/02/22',15);
insert into COMPRA values (12,8002,02,'11/05/22',250);
insert into COMPRA values (13,8002,02,'11/09/22',180);
insert into COMPRA values (14,8002,02,'11/11/22',25);
insert into COMPRA values (17,8002,02,'11/10/22',8);
insert into COMPRA values (18,8001,02,'11/09/22',35);
insert into COMPRA values (19,8002,02,'11/06/22',10);
insert into COMPRA values (06,8003,03,'12/04/22',30);
insert into COMPRA values (07,8003,03,'12/03/22',10);
insert into COMPRA values (08,8003,03,'12/02/22',22);
insert into COMPRA values (09,8003,03,'12/06/22',18);
insert into COMPRA values (10,8003,03,'12/02/22',30);
insert into COMPRA values (11,8003,03,'12/05/22',10);
insert into COMPRA values (12,8002,03,'12/08/22',350);
insert into COMPRA values (15,8002,03,'12/01/22',5);
insert into COMPRA values (16,8002,03,'12/05/22',6);
insert into COMPRA values (17,8002,03,'12/08/22',18);
insert into COMPRA values (18,8001,03,'12/02/22',18);
insert into COMPRA values (19,8002,03,'12/04/22',9);
insert into COMPRA values (20,8002,03,'12/03/22',5);
insert into COMPRA values (06,8003,04,'13/07/22',35);
insert into COMPRA values (07,8003,04,'13/08/22',30);
insert into COMPRA values (12,8002,04,'13/02/22',120);
insert into COMPRA values (13,8002,04,'13/01/22',130);
insert into COMPRA values (14,8002,04,'13/06/22',28);
insert into COMPRA values (15,8002,04,'13/05/22',25);
insert into COMPRA values (16,8002,04,'13/06/22',10);
insert into COMPRA values (17,8002,04,'13/11/22',8);
insert into COMPRA values (18,8001,04,'13/05/22',12);
insert into COMPRA values (19,8002,04,'13/09/22',5);
insert into COMPRA values (20,8002,04,'13/03/22',7);
insert into COMPRA values (06,8003,05,'14/12/22',32);
insert into COMPRA values (07,8003,05,'14/05/22',25);
insert into COMPRA values (09,8003,05,'14/06/22',15);
insert into COMPRA values (10,8003,05,'14/08/22',5);
insert into COMPRA values (13,8002,05,'13/02/22',230);
insert into COMPRA values (14,8002,05,'13/08/22',18);
insert into COMPRA values (15,8002,05,'13/09/22',35);
insert into COMPRA values (16,8002,05,'13/02/22',17);
insert into COMPRA values (17,8002,05,'13/03/22',8);
insert into COMPRA values (18,8001,05,'10/05/22',30);
insert into COMPRA values (13,8004,06,'14/06/22',13);
insert into COMPRA values (05,8004,06,'16/09/22',3);
insert into COMPRA values (07,8004,06,'18/04/22',9);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
insert into PEDIDO values(1001,0031,01,0003,to_date('6/03/2022 03:15:16PM','dd/mm/yyyy:hh:mi:sspm'),25000,1,to_date('6/03/2022 03:30:16PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1002,0032,01,0005,to_date('6/03/2022 04:00:20PM','dd/mm/yyyy:hh:mi:sspm'),17000,1,to_date('6/03/2022 04:15:20PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1003,0033,01,0003,to_date('6/03/2022 05:30:34PM','dd/mm/yyyy:hh:mi:sspm'),57000,1,to_date('6/03/2022 05:45:34PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1004,0034,02,0009,to_date('7/03/2022 03:15:16PM','dd/mm/yyyy:hh:mi:sspm'),200000,1,to_date('7/03/2022 03:30:16PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1005,0035,02,0011,to_date('7/03/2022 04:00:20PM','dd/mm/yyyy:hh:mi:sspm'),40500,1,to_date('7/03/2022 04:15:20PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1006,0036,02,0009,to_date('7/03/2022 05:30:34PM','dd/mm/yyyy:hh:mi:sspm'),55000,1,to_date('7/03/2022 05:45:34PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1007,0037,03,0015,to_date('8/03/2022 03:15:16PM','dd/mm/yyyy:hh:mi:sspm'),14000,1,to_date('8/03/2022 03:30:16PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1008,0038,03,0017,to_date('8/03/2022 04:00:20PM','dd/mm/yyyy:hh:mi:sspm'),90000,1,to_date('8/03/2022 04:15:20PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1009,0039,03,0015,to_date('8/03/2022 05:30:34PM','dd/mm/yyyy:hh:mi:sspm'),58500,1,to_date('8/03/2022 05:45:34PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1010,0040,04,0021,to_date('9/03/2022 03:15:16PM','dd/mm/yyyy:hh:mi:sspm'),37500,1,to_date('9/03/2022 03:30:16PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1011,0041,04,0023,to_date('9/03/2022 04:00:20PM','dd/mm/yyyy:hh:mi:sspm'),25000,1,to_date('9/03/2022 04:15:20PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1012,0042,04,0021,to_date('9/03/2022 05:30:34PM','dd/mm/yyyy:hh:mi:sspm'),65000,1,to_date('9/03/2022 05:45:34PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1013,0043,05,0027,to_date('10/03/2022 03:15:16PM','dd/mm/yyyy:hh:mi:sspm'),48000,1,to_date('10/03/2022 03:30:16PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1014,0044,05,0029,to_date('10/03/2022 04:00:20PM','dd/mm/yyyy:hh:mi:sspm'),43000,1,to_date('10/03/2022 04:15:20PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1015,0045,05,0027,to_date('10/03/2022 05:30:34PM','dd/mm/yyyy:hh:mi:sspm'),16500,1,to_date('10/03/2022 05:45:34PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1016,0032,01,0027,to_date('10/03/2022 05:30:34PM','dd/mm/yyyy:hh:mi:sspm'),16500,1,to_date('10/03/2022 05:45:34PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1017,0032,02,0027,to_date('10/03/2022 05:30:34PM','dd/mm/yyyy:hh:mi:sspm'),16500,1,to_date('10/03/2022 05:45:34PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1018,0042,06,0042,to_date('10/03/2022 05:30:34PM','dd/mm/yyyy:hh:mi:sspm'),13200,1,to_date('10/03/2022 05:49:36PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1019,0033,06,0040,to_date('10/04/2022 02:32:14PM','dd/mm/yyyy:hh:mi:sspm'),345669,1,to_date('09/02/2022 01:35:34PM','dd/mm/yyyy:hh:mi:sspm'));
insert into PEDIDO values(1020,0038,06,0015,to_date('04/02/2022 05:23:45PM','dd/mm/yyyy:hh:mi:sspm'),20400,1,to_date('15/06/2022 01:48:34PM','dd/mm/yyyy:hh:mi:sspm'));


/*==============================================================*/
/* Table: INCLUYE                                               */
/*==============================================================*/
insert into INCLUYE values(1001,01,2);
insert into INCLUYE values(1001,07,1);
insert into INCLUYE values(1002,02,1);
insert into INCLUYE values(1002,06,5);
insert into INCLUYE values(1003,03,3);
insert into INCLUYE values(1003,09,2);
insert into INCLUYE values(1004,04,5);
insert into INCLUYE values(1004,10,20);
insert into INCLUYE values(1005,05,2);
insert into INCLUYE values(1005,11,7);
insert into INCLUYE values(1006,01,4);
insert into INCLUYE values(1006,07,3);
insert into INCLUYE values(1007,02,1);
insert into INCLUYE values(1007,06,2);
insert into INCLUYE values(1008,03,4);
insert into INCLUYE values(1008,09,5);
insert into INCLUYE values(1009,04,3);
insert into INCLUYE values(1009,10,6);
insert into INCLUYE values(1010,05,2);
insert into INCLUYE values(1010,11,5);
insert into INCLUYE values(1011,01,1);
insert into INCLUYE values(1011,07,3);
insert into INCLUYE values(1012,02,5);
insert into INCLUYE values(1012,06,5);
insert into INCLUYE values(1013,03,2);
insert into INCLUYE values(1013,09,3);
insert into INCLUYE values(1014,04,2);
insert into INCLUYE values(1014,10,6);
insert into INCLUYE values(1015,05,1);
insert into INCLUYE values(1015,11,1);