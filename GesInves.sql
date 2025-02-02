DROP Table Clientes;
Create Table Clientes(
IDCliente        tinyint UNSIGNED  PRIMARY KEY,
Nombre           varchar(25) not null,
IDComercial      char(1)
);

Insert into Clientes Values(1,'Ulma S.Coop.','A');
Insert into Clientes Values(2,'Fagor','A');
Insert into Clientes Values(3,'Copreci','B');
Insert into Clientes Values(4,'Zahor','B');
Insert into Clientes Values(5,'BBVA','B');
Insert into Clientes Values(6,'BSCH','B');
Insert into Clientes Values(7,'Pates Zubia','C');

DROP TABLE Comerciales;
Create Table Comerciales(
IDComercial      char(1)     PRIMARY KEY,
Nombre	         varchar(25) not null
);

insert into Comerciales Values('A','Nerea Arregi');
insert into Comerciales Values('B','Irune Agerre');
insert into Comerciales Values('C','Ane Inza Aiastui');
insert into Comerciales Values('D','Gorka Zubia');


Create Table ClientesB(
IDCliente        tinyint UNSIGNED  PRIMARY KEY,
Nombre           varchar(25) not null
);

Insert into ClientesB Values(1,'Ulma S.Coop.');
Insert into ClientesB Values(2,'Fagor');
Insert into ClientesB Values(3,'Copreci');
Insert into ClientesB Values(4,'Zahor');
Insert into ClientesB Values(5,'BBVA');
Insert into ClientesB Values(6,'BSCH');
Insert into ClientesB Values(7,'Pates Zubia');

Create Table ComercialesB(
IDComercial       char(1)   PRIMARY KEY,
Nombre            varchar(25) not null
);

insert into ComercialesB Values('A','Nerea Arregi');
insert into ComercialesB Values('B','Irune Agerre');
insert into ComercialesB Values('C','Ane Inza Aiastui');
insert into ComercialesB Values('D','Gorka Zubia');

Create Table RelComCli(
IDComercial      char(1),
IDCLiente        tinyint unsigned,
CONSTRAINT Rel_PK PRIMARY KEY (IDComercial,IDCLiente)
);

insert into RelComCli values('A',1);
insert into RelComCli values('A',2);
insert into RelComCli values('B',1);
insert into RelComCli values('B',4);
insert into RelComCli values('C',6);