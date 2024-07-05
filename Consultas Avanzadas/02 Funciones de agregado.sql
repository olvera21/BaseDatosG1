--Funciones de agregado y agrupacion

--Utilizar base de datos

use NORTHWND;

--Funcones de Agregado

--Seleccionar el numero de todtal de ordenes de compra

--count(*)

select count(*) as 'Numero de ordenes' from Orders;

select count(*) from Customers;

select count(region) from Customers;

--Seleccionar el maximo numero de productos pedidos

SELECT max(quantity) as 'cantidad' 
FROM [Order Details];

-- Seleccionar el total de la cantidades de los productos productos 
SELECT sum(UnitPrice) FROM [Order Details];

--Seleccionar el total de dinero que he vendido
select avg(Quantity *od.UnitPrice) as 'Promedio de ventas'
from [Order Details] as od 
INNER JOIN Products as p
on od.ProductID = p.ProductID
where ProductName = 'Aniseed Syrup';  

--Seleccionar el numero de productos por categoria

SELECT CategoryID, count(*) as 'Numero de productos'
FROM Products;

SELECT count(*)
from products;

SELECT c.CategoryName as Categoria, count(Productid) as 'Numero de productos'
FROM Categories as c
INNER JOIN Products as p
on c.CategoryID = p.CategoryID
WHERE c.CategoryName in ('Beverages' ,'Confections')
GROUP by c.CategoryName;



