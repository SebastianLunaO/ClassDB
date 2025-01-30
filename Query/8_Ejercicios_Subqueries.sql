
-- 1
SELECT e.empleadoID,e.nombre,e.salario
FROM empleados e
WHERE e.salario > (SELECT salario FROM empleados WHERE nombre='Alonso, Peru');

-- 2
SELECT e.empleadoID, e.nombre,e.salario
FROM empleados e
WHERE e.salario > (SELECT AVG(salario) FROM empleados);

-- 3
SELECT e.empleadoID,e.nombre,e.fnac
FROM empleados e
WHERE YEAR(e.fnac) = (SELECT MAX(YEAR(fnac)) FROM empleados);

-- 4
SELECT e.empleadoID, e.nombre,e.salario
FROM empleados e
WHERE e.salario = (SELECT MAX(salario) FROM empleados);

-- 5
SELECT e.empleadoID,e.nombre
FROM empleados e
WHERE e.jefe IN
(SELECT empleadoID FROM empleados WHERE nombre='Anduaga, Ines' OR nombre='Inda, Ane');

-- 6
WITH avg_dep AS (
SELECT d.nombre as nombre_dep,avg(salario) AS sal_avg
FROM empleados
JOIN departamentos d ON d.departamentoID = empleados.departamentoID
GROUP BY empleados.departamentoID)

SELECT nombre_dep,sal_avg
FROM avg_dep
WHERE sal_avg > (SELECT AVG(salario) FROM empleados);

-- 7
WITH avg_dep AS (
SELECT d.nombre,AVG(e.salario) AS sal_avg, e.departamentoID AS dep_id
FROM empleados e
JOIN departamentos d ON d.departamentoID = e.departamentoID
GROUP BY e.departamentoID
)
SELECT e.empleadoID,e.nombre,e.salario
FROM empleados e
JOIN avg_dep ad ON ad.dep_id = e.departamentoID
WHERE e.salario > ad.sal_avg ORDER BY empleadoID;

-- 8
WITH imp_totales AS (
    SELECT c.nombre AS nom_cl,SUM(l.precio*l.cantidad) AS total_importes
FROM clientes c
JOIN pedidos p1 ON p1.clienteID = c.clienteID
JOIN lineas l ON l.pedidoID = p1.pedidoID
GROUP BY c.clienteID ORDER BY c.nombre ASC
)
SELECT nom_cl,total_importes
FROM imp_totales
WHERE total_importes > 
(SELECT SUM(l.precio*l.cantidad)
FROM clientes c
JOIN pedidos p1 ON p1.clienteID = c.clienteID
JOIN lineas l ON l.pedidoID = p1.pedidoID
WHERE c.nombre='Loreak');

-- 9
WITH grouped_year AS (
SELECT  
ct.nombre AS ct_Nom,
SUM(l.cantidad*l.precio) AS suma, 
YEAR(p.fecha) AS año
FROM articulos a
JOIN lineas l ON l.articuloID = a.articuloID
JOIN pedidos p ON p.pedidoID = l.pedidoID
JOIN categorias ct ON ct.categoriaID = a.categoriaID
GROUP BY ct.categoriaID,YEAR(p.fecha))

SELECT ct_Nom,suma,año
FROM grouped_year
WHERE suma > (
SELECT suma
FROM grouped_year
WHERE suma = (SELECT MAX(suma) FROM grouped_year WHERE año='1986'))
;


-- 10
-- INSERT INTO pedidos(pedidoID,fecha,clienteID) VALUES (622,'2025-03-15',102);

SELECT  c.clienteID
FROM clientes c
JOIN pedidos p ON p.clienteID = c.clienteID
WHERE YEAR(p.fecha) = '2025';

-- 11
SELECT c.clienteID,c.nombre
FROM clientes c
WHERE c.clienteID  NOT IN (
    SELECT  c.clienteID
    FROM clientes c
    JOIN pedidos p ON p.clienteID = c.clienteID
    WHERE YEAR(p.fecha) = '2025'
);

-- 12
SELECT DISTINCT c.clienteID,c.nombre
FROM clientes c
JOIN pedidos p ON p.clienteID = c.clienteID
WHERE c.clienteID NOT IN (SELECT  c.clienteID
    FROM clientes c
   JOIN pedidos p ON p.clienteID = c.clienteID
WHERE YEAR(p.fecha) = '2025') AND p.pedidoID = '2024';

-- 13 
-- INSERT INTO lineas (
--     pedidoID,
--     articuloID,
--     precio,
--     cantidad
--   )
-- VALUES (
--     622,
--     1001,
--     169.00,
--     1
--   );

SELECT DISTINCT a.articuloID
FROM articulos a
JOIN lineas l ON l.articuloID = a.articuloID
JOIN pedidos p ON p.pedidoID = l.pedidoID
WHERE a.articuloID NOT IN  (SELECT a.articuloID
FROM articulos a
JOIN lineas l ON l.articuloID = a.articuloID
JOIN pedidos p ON p.pedidoID = l.pedidoID
WHERE YEAR(p.fecha) = '2025');