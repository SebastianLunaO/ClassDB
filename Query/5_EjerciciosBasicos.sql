-- 1
SELECT * FROM departamentos;

-- 2
SELECT * FROM empleados;

-- 3
SELECT nombre FROM empleados ORDER BY nombre ASC;

-- 4
SELECT DISTINCT puesto FROM empleados;

-- 5
SELECT * FROM empleados WHERE departamentoID = 20;

-- 6
SELECT empleadoID codigo, nombre nomEmp , puesto posicion , jefe boss ,fnac fecha_nacimiento, salario sal,comision com, departamentoID dep
FROM empleados WHERE departamentoID = 20;

-- 7 
SELECT empleadoID,nombre, salario*14 FROM empleados;

-- 8
SELECT empleadoID,nombre, salario*14 FROM empleados WHERE (salario*14)>=(30000);

-- 9
SELECT empleadoID,nombre, departamentoID FROM empleados WHERE nombre LIKE "Arr%";

-- 10
SELECT empleadoID,nombre FROM empleados WHERE nombre LIKE "%A%";

-- 11
SELECT empleadoID,nombre  FROM empleados WHERE nombre LIKE "%s";

-- 12 
SELECT empleadoID,nombre, comision FROM empleados WHERE comision IS NULL;

-- 13
SELECT empleadoID,nombre,departamentoID FROM empleados WHERE departamentoID = 30 OR departamentoID = 10;




