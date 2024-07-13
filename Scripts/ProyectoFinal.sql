CREATE TABLE EmpresaAerea(
 nitEmpresa NUMBER(10) CHECK (nitEmpresa >0),
 nombreEmpresa VARCHAR2(30) NOT NULL,
CONSTRAINT PK_EmpresaAerea PRIMARY KEY(nitEmpresa)
);

CREATE TABLE Avion(
 serialAvion NUMBER(10) CHECK (serialAvion > 0),
 marcaAvion VARCHAR2(30) NOT NULL,
 tipoAvion VARCHAR2(15),
 longitudEnMetros NUMBER(5,2) CHECK  ( longitudEnMetros >= 40),
 CONSTRAINT PK_Avion PRIMARY KEY(serialAvion)
);

CREATE TABLE Compra(
 idCompra NUMBER(10),
 nitEmpresa NUMBER(10),
 serialAvion NUMBER(10),
 fecha TIMESTAMP, 
 CONSTRAINT FK_Compra_EmpresaAerea FOREIGN KEY (nitEmpresa) REFERENCES EmpresaAerea(nitEmpresa),
 CONSTRAINT FK_Compra_Avion FOREIGN KEY (serialAvion) REFERENCES Avion(serialAvion),
 CONSTRAINT PK_Compra PRIMARY KEY (idCompra)
);




