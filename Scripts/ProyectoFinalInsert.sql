INSERT INTO EmpresaAerea( nitEmpresa,nombreEmpresa) VALUES (100,'Avianca');
INSERT INTO EmpresaAerea( nitEmpresa,nombreEmpresa) VALUES (200,'Viva air');
INSERT INTO EmpresaAerea( nitEmpresa,nombreEmpresa) VALUES (300,'Easyfly');

INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (100,'AIRBUS 319','Comercial',40.3);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (200,'AIRBUS 320','Comercial',45.5);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (300,'AIRBUS 330','Comercial',50.6);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (400,'AIRBUS 340' ,'Comercial',57.2);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (500,'BOEING 737' ,'Comercial',52.9);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (600,'BOEING 777' ,'Comercial',59.3);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (620,'AIRBUS 300-600' ,'Militar',67.3);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (630,'ANTONOV','Militar',57.3);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (670,'Boeing 747  Freighter' ,'Carga',71.7);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (700,'Antonov 225 Mriya' ,'Carga',76.7);
INSERT INTO Avion(serialAvion,marcaAvion,tipoAvion,longitudEnMetros) VALUES (710,'Boeing 737' ,'Carga',81.3);

INSERT INTO Compra( idCompra,nitEmpresa,serialAvion,fecha) VALUES (1,100,200,'21/3/2022 11:34:21 am');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (2,200,500,'21/3/2022 02:14:33 pm');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (3,300,100,'11/9/2022 09:04:21 am');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (4,100,400,'11/9/2022 02:34:21 pm');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (5,200,670,'6/1/2022  07:11:21 pm');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (6,300,600,'6/1/2022 09:36:21 am');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (7,100,620,'2/6/2022 10:36:26 am');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (8,200,700,'2/5/2022 01:43:12 pm');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (9,300,710,'12/12/2022 11:30:02 am');
INSERT INTO Compra(idCompra,nitEmpresa,serialAvion,fecha) VALUES (10,300,200,'12/12/2022 11:30:02 am');