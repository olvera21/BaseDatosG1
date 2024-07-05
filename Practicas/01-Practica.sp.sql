use NORTHWND;
Go
--Crear un sp que solicite un id de una categoria y devuelva el promedio de los precios de sus productos

Create or alter proc sp_solicitar_promedio_prod
@catego int --
AS
begin
select avg(UnitPrice) as 'Promedio de precios de los productos'
from Products 
where CategoryID = @catego;
end
Go

execute sp_solicitar_promedio_prod @catego = 5