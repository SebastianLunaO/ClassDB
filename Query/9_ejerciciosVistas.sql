DROP VIEW IF EXISTS uno ;
-- CREATE VIEW uno AS 
--     SELECT c.nombre,p.pedidoID
--     FROM clientes c
--     JOIN pedidos p ON p.clienteID = c.clienteID
--     WHERE c.nombre='Kirolak';

-- DROP VIEW IF EXISTS dos;
-- CREATE VIEW dos AS
-- SELECT c.nombre,p.pedidoID,(l.precio*l.cantidad) AS importe
-- FROM clientes c
-- JOIN pedidos p ON p.clienteID = c.clienteID
-- JOIN lineas l ON l.pedidoID= p.pedidoID
-- ORDER BY importe DESC;

-- DROP VIEW IF EXISTS tres;
-- CREATE VIEW tres AS
-- SELECT c.nombre,SUM(l.cantidad*l.precio)
-- FROM clientes c
-- JOIN pedidos p ON p.clienteID = c.clienteID
-- JOIN lineas l ON l.pedidoID = p.pedidoID
-- GROUP BY c.nombre;