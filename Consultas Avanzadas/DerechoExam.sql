
CREATE DATABASE pruebacargadinamica;
GO

USE pruebacargadinamica;
GO
insert into pruebacargadinamica.dbo.empleado (FirstName, LastName, [Address], HomePhone, Country)
select FirstName, LastName, [Address], HomePhone, Country 
from NORTHWND.dbo.Employees;

select top 0 EmployeeID, FirstName, LastNAme, [Address], HomePhone, Country
into pruebacargadinamica.dbo.dim_empleado
from pruebacargadinamica.dbo.empleado;

CREATE TABLE dbo.[Dim-Empleado] (
    idempleado INT IDENTITY(1,1) PRIMARY KEY,
    NombreCompleto NVARCHAR(100),
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(20)
);

INSERT INTO dbo.[Dim-Empleado] (NombreCompleto, Direccion, Telefono)
SELECT 
    CONCAT(FirstName, ' ', LastName) AS NombreCompleto,
    [Address] AS Direccion,
    HomePhone AS Telefono
FROM dbo.empleado;


SELECT * FROM dbo.[Dim-Empleado];
GO

CREATE OR ALTER TRIGGER trg_UpdateDimEmpleado
ON dbo.empleado
AFTER INSERT, UPDATE
AS
BEGIN
    MERGE INTO dbo.[Dim-Empleado] AS target
    USING (
        SELECT 
            CONCAT(i.FirstName, ' ', i.LastName) AS NombreCompleto,
            i.[Address] AS Direccion,
            i.HomePhone AS Telefono
        FROM inserted i
    ) AS source ON target.NombreCompleto = source.NombreCompleto
    WHEN MATCHED THEN
        UPDATE SET
            Direccion = source.Direccion,
            Telefono = source.Telefono
    WHEN NOT MATCHED THEN
        INSERT (NombreCompleto, Direccion, Telefono, Salario)
        VALUES (source.NombreCompleto, source.Direccion, source.Telefono, 0);
END;
GO

INSERT INTO dbo.empleado (FirstName, LastName, [Address], HomePhone, Country)
VALUES ('John', 'Doe', '123 Main St', '555-1234', 'USA');

SELECT * FROM dbo.[Dim-Empleado];

SELECT*FROM dbo.empleado;

INSERT INTO dbo.empleado (FirstName, LastName, [Address], HomePhone, Country)
VALUES ('Eduardo', 'Olvera', '123 Main St', '555-1234', 'MEX');




SELECT * FROM dbo.[Dim-Empleado];

SELECT*FROM dbo.empleado;