USE NORTHWND;

--Lenguaje SQL-LMD--
--Seleccionar todos los productos--

SELECT*FROM Products;

--Seleccionar todas las categorias--

select*from Categories;

--Seleccionar los proveedores--

SELECT*FROM Suppliers;

--Seleccionar los clientes--

SELECT*FROM Customers;

--Seleccionar los empleados--

SELECT * FROM Employees;

--Seleccionar todos las paqueterias--

SELECT * FROM Shippers;

--Seleccionar todas las ordenes--

SELECT * FROM Orders;

--Seleccionar todos los detalles--

SELECT * FROM [Order Details];
-- --
SELECT ProductID, ProductName, UnitsInStock, UnitPrice FROM Products;

--Alias de columnas--

select ProductID AS Nombreproducto, ProductName AS "Nombre Producto", UnitsInStock, UnitPrice  AS "Precio"
FROM Products;

--Alias de tabla--

select Products.ProductID AS Nombreproducto, ProductName AS "Nombre Producto", UnitsInStock, UnitPrice  AS "Precio"
FROM Products;

SELECT*FROM Products, Categories
where Categories.CategoryID = Products.CategoryID;

SELECT*FROM Products;
SELECT*FROM Customers;

--Campo calculado--
--Seleccionar todos los productos mostrando el id del producto, 
--Nombre del produco, Existencia, Precio, Importe--

SELECT ProductID AS "Numero de producto", ProductName AS "Nombre de producto", 
 UnitsInStock AS "Existencia", UnitPrice AS "Precio", (UnitPrice*UnitsInStock) 
AS "importe" FROM Products;


--Seleccionar las primera 10 ordenes--

SELECT top 10* FROM Orders;

--Seleccionar todos clientes ordenados de forma asendente por el pais--

SELECT CustomerId as "Numero de cliente", Companyname as "Nombre del cliente", 
[address] as "Direccion",City as "Ciudad", Country as "Pais"
 FROM Customers order by Country; 

 SELECT CustomerId as "Numero de cliente", Companyname as "Nombre del cliente", 
[address] as "Direccion",City as "Ciudad", Country as "Pais"
 FROM Customers order by Country ASC; 

 --................--
 SELECT CustomerId as "Numero de cliente",
  Companyname as "Nombre del cliente", 
[address] as "Direccion",
City as "Ciudad",
 Country as "Pais"
 FROM Customers order by 5 ASC; 
--.........--
 SELECT CustomerId as "Numero de cliente",
  Companyname as "Nombre del cliente", 
[address] as "Direccion",
City as "Ciudad",
 Country as "Pais"
 FROM Customers order by "Pais" ASC; 

--Seleccionar todos los clientes ordenados por pais de forma decendente--}}

 SELECT CustomerId as "Numero de cliente",
  Companyname as "Nombre del cliente", 
[address] as "Direccion",
City as "Ciudad",
 Country as "Pais"
 FROM Customers order by Country DESC; 

SELECT CustomerId as "Numero de cliente",
Companyname as "Nombre del cliente", 
[address] as "Direccion",
City as "Ciudad",
 Country as "Pais"
 FROM Customers order by 5 DESC; 

    SELECT* FROM Customers
    ORDER by country DESC, City DESC;

--Selecciona todos los clientes ordenados de forma ascendente por pais y dentro de 
--cada pais ordenado por ciudad de forma descendente--

SELECT CustomerID, CompanyName, Country,city
FROM Customers
order by country, city DESC;

--Operadores Relacionales
-- (<,>, <=, >=, ==, <> o !=)

--Seleccionar los paises a los cuales se les ha enviado las ordenes 
 
 SELECT distinct ShipCountry FROM Orders
 ORDER by 1;

--Seleccionar todas las ordenes enviadas a francia--

SELECT ShipCountry FROM Orders WHERE ShipCountry = 'France';

--Seleccionar todas las ordenes realizadas a francia, mostrando, 
--el numero de orden, cliente al que se vendio, empleado que la realizo, pais al que se envio
--ciudad a la que se envio

SELECT OrderID as "Numero de orden",
CustomerID as "Cliente al que se vendio",
EmployeeID as "Empleado",
ShipCountry as "pais",
ShipCity as "Ciudad"
FROM Orders Where ShipCountry = 'France';

--Selecionar las ordenes en donde no se ha asignado region de envio--
SELECT ShipRegion as "Region" FROM Orders Where ShipRegion is null;

--Seleccionar las ordenes donde se ha asiganado las regiones --

SELECT OrderID as "Numero de orden",
CustomerID as "Cliente al que se vendio",
EmployeeID as "Empleado",
ShipCountry as "pais",
ShipCity as "Ciudad"
FROM Orders Where ShipRegion is not null;

--Seleccionar los productos con un precio mayor a 50$--

SELECT ShipRegion as "Region" FROM Orders Where ShipRegion is null;

--Seleccionar los empleados contratados despues del primero de enero de 1990
SELECT*FROM Employees WHERE HireDate > '1990-01-01';
--Seleccionar los clientes cullo pais sea de alemania
SELECT * FROM Customers where Country = 'Germany'
--Mostrar los productos con una cantidad menor o igual a 100
SELECT*FROM Products Where UnitsInStock >= 100.00

--Seleccionar las ordenes realizadas antes del primero de enero de 1998

SELECT*FROM Orders WHERE OrderDate <'1998-01-01'

--Seleccionar todas las ordenes realizadas por el empleado fuller

SELECT * FROM Orders WHERE EmployeeID = '2'

--Seleccionar todas las ordenes mostrando el numero de orden, el cliente y la fecha de orden
--Dividida en año mes y dia

SELECT OrderID as "Numero de orden", CustomerID as "Cliente", OrderDate as "Fecha de orden"
, YEAR(OrderDate) as "AÑO", MONTH(OrderDate ) as "Mes", DAY(OrderDate) as "Dia" from Orders;

--Seleccionar los productos con un precio mayo a 50 y con una cantidad menor igual a 100

SELECT UnitPrice as "precio" FROM Products WHERE UnitPrice <50 AND UnitsInStock >=100;

--Seleccionar las ordenes para francia y alemania 

SELECT ShipCountry as "Pais" FROM Orders WHERE ShipCountry ='France' OR ShipCountry ='Germany';

SELECT ShipCountry as "Pais" FROM Orders WHERE ShipCountry in ('France', 'Germany', 'Mexico')
ORDER BY ShipCountry ASC;

--