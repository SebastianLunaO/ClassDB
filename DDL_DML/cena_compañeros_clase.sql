DROP TABLE IF EXISTS empresa;
DROP TABLE IF EXISTS carrera;
DROP TABLE IF EXISTS compañero;
DROP TABLE IF EXISTS asistencia;
DROP TABLE IF EXISTS cena;

CREATE TABLE compañero(
    DNI VARCHAR(25),
    nombre VARCHAR(100),
    telefono int
);


CREATE TABLE carrera(
    DNI VARCHAR(25),
    nombre VARCHAR(25),
    RFC VARCHAR(40),
    entrada DATE,
    salida DATE,
    cargo VARCHAR(50)
);

CREATE TABLE empresa(
    RFC VARCHAR(25),
    nombre VARCHAR(50),
    telefono int
);


CREATE TABLE asistencia(
    nombre VARCHAR(25),
    año int
);

CREATE TABLE cena(
    año int,
    lugar VARCHAR(100),
    organizador1 VARCHAR(40),
    organizador2 VARCHAR(40)
);



ALTER TABLE compañero ADD CONSTRAINT compañero_PK PRIMARY KEY (DNI);
ALTER TABLE carrera ADD CONSTRAINT carrera_PK PRIMARY KEY (RFC,entrada);
ALTER TABLE empresa ADD CONSTRAINT empresa_PK PRIMARY KEY (RFC);
ALTER TABLE asistencia ADD CONSTRAINT asistencia_PK PRIMARY KEY (nombre,año);
ALTER TABLE cena ADD CONSTRAINT cena_PK PRIMARY KEY (año);
ALTER TABLE carrera ADD CONSTRAINT carrera_FK FOREIGN KEY (DNI) REFERENCES compañero(DNI) ON DELETE SET NULL;


INSERT INTO compañero(DNI,nombre,telefono) VALUES 
("1","Ion Otaeza",10),
("2","Ane Anduaga",20),
("3","Ixone Arrieta",30);

INSERT INTO compañero(DNI,nombre) VALUES 
("4","Iker Galarza"),
("5","Aitor Mendibil");

INSERT INTO carrera(nombre,DNI,RFC,entrada,cargo) VALUES
("Ixone Arrieta","3","E1",'1992-01-02',"obrero"),
("Aitor Mendibil","5","E2",'1992-01-03',"obrero"),
("Aitor Mendibil","5","E2",'1998-12-21',"gerente"); 
UPDATE carrera SET salida = '1998-12-20' WHERE nombre="Aitor Mendibil" AND entrada= '1992-01-03'; 


INSERT INTO empresa(RFC,nombre,telefono) VALUES 
("E1","Ulma Handling",10),
("E2","Copreci",20),
("E3","Ederlan",30);

INSERT INTO asistencia(nombre,año) VALUES
("Ion Otaeza",2015),
("Ixone Arrieta",2015),
("Aitor Mendibil",2016),
("Iker Galarza",2016),
("Aitor Mendibil",2018);

INSERT INTO cena(año,lugar,organizador1) VALUES
(2015,"Urtiagaian","Ion Otaeza"),
(2016,"Akelarre","Aitor Mendibil"),
(2018,"Arzak","Aitor Mendibil");
UPDATE cena SET organizador2="Ixone Arrieta" WHERE año=2015 OR año=2018;

UPDATE compañero SET nombre="Leire Arrieta" WHERE nombre="Ixone Arrieta";
UPDATE carrera SET nombre="Leire Arrieta" WHERE nombre="Ixone Arrieta";
UPDATE cena SET organizador2="Leire Arrieta" WHERE organizador2="Ixone Arrieta";
UPDATE cena SET organizador1="Leire Arrieta" WHERE organizador1="Ixone Arrieta";

UPDATE cena SET organizador2="Leire Arrieta" WHERE año=2016;

UPDATE empresa set nombre="Ederlan S.Coop" WHERE nombre="Ederlan";

DELETE FROM empresa WHERE RFC="E3";
UPDATE carrera set cargo="trabajador" WHERE cargo="obrero";

-- DELETE FROM carrera WHERE nombre="Aitor Mendibil";
DELETE FROM asistencia WHERE nombre="Aitor Mendibil";
DELETE FROM compañero WHERE nombre="Aitor Mendibil";
DELETE FROM cena WHERE organizador1="Aitor Mendibil" OR organizador2="Aitor Mendibil";


