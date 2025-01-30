-- 1
SELECT d.nombre,COUNT(*)
FROM empleados
JOIN departamentos d ON d.departamentoID= empleados.departamentoID
GROUP BY empleados.departamentoID;

-- 2
SELECT d.nombre,AVG(e.salario)
FROM empleados e
JOIN departamentos d ON d.departamentoID = e.departamentoID
GROUP BY e.departamentoID;

-- 3
SELECT c.nombre,COUNT(*) AS total
FROM clientes c
JOIN pedidos p ON p.clienteID = c.clienteID
GROUP BY c.clienteID ORDER BY total DESC;

-- 4
SELECT c.nombre ,COUNT(*) AS total
FROM clientes c
JOIN pedidos p ON (p.clienteID = c.clienteID)
WHERE YEAR(p.fecha) = '1986'
GROUP BY c.clienteID ORDER BY total DESC;

-- 5
SELECT c.nombre,SUM(l.precio*l.cantidad)
FROM clientes c
JOIN pedidos p1 ON p1.clienteID = c.clienteID
JOIN lineas l ON l.pedidoID = p1.pedidoID
GROUP BY c.clienteID ORDER BY c.nombre ASC;

-- 6
SELECT a.articuloID,a.descripcion,SUM(l.cantidad) as total
FROM articulos a
JOIN lineas l ON l.articuloID = a.articuloID
JOIN pedidos p ON l.pedidoID = p.pedidoID
WHERE YEAR(p.fecha) = '1986'
GROUP BY a.articuloID ORDER BY total DESC;

-- 7
SELECT a.articuloID,a.descripcion,SUM(l.precio*l.cantidad) as total
FROM articulos a
JOIN lineas l ON l.articuloID = a.articuloID
JOIN pedidos p ON l.pedidoID = p.pedidoID
WHERE YEAR(p.fecha) = '1986'
GROUP BY a.articuloID ORDER BY total DESC;

-- 8
SELECT YEAR(p.fecha),SUM(l.cantidad*l.precio)
FROM pedidos p
JOIN lineas l ON l.pedidoID = p.pedidoID
GROUP BY YEAR(p.fecha);

-- 9
WITH yearly_totals AS (
    SELECT 
        c.nombre AS nombre_cliente,
        YEAR(p.fecha) AS año,
        SUM(l.precio * l.cantidad) AS total_año
    FROM clientes c
    JOIN pedidos p ON c.clienteID = p.clienteID
    JOIN lineas l ON p.pedidoID = l.pedidoID
    GROUP BY c.clienteID, c.nombre, YEAR(p.fecha)
)
SELECT 
    nombre_cliente,
    año,
    SUM(total_año) OVER (PARTITION BY nombre_cliente ORDER BY año) AS acumulado
FROM yearly_totals
ORDER BY nombre_cliente, año;

-- 10
WITH yearly_totals AS (
    SELECT 
        c.poblacion AS nombre_cliente,
        YEAR(p.fecha) AS año,
        SUM(l.precio * l.cantidad) AS total_año
    FROM clientes c
    JOIN pedidos p ON c.clienteID = p.clienteID
    JOIN lineas l ON p.pedidoID = l.pedidoID
    GROUP BY c.clienteID, c.nombre, YEAR(p.fecha)
)
SELECT
    nombre_cliente
    año,
    SUM(total_año) OVER (PARTITION BY nombre_cliente ORDER BY año) AS acumulado
FROM yearly_totals
WHERE año='1986';