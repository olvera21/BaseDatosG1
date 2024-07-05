create database pruebajoinsg1;

use pruebajoinsg1;

create table proveedor(
    provid int not null identity (1,1),
    nombre varchar(50) not null,
    limite_credito money not null,
    constraint pk_proveedor
    primary key (provid),
    constraint unico_nombrepro
    unique(nombre)
);

create table productos(
    productid int not null IDENTITY (1,1),
    nombre VARCHAR(50) NOT NULL,
    precio money not null,
    existencia int not null,
    proveedor int,
    CONSTRAINT pk_producto
    primary key (productid),
    CONSTRAINT unico_nombre_proveedor
    UNIQUE (nombre),
    CONSTRAINT fk_proveedor_producto
    FOREIGN key (proveedor)
    REFERENCES proveedor(provid)
)

--Agregar registros a las tablas proveedor y productos

insert into proveedor(nombre, limite_credito)
VALUES 
('proveedor1',5000),
('proveedor2',6778),
('proveedor3',6788),
('proveedor4',5677),
('proveedor5',6666);

select * from proveedor;

insert into productos (nombre, precio, existencia, proveedor)
VALUES
('Producto1', 56, 34, 1),
('Producto2', 56, 56, 12, 1),
('Producto3', 45, 6, 33, 2),
('Producto4', 22, 34, 666, 3);

use NORTHWND;

SELECT c.categoryname, p.ProductName, p.UnitsInStock, p.UnitPrice, p.Discontinued
from(
    SELECT categoryname, CategoryID from Categories
) as c 
INNER JOIN
(
    SELECT ProductName, UnitsInStock, CategoryID, UnitPrice, Discontinued from Products
) as p 
on c.CategoryID = p.CategoryID
--Segundo--
SELECT s.CompanyName as 'proveedor', sum(od.UnitPrice* od.Quantity) as 'Total de ventas'
from (
 select CompanyName,SupplierID from Suppliers 
)as s

INNER JOIN
(
    select ProductId,  as p 
on s. SupplierID = p.SupplierID
INNER JOIN [order Details] as od 
on od.ProductID = p.ProductID
INNER JOIN 
(
    select orders AS o 
on o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-09-01' and '1996-12-31'
GROUP BY s.CompanyName
ORDER BY 'Total de ventas' DESC;

--LEFT JOIN 

use pruebajoinsg1;

select
from 
proveedor as p 
left join productos as pr 
on pr.proveedor = p.provid;