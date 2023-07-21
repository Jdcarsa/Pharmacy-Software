CREATE TABLE PROVIDER (
idProvider VARCHAR(11) NOT NULL,
nameProvider VARCHAR(80) NOT NULL,
numIdentification INT(11) NOT NULL,
Address VARCHAR(35) NOT NULL,
Email VARCHAR(35) NOT NULL,
Phone VARCHAR(20) NOT NULL,
Bank VARCHAR(35) NOT NULL,
numAccount VARCHAR(35) NOT NULL,
stateProvider VARCHAR(10) NOT NULL,
CONSTRAINT pkProvider PRIMARY KEY (idProvider)
);

CREATE TABLE PURCHASE (
idPurchase VARCHAR(11) NOT NULL,
idEmployee VARCHAR(11) NOT NULL,
idProvider VARCHAR(11) NOT NULL,
datePurchase date NOT NULL,
payment varchar(20) NOT NULL,
total decimal(8,2) NOT NULL,
statusPURCHASE VARCHAR(35) NOT NULL,
CONSTRAINT pkPurchase PRIMARY KEY (idPurchase),
CONSTRAINT fkPurchaseProvider FOREIGN KEY (idProvider) 
REFERENCES Provider (idProvider),
CONSTRAINT fkPurchaseEmployee FOREIGN KEY (idEmployee) 
REFERENCES EMPLOYEE (idEmployee)
);

CREATE TABLE PRESENTATION (
idPresentation VARCHAR(11) NOT NULL,
descriptionPresentation VARCHAR(35) NOT NULL,
statePresentation VARCHAR(30) NOT NULL,
CONSTRAINT pkPresentation PRIMARY KEY (idPresentation)
);

CREATE TABLE LABORATORY (
idLaboratory VARCHAR(11) NOT NULL,
nameLaboratory VARCHAR(35) NOT NULL,
address VARCHAR(35) NOT NULL,
phone INT(15) NOT NULL,
stateLaboratory VARCHAR(15) NOT NULL,
CONSTRAINT pkLaboratory PRIMARY KEY (idLaboratory)
);



CREATE TABLE PRODUCT (
idProduct VARCHAR(11) NOT NULL,
descriptionProduct VARCHAR(100) NOT NULL,
concentration VARCHAR (30) NOT NULL,
stock INT (6) NOT NULL,
cost DECIMAL (8,2) NOT NULL,
salePrice DECIMAL (8,2) NOT NULL,
healthRegister VARCHAR (20) NOT NULL,
expirationDate DATE NOT NULL,
statusProduct VARCHAR(14) NOT NULL,
idPresentation VARCHAR(11) NOT NULL,
idLaboratory VARCHAR(11) NOT NULL,
CONSTRAINT pkProduct PRIMARY KEY (idProduct),
CONSTRAINT fkProductPresentation FOREIGN KEY (idPresentation) 
REFERENCES PRESENTATION (idPresentation),
CONSTRAINT fkProductLaboratory FOREIGN KEY (idLaboratory) 
REFERENCES LABORATORY (idLaboratory)
);

CREATE TABLE EMPLOYEE (
idEmployee VARCHAR(11) NOT NULL,
nameEmployee VARCHAR (30) NOT NULL,
lastNameEmployee VARCHAR (30) NOT NULL,
job VARCHAR (30) NOT NULL,
sex VARCHAR (10) NOT NULL,
numIdentification INT(11) NOT NULL,
email VARCHAR (30) NOT NULL,
phone INT(15) NOT NULL,
address VARCHAR (60) NOT NULL,
statusEmployee VARCHAR (10) NOT NULL,
CONSTRAINT pkEmployee PRIMARY KEY (idEmployee)
);

CREATE TABLE contract(
idContract VARCHAR(11) NOT NULL,
idEmployee VARCHAR(11) NOT NULL,
nameEmployee VARCHAR (60) NOT NULL,
contractDate DATE NOT NULL,
contractEnd date,
salary DECIMAL(8,2) NOT NULL,
CONSTRAINT pkContract PRIMARY KEY (idContract),
CONSTRAINT fkContractEmployee FOREIGN KEY (idEmployee) 
REFERENCES EMPLOYEE (idEmployee)
);

CREATE TABLE USEREMPLOYEE (
idUser VARCHAR(11) NOT NULL,
nameUser VARCHAR(85) NOT NULL unique,
employeeUser VARCHAR(20) NOT NULL,
passwordUser VARCHAR(20) NOT NULL,
typeUser varchar(15) NOT NULL,
stateUser VARCHAR(10) NOT NULL,
idEmployee VARCHAR(11) NOT NULL,
CONSTRAINT pkUser PRIMARY KEY (idUser),
CONSTRAINT fkUserEmployee FOREIGN KEY (idEmployee) 
REFERENCES EMPLOYEE (idEmployee)
);

CREATE TABLE PATIENT(
idPatient VARCHAR(11) NOT NULL,
namePatient VARCHAR (80) NOT NULL,
sex VARCHAR (2) NOT NULL,
numIdentification INT(11) NOT NULL,
birthdate DATE NOT NULL,
email VARCHAR (30) NOT NULL,
phone INT(15) NOT NULL,
address VARCHAR (60) NOT NULL,
CONSTRAINT pkPatient PRIMARY KEY (idPatient)
);

CREATE TABLE CLINICHISTORY(
idClinicHistory VARCHAR(11) NOT NULL,
idPatient VARCHAR(11) NOT NULL,
bloodType VARCHAR (3) NOT NULL,
allergiesTypes VARCHAR(300),
historyIllnessFamily VARCHAR(400),
medicineTakes VARCHAR (800),
diseasesSurgeries VARCHAR (1000),
symptoms VARCHAR (200),
prescription VARCHAR (200),
CONSTRAINT pkClinicHistory PRIMARY KEY (idClinicHistory),
CONSTRAINT fkClinicHistoryPatient FOREIGN KEY (idPatient) 
REFERENCES PATIENT (idPatient)
);

CREATE TABLE SALESCHECK(
idSalesCheck VARCHAR(11) NOT NULL,
idCustomer VARCHAR(11) NOT NULL,
datePurcharse DATE NOT NULL,
total DECIMAL(8,2) NOT NULL,
CONSTRAINT pkSalesCheck PRIMARY KEY (idSalesCheck)
);

CREATE TABLE DETAILSALES (
idDetail VARCHAR(11) NOT NULL,
idSalesCheck VARCHAR(11) NOT NULL,
idProduct VARCHAR(11) NOT NULL,
Quantity INT(11) NOT NULL,
price DECIMAL(8,2) NOT NULL,
total DECIMAL(8,2) NOT NULL,
CONSTRAINT pkDetailSales PRIMARY KEY (idDetail),
CONSTRAINT fkDetailSalesProduct FOREIGN KEY (idProduct) 
REFERENCES EMPLOYEE (idProduct),
CONSTRAINT fkDetailSalesSalesCheck FOREIGN KEY (idSalesCheck) 
REFERENCES SALESCHECK (idSalesCheck)
);
