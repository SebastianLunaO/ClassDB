
-- 1
SELECT nombre,salario,salario +(salario*0.03), salario +(salario*0.03) + (comision)
FROM empleados;

-- 2
SELECT clienteID, LOWER (nombre) 
FROM clientes;

-- 3
SELECT clienteID,nombre,cod_postal 
FROM clientes
WHERE cod_postal LIKE "20%";

-- 4
SELECT SUM(salario)
FROM empleados;

-- 5
SELECT SUM(salario)
FROM empleados
WHERE departamentoID = 30;

-- 6
SELECT COUNT(*)
FROM empleados
WHERE comision>=0;

-- 7
SELECT AVG(salario)
FROM empleados;

-- 8 
SELECT departamentos.nombre, empleados.nombre
FROM empleados,departamentos
WHERE empleados.departamentoID = departamentos.departamentoID;   

-- 9
SELECT clientes.nombre, empleados.nombre
FROM empleados,clientes
WHERE empleados.empleadoID = clientes.empleadoID;

-- 10
SELECT pedidoID
FROM pedidos,clientes
WHERE pedidos.clienteID = clientes.clienteID AND clientes.nombre = "Erreala";

-- 11 
SELECT l.articuloID, a.descripcion AS nombre_articulo, l.precio, l.cantidad
FROM lineas l
JOIN articulos a ON l.articuloID = a.articuloID
WHERE l.pedidoID = 606;

-- 12
SELECT articuloID, descripcion FROM articulos WHERE articuloID IN
(SELECT DISTINCT articuloID FROM lineas WHERE pedidoID IN
(SELECT pedidoID FROM pedidos WHERE clienteID IN
(SELECT c.clienteID
FROM clientes c
JOIN empleados ON c.empleadoID = empleados.empleadoID
WHERE empleados.nombre ='Gonzalez, Ion')));

-- 13
SELECT nombre FROM clientes WHERE clienteID NOT IN (SELECT clienteId FROM pedidos);

-- 14
SELECT * FROM empleados
WHERE departamentoID IS NULL;

-- 15
SELECT SUM(precio*cantidad) 
FROM lineas
WHERE pedidoID IN
(
SELECT pedidoID
FROM pedidos
WHERE YEAR(fecha) = 1987);

-- 16
SELECT nombre,fnac FROM empleados WHERE fnac IN
(SELECT MIN(fnac)
FROM empleados);

-- 17
SELECT articuloID,descripcion,((stock_medio - stock)) cantidad_pedir
FROM articulos
WHERE stock < stock_min;

-- 18
SELECT articuloID,descripcion,precio 
FROM articulos
JOIN categorias ON categorias.categoriaID = articulos.categoriaID
WHERE categorias.nombre = "Atletismo";

-- 19
SELECT l.pedidoID, l.articuloID, a.descripcion, a.precio catalogo, l.precio venta
FROM lineas l,articulos a
WHERE a.precio > l.precio;

-- 20
SELECT e1.nombre,d.nombre,e2.nombre,d2.nombre
FROM empleados e1
INNER JOIN empleados e2
ON e1.jefe = e2.empleadoID
JOIN departamentos d ON d.departamentoID = e1.departamentoID
JOIN departamentos d2 ON d2.departamentoID = e2.departamentoID;

