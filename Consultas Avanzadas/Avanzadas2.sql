
-- Sellecionar todas las ordenes que fueron emitidas por los
-- empleados Nancy Davolio, Anne Dodsworth y Andrew Fuller

select * from Orders
where EmployeeID = 1 
or EmployeeID = 9 
or EmployeeID = 2;

select * from Orders
where EmployeeID in(1,9,2);

-- Seleccionar todas las ordenes, dividiendo la fecha de orden en, año, mes y dia 
select orderDate as 'Fecha de orden', 
year(OrderDate) as 'Año', 
month (OrderDate) as 'Mes', 
day(OrderDate) as 'Día' 
from Orders;

-- Seleccionar todos los nombres de los empleados
select concat(FirstName,' ' ,LastName) as 'Nombre Completo' 
from Employees;

-- Seleccionar todos los productos donde la existencia sea mayor o igual a 40
-- y el precio sea menor a 19
select ProductName as 'Nombre del prodcuto', 
UnitPrice as 'Precio', 
UnitsInStock as 'Existencia' 
from Products
where UnitsInStock >= 40
and  UnitPrice < 19;

SELECT OrderID, CustomerID, EmployeeID, OrderDate 
FROM Orders
WHERE OrderDate BETWEEN '1996-04-01' AND '1996-08-31';

--Seleccionar todas las ordenes entre 1996 y 1998

SELECT OrderID, CustomerID, EmployeeID, OrderDate 
FROM Orders
WHERE OrderDate BETWEEN '1996-01-01' AND '1998-01-01';

--Seleccionar todas las ordenes de 1996 y 1999

SELECT*FROM Orders
WHERE YEAR(OrderDate) BETWEEN '1996' AND '1999';

SELECT * FROM 
Orders
WHERE YEAR(OrderDate) in ('1996','1999')

--Seleccionar todos los productos que comiencen con c

SELECT * 
FROM Products
WHERE ProductName like 'c%';

--Seleccionar todos los productos que terminen con s

SELECT * 
FROM Products
WHERE ProductName like '%s';

--Seleccionar todos los productos que el nombre del producto contenga la palabra
SELECT * 
FROM Products
WHERE ProductName like '%no%';

--Seleccionar todos los productos que contengan todas las letras a o n

SELECT * 
FROM Products
WHERE ProductName like '%a%' OR ProductName like '%n%';

SELECT * 
FROM Products
WHERE ProductName like '%[AN]%';

--Seleccionar todos los productos que comienzen entre la letra A y la N

SELECT * 
FROM Products
WHERE ProductName like '[A-N]%'

-- Sellecionar todas las ordenes que fueron emitidas por los
-- empleados Nancy Davolio, Anne Dodsworth y Andrew Fuller

SELECT o.OrderId as"Numero de Orden",
OrderDate as "Fecha de Orden",
concat(FirstName, '', LastName) as "Nombre Empleado"
 FROM Employees as e
INNER JOIN
Orders as o
on e.EmployeeID = o.EmployeeID
WHERE e.FirstName in('Nancy', 'Anne', 'Andrew')
and e.LastName in ('Davolio','Dodsworth', 'FUller')