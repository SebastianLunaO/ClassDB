DROP DATABASE escuela2;
CREATE DATABASE escuela2;
USE escuela2;


CREATE TABLE proveedores(
    proveedorID VARCHAR(100),
    nombre VARCHAR(50),
    CIF VARCHAR(50)
);

CREATE TABLE Facturas(
    numFact SMALLINT,
    fecha DATE,
    IVA int,
    provID VARCHAR(100)
);

CREATE TABLE Articulos(
    articuloID VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE Detalles(
    numFact SMALLINT,
    articuloID VARCHAR(100),
    cantidad INT,
    precio DECIMAL(8,2)
);

CREATE TABLE Recursos(
    codigo_interno VARCHAR(75),
    articuloID VARCHAR(100),
    numFact SMALLINT
);

DROP TABLE IF EXISTS Empleados;
CREATE TABLE Empleados(
    empleadoID VARCHAR(75),
    nombre VARCHAR(100)
);

CREATE TABLE Usan(
    codigo_interno VARCHAR(75),
    empleadoID VARCHAR(75),
    fecha_entrega DATE,
    fecha_devolucion DATE
);


ALTER TABLE Proveedores ADD CONSTRAINT Proveedores_PK PRIMARY KEY (proveedorID);
ALTER TABLE Facturas ADD CONSTRAINT Facturas_PK PRIMARY KEY (numFact);
ALTER TABLE Facturas ADD CONSTRAINT FACTURAS_FK FOREIGN KEY (provID) REFERENCES Proveedores(proveedorID) ON DELETE SET NULL;
ALTER TABLE Articulos ADD CONSTRAINT Articulos_PK PRIMARY KEY (articuloID);
ALTER TABLE Detalles ADD CONSTRAINT Detalles_PK PRIMARY KEY (numFact,articuloID);
ALTER TABLE Detalles ADD CONSTRAINT Detalles_FK_numFact FOREIGN KEY (numFact) REFERENCES Facturas(numFact);
ALTER TABLE Detalles ADD CONSTRAINT Detalles_FK_articulos FOREIGN KEY (articuloID) REFERENCES Articulos(articuloID);
ALTER TABLE Recursos ADD CONSTRAINT Recursos_PK PRIMARY KEY (codigo_interno);
ALTER TABLE Recursos ADD CONSTRAINT Recursos_FK_articulos FOREIGN KEY (articuloID) REFERENCES Articulos(articuloID);
ALTER TABLE Recursos ADD CONSTRAINT Recursos_FK_numFact FOREIGN KEY (numFact) REFERENCES Facturas(numFact);
ALTER TABLE Empleados ADD CONSTRAINT Empleados_PK PRIMARY KEY (empleadoID);
ALTER TABLE Usan ADD CONSTRAINT Usan_PK PRIMARY KEY (codigo_interno,empleadoID,fecha_entrega);
ALTER TABLE Usan ADD CONSTRAINT Usan_FK_Recursos FOREIGN KEY (codigo_interno) REFERENCES Recursos(codigo_interno);
ALTER TABLE Usan ADD CONSTRAINT Usan_FK_Empleados FOREIGN KEY (empleadoID) REFERENCES Empleados(empleadoID);



INSERT INTO Articulos(articuloID,descripcion) VALUES
("HP120","Portatil HP-Pro 6220");

INSERT INTO Articulos(articuloID,descripcion) VALUES
("HP335",'Pantallas de 15" HP Compact LA1951g');

INSERT INTO Articulos(articuloID,descripcion) VALUES
("RO445",'Impresora ROX + Scanner');

INSERT INTO Proveedores(proveedorID,nombre,CIF) VALUES
("1","System Solutions","F39856745");

INSERT INTO Facturas(numFact,fecha,provID) VALUES
(345,'2018-06-03',"1");

INSERT INTO Detalles(numFact,articuloID,cantidad,precio) VALUES
(345,"HP120",2,875.00),
(345,"HP335",3,145.00),
(345,"RO445",1,2768.00);



INSERT INTO Recursos(codigo_interno,articuloID,numFact) VALUES
("HP-18-003","HP120",345),
("HP-18-004","HP120",345);

INSERT INTO Recursos(codigo_interno,articuloID,numFact) VALUES
("ROX-020","RO445",345);

INSERT INTO Recursos(codigo_interno,articuloID,numFact) VALUES
("CQ-18-002","HP335",345),
("CQ-18-003","HP335",345),
("CQ-18-004","HP335",345);


