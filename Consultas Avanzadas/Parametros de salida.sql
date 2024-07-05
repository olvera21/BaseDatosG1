--Parametros de salida 

create or alter procedure calcular_area
--Parametros de entrada
@radio float,
--Parametros de salida
@area float output
AS 
begin 
	SET @area =PI() * @radio * @radio
 end

 GO

 DECLARE @resp float
 exec calcular_area @radio = 22.3, @area = @resp
 print 'El area es:' + cast(@resp as varchar)

 use NORTHWND;
 GO
 create or alter proc sp_obtenerdatosempleado
 @numeroEmpleado int,
 @fullname nvarchar(35) output
AS
begin
	select @fullname=CONCAT(FirstName, ' ', LastName)
	from
	Employees
	where EmployeeID = @numeroEmpleado;
end;
GO

declare  @nombrecompleto nvarchar(35)
exec sp_obtenerdatosempleado @numeroEmpleado = 3, @fullname = @nombrecompleto output
print @nombrecompleto  
GO

CREATE OR ALTER PROCEDURE sp_obtenerdatosempleado_buscar
    @numeroEmpleado INT,
    @fullname NVARCHAR(35) OUTPUT
AS
BEGIN
    SELECT @fullname = CONCAT(FirstName, ' ', LastName)
    FROM Employees
    WHERE EmployeeID = @numeroEmpleado;
    IF @fullname IS NULL
    BEGIN
        SET @fullname = 'ID no existente';
    END
END;

DECLARE @fullname NVARCHAR(35);
EXEC sp_obtenerdatosempleado_buscar @numeroEmpleado = 2, @fullname = @fullname OUTPUT;
PRINT @fullname;

select*from Customers;

Create database etlempresa;
use etlempresa;
create table cliente(
	clienteid int not null identity(1,1),
	clientedk nchar(5) not null,
	empresa nvarchar(40) not null,
	ciudad nvarchar(15) not null,
	region nvarchar(15) not null,
	pais nvarchar(15) not null,
	constraint pk_cliente
	primary key(clienteid)
);
insert into etlempresa.dbo.cliente
select CustomerID, UPPER(CompanyName) as 'Empresa' ,UPPER(city) as Ciudad
,UPPER(ISNULL(nc.Region, 'SIN REGION')) as Region, UPPER(Country) as pais from NORTHWND.dbo.Customers as nc
left join etlempresa.dbo.cliente etle
on nc.CustomerID = etle.clientedk
where etle.clientedk is null;

select*from NORTHWND.dbo.Customers as nc
left join etlempresa.dbo.cliente etle
on nc.CustomerID = etle.clientedk;

select*from cliente;

truncate table etlempresa.dbo.cliente

update cl
set 
cl.empresa = UPPER(c.companyName),
cl.ciudad = UPPER (c.city),
cl.pais = UPPER (c.country),
cl.region = UPPER(isnull(c.region,'Sin region'))
from NORTHWND.dbo.Customers as c
inner join etlempresa.dbo.cliente as cl
on c.CustomerID =cl.clientedk;

CREATE PROCEDURE sp_etl_carga_cliente
AS
BEGIN
insert into etlempresa.dbo.cliente
select CustomerID, UPPER(CompanyName) as 'Empresa' ,UPPER(city) as Ciudad
,UPPER(ISNULL(nc.Region, 'SIN REGION')) as Region, UPPER(Country) as pais from NORTHWND.dbo.Customers as nc
left join etlempresa.dbo.cliente etle
on nc.CustomerID = etle.clientedk
where etle.clientedk is null;

UPDATE NORTHWND.dbo.Customers
SET CompanyName = 'pepsi'
where CustomerID = 'CLIB1'
END
GO
select * from etlempresa.dbo.cliente
where clientedk ='CLIB1'

select*from NORTHWND.dbo.Customers
where CustomerID = 'CLIB1'
