
-- -- 1
-- CREATE USER usuario_01;

-- SELECT * FROM mysql.user;

-- GRANT SELECT ON *.* TO usuario_01;

-- -- 2

-- CREATE USER usuario_02;

-- GRANT SELECT,DELETE,UPDATE,INSERT ON KIROLDENDA.* TO usuario_02;

-- -- 3
-- CREATE USER usuario_03;

-- GRANT SELECT,UPDATE ON KIROLDENDA.empleados TO usuario_03;

CREATE USER usuario_04;

GRANT SELECT ON KIROLDENDA.* TO usuario_04;
REVOKE SELECT (salario) ON 