-- No ejecuta por que al salario le falta un =
-- Select empleadoID , nombre, salario + comision
-- From Empleados
-- Where salario 1000;

-- no ejecuta por la syntaxis en where
Select empleadoID , UPPER(nombre)
From Empleados
Where nombre = "Ane" AND "Igor";

-- No indican de que tabla
-- Select 8 * 8 + salario ;
-- Select 6 > 135 ;

-- IT WORKS
Select empleadoID , nombre
From Empleados
Where SUBSTRING(nombre,1,3) LIKE 'A__';

Select concat( empleadoID , "–" , nombre , "poblacion")
From Empleados
Where empleadoID * 12 ;

-- Poblacion no es un campo de esta tabla
-- Select empleadoID , "- " , nombre
-- From Empleados
-- Order by poblacion ;

-- Ejecuta pero no se cumple la condicion
Select empleadoID , nombre
From Empleados
where fnac between 2017-1-1 and 2017-12-31 ;

Select empleadoID , nombre , year(fnac)
From Empleados
where year(fnac) = 2005 ;

Select empleadoID , nombre
From Empleados
where year( curdate() ) - year(fnac) > 18 ;

Select empleadoID , nombre
From Empleados
where year( curdate() ) - year(fnac) > 18 or nombre = "Ane" ;

Select cantidad * precio, cantidad * precio / 2  
From Lineas
where cantidad > 10;

Select count(empleadoID)
From Empleados ;


-- Nombre es un varcahr por lo que no sumaria nada
Select sum(nombre)
From Empleados ;