use NORTHWND;

SELECT ProductName, UnitPrice, UnitsInstock,Discontinued, 
disponibiliad = CASE Discontinued
WHEN 0 then 'No disponible'
WHEN 1 then 'Diponible'
else 'No existenete'
end
from Products

select ProductName,UnitsInstock, UnitPrice,
case 
when UnitPrice >=1 and UnitPrice<18 then 'Producto Barato'
when Unitprice >=18 and UnitPrice <=200 then 'Producto Barato'
when UnitPrice BETWEEN 51 and 100 then 'Producto Caro'
else 'Carisimo'
end as 'Categoria de Precios'
 from Products;

 