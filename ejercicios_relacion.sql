-- ALTER TABLE Clientes ADD CONSTRAINT clientes_FK FOREIGN KEY (IDComercial) REFERENCES Comerciales(IDComercial);

-- -- 1
-- SELECT Nombre
-- FROM clientes;

-- -- 2
-- SELECT IDCliente,clientes.Nombre
-- FROM clientes,comerciales;

-- -- 3
-- SELECT  idcliente, c.nombre
-- FROM clientes c;

-- -- 4
-- SELECT idcliente, c.nombre
-- FROM clientes c, comerciales;

-- -- 5
-- SELECT idcliente, c.nombre
-- FROM clientes c JOIN comerciales co ON c.idcomercial=co.idcomercial;

-- -- 6 
-- SELECT c.nombre
-- FROM clientes c 
-- JOIN Comerciales co ON c.IDComercial= co.IDComercial
-- WHERE co.Nombre = 'Irune Agerre';

-- -- 7
-- SELECT c.nombre, co.Nombre
-- FROM clientes c 
-- JOIN Comerciales co ON c.IDComercial= co.IDComercial
-- WHERE c.Nombre = 'Pates Zubia';

-- -- 8
-- SELECT co.Nombre
-- FROM Comerciales co
-- WHERE co.IDComercial NOT IN (SELECT IDComercial FROM Clientes);

-- -- 9 
-- ALTER TABLE RelComCli ADD CONSTRAINT RelComCli_FK_Co FOREIGN KEY (IDComercial) REFERENCES ComercialesB(IDComercial);
-- ALTER TABLE RelComCli ADD CONSTRAINT RelComCliFK_Cli FOREIGN KEY (IDCLiente) REFERENCES ClientesB(IDCLiente);

-- -- 10 
-- SELECT  c.idcliente, c.nombre 
-- FROM  clientesB c, comercialesB;

-- -- 11
-- SELECT  c.idcliente, c.nombre
-- FROM clientesB c, RelComCli a
-- WHERE  c.idcliente = a.idcliente ;

-- -- 12
-- SELECT  DISTINCT  co.idcomercial , co.nombre
-- FROM ComercialesB co LEFT JOIN  RelComCli a ON co.idcomercial = a.idcomercial;

-- -- 13
-- SELECT CB.Nombre
-- FROM ClientesB CB
-- JOIN RelComCli RCC ON RCC.IDCLiente = CB.IDCliente
-- JOIN ComercialesB CoB ON RCC.IDComercial = CoB.IDComercial 
-- WHERE CoB.Nombre = 'Irune Agerre'

-- -- 14
-- SELECT CB.Nombre,CoB.Nombre
-- FROM ClientesB CB
-- JOIN RelComCli RCC ON RCC.IDCLiente = CB.IDCliente
-- JOIN ComercialesB CoB ON RCC.IDComercial = CoB.IDComercial 
-- WHERE CB.Nombre = 'Ulma S.Coop.';

-- -- 15
-- SELECT c.Nombre
-- FROM ClientesB c
-- WHERE c.IDCliente NOT IN (SELECT IDCliente FROM RelComCli);


-- -- 16 
-- SELECT co.Nombre
-- FROM ComercialesB co
-- WHERE co.IDComercial NOT IN (SELECT IDComercial FROM RelComCli);
