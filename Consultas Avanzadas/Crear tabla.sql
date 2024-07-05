--Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado
--del representante de ventas de cada pedido

--Nombre Cliente(Customers)
--Nombre del Empleado(Empleoyes)
--Pedido

use NORTHWND;
SELECT CustomerId, Employeeid, o.orderid, o.orderdate FROM
orders as o;
--Ejercicio 3
SELECT c.CompanyName as "Nombre del Cliente",
concat(e.FirstName, ',' ,e.LastName) as 'Nombre del Empleado',
 o.OrderId, o.orderdate
FROM Customers as c
INNER JOIN orders as o
ON o.CustomerId = c.CustomerId
INNER JOIN Employees as e
ON o.EmployeeID = e.EmployeeID
INNER JOIN [Order Details] as od
ON od.OrderId = o.OrderID;


--Ejercicio 4: Obtener el nombre del empleado, el título del cargo y el departamento del empleado para cada empleado.
SELECT FirstName as 'Nombre del empleado', TitleOfCourtesy as 'Titulo de Cargo', EmployeeID as 'Departamento del empleado'
 FROM Employees;

--Ejercicio 5: Mostrar el nombre del proveedor, el nombre del contacto y el teléfono del contacto para cada proveedor.
SELECT * FROM Orders;
--Ejercicio 6: Listar el nombre del producto, la categoría del producto y el nombre del proveedor para cada producto.
--Ejercicio 7: Obtener el nombre del cliente, el ID del pedido, el nombre del producto y la cantidad del producto para cada detalle del pedido.
--Ejercicio 8: Obtener el nombre del empleado, el nombre del territorio y la región del territorio para cada empleado que tiene asignado un territorio.
--Ejercicio 9: Mostrar el nombre del cliente, el nombre del transportista y el nombre del país del transportista para cada pedido enviado por un transportista.
SELECT CompanyName as 'Nombre del cliente' 
From Customers;
--Ejercicio 10: Obtener el nombre del producto, el nombre de la categoría y la descripción de la categoría para cada producto que pertenece a una categoría.
SELECT 
    p.ProductName AS 'Nombre del producto', 
    c.CategoryName AS 'Nombre de la categoria', 
    c.Description AS 'Descripción de la categoría'
FROM 
    Products AS p
INNER JOIN 
    Categories AS c
ON 
    p.CategoryID = c.CategoryID;
--Ejercicio 11: Seleñcionar el total de ordenes hechas por cada uno de los provedores
select s.CompanyName as 'Proveedor', count(od.orderId) as 'TotalOrdenes' from Suppliers as s
inner join products as p
on s.SupplierID = p.SupplierID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by s.CompanyName;
--Ejercicio 12. Seleccionar el total de dinero que he vendido por proveedor del primer trimestre de 1996
SELECT s.CompanyName as 'proveedor', sum(od.UnitPrice* od.Quantity) as 'Total de ventas'
from Suppliers as s
INNER JOIN Products as p 
on s. SupplierID = p.SupplierID
INNER JOIN [order Details] as od 
on od.ProductID = p.ProductID
INNER JOIN orders AS o 
on o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-09-01' and '1996-12-31'
GROUP BY s.CompanyName
ORDER BY 'Total de ventas' DESC;

--Ejercicio 13. Seleccionar el total de dinero vendido por categoria

SELECT c.Cate

--Ejercicio 14. Seleccionar el total de dinero vendido por categoria y dentro por producto.

SELECT c.CategoryName as 'Nombre de la categoria',
p.ProductName as 'Producto',
sum([od.Quantity * od.UnitPrice) as 'Total'
FROM [Order Details] as [od]
INNER JOIN Products as p 
on od.ProductID = p.ProductID
INNER JOIN Categories as c 
on c.CategoryID = p.CategoryID
GROUP BY c.CategoryName, p.ProductName
GROUP BY 1 asc;