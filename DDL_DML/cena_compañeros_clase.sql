DROP DATABASE escuela;
CREATE DATABASE escuela;
USE escuela;


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
    DNI VARCHAR(25),
    año int
);

CREATE TABLE cena(
    año int,
    lugar VARCHAR(100),
    organizador1 VARCHAR(25) NOT NULL,
    organizador2 VARCHAR(25)
);



ALTER TABLE compañero ADD CONSTRAINT compañero_PK PRIMARY KEY (DNI);
ALTER TABLE carrera ADD CONSTRAINT carrera_PK PRIMARY KEY (DNI,RFC,entrada);
ALTER TABLE empresa ADD CONSTRAINT empresa_PK PRIMARY KEY (RFC);
ALTER TABLE asistencia ADD CONSTRAINT asistencia_PK PRIMARY KEY (DNI,año);
ALTER TABLE asistencia ADD CONSTRAINT asistencia_FK_DNI FOREIGN KEY (DNI) REFERENCES compañero(DNI) ON DELETE CASCADE;
ALTER TABLE cena ADD CONSTRAINT cena_PK PRIMARY KEY (año);
ALTER TABLE carrera ADD CONSTRAINT carrera_FK FOREIGN KEY (DNI) REFERENCES compañero(DNI) ON DELETE CASCADE;
ALTER TABLE cena ADD CONSTRAINT cena_FK_org1 FOREIGN KEY (organizador1) REFERENCES compañero(DNI) ON DELETE CASCADE;
ALTER TABLE cena ADD CONSTRAINT cena_FK_org2 FOREIGN KEY (organizador2) REFERENCES compañero(DNI) ON DELETE SET NULL;

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

INSERT INTO asistencia(DNI,año) VALUES
("1",2015),
("3",2015),
("5",2016),
("4",2016),
("5",2018);

INSERT INTO cena(año,lugar,organizador1) VALUES
(2015,"Urtiagaian","1"),
(2016,"Akelarre","5"),
(2018,"Arzak","5");
UPDATE cena SET organizador2="3" WHERE año=2015 OR año=2018;

UPDATE compañero SET nombre="Leire Arrieta" WHERE nombre="Ixone Arrieta";
UPDATE carrera SET nombre="Leire Arrieta" WHERE nombre="Ixone Arrieta";

UPDATE cena SET organizador2="3" WHERE año=2016;

UPDATE empresa set nombre="Ederlan S.Coop" WHERE nombre="Ederlan";

DELETE FROM empresa WHERE RFC="E3";
UPDATE carrera set cargo="trabajador" WHERE cargo="obrero";

DELETE FROM compañero WHERE nombre="Aitor Mendibil";


