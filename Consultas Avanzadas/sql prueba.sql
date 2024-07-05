--Crear base de datos
Create database pruebaxyz;
--Utilizar bases de datos
use preuebaxyz;
--Crear una tabla a partir de una constulta con cero registros
select top 0*
into pruebaxyz.dbo.products2
from NORTHWND.dbo.Products;


select*from products2
--Agrega un constraint a la tabla products2
alter table products2
add constraint pk_products2
primary key(productid);

select*from products2;
--llenar una tabla a partir de una consulta

insert into pruebaxyz.dbo.products2 (ProductName, SupplierID,
CategoryID, QuantityPerUnit, Uniteprice, UnitsStock, UnitsOnOrder,
RecorderLevel, Discontinued)
select*from NORTHWND.dbo.Products;

select ProductName, SupplierID,
CategoryID, QuantiyPerUnit, Uniteprice, UnitsStock, UnitsOnOrder,
RecorderLevel, Discontinued
select*from NORTHWND.dbo.Products;
