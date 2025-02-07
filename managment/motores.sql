-- CREATE TABLE T_MyISAM (
--     codigo VARCHAR(255),
--     nombre VARCHAR(50)
-- )ENGINE = MyISAM;


-- CREATE TABLE T_Innodb(
--     codigo VARCHAR(255),
--     nombre VARCHAR(50)
-- ) ENGINE = InnoDB;

-- CREATE TABLE T_Memory(
--     codigo VARCHAR(255),
--     nomre VARCHAR(50)
-- ) ENGINE = MEMORY;

-- INSERT INTO T_Memory(codigo,nomre) VALUES ('1','Mauricio');

-- CREATE TEMPORARY TABLE T_Temp (
--     codigo VARCHAR(255),
--     nombre VARCHAR(50)
-- );

-- INSERT INTO T_Temp(codigo,nombre) VALUES ('1','Mauricio');
-- SELECT * FROM T_Temp;

-- CREATE INDEX idx_nombre ON empleados(nombre); 

-- SELECT * FROM empleados USE INDEX (idx_nombre) WHERE nombre = 'Urcelai, Pedro';

CREATE INDEX idx_empleadoID ON empleados(empleadoID);

SELECT * FROM empleados USE INDEX (idx_empleadoID) WHERE nombre = 7499;