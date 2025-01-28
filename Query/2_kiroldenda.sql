DROP DATABASE IF EXISTS KIROLDENDA;
CREATE DATABASE KIROLDENDA;
USE KIROLDENDA;

CREATE TABLE departamentos (
 departamentoID     TINYINT UNSIGNED,
 nombre             VARCHAR(20) NOT NULL,
 CONSTRAINT DEPT_PK PRIMARY KEY (departamentoID)
);

CREATE TABLE empleados (
 empleadoID          smallint UNSIGNED,
 nombre              VARCHAR(25)     NOT NULL,
 puesto              VARCHAR(15),
 jefe                smallint UNSIGNED,
 fnac                DATE,
 salario             DECIMAL(7,2),
 comision            DECIMAL(7,2),
 departamentoID      TINYINT UNSIGNED    NOT NULL,
 CONSTRAINT EMP_DEP_FK FOREIGN KEY (departamentoID) REFERENCES departamentos (departamentoID),
 CONSTRAINT EMP_MGR_FK FOREIGN KEY (jefe) REFERENCES empleados (empleadoID),
 CONSTRAINT EMP_PK PRIMARY KEY (empleadoID)
);

CREATE TABLE clientes (
 clienteID           smallint UNSIGNED,
 nombre              VARCHAR(45)     NOT NULL,
 domicilio           VARCHAR(40),
 poblacion           VARCHAR(30),
 cod_postal          CHAR(5),
 telefono            VARCHAR(9)     UNIQUE,
 empleadoID          smallint UNSIGNED,
 CONSTRAINT CLI_PK PRIMARY KEY (clienteID),
 CONSTRAINT CLI_EMP_FK FOREIGN KEY (empleadoID) REFERENCES empleados (empleadoID)
);

CREATE TABLE pedidos  (
 pedidoID             smallint UNSIGNED,
 fecha                DATE,
 clienteID            smallint UNSIGNED NOT NULL,
 CONSTRAINT PED_CLI_FK FOREIGN KEY (clienteID) REFERENCES clientes (clienteID),
 CONSTRAINT PED_PK PRIMARY KEY (pedidoID)
);

CREATE TABLE categorias  (
 categoriaID         char(2),
 nombre              varchar(40)  NOT NULL,
 CONSTRAINT CAT_PK PRIMARY KEY (categoriaID)
);

CREATE TABLE articulos (
 articuloID          smallint UNSIGNED,
 descripcion         VARCHAR(30)    NOT NULL,
 precio              DECIMAL(8,2)   NOT NULL,
 stock			     smallint,
 stock_min           smallint,
 stock_medio         smallint, 
 categoriaID         CHAR(2)     NOT NULL,
 CONSTRAINT ART_PK PRIMARY KEY (articuloID) ,
 CONSTRAINT ART_CAT__FK FOREIGN KEY (categoriaID) REFERENCES categorias (categoriaID)
);

CREATE TABLE lineas  (
 pedidoID               smallint UNSIGNED,
 articuloID             smallint UNSIGNED,
 precio                 DECIMAL(8,2),
 cantidad               INT,
 CONSTRAINT LINEAS_PED_FK FOREIGN KEY (pedidoID) REFERENCES pedidos (pedidoID),
 CONSTRAINT LINEAS_PRO_FK FOREIGN KEY (articuloID) REFERENCES articulos (articuloID), 
 CONSTRAINT LINEAS_PK PRIMARY KEY (pedidoID,articuloID)
);
