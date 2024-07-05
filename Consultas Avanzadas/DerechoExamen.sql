CREATE DATABASE pruebacargadinamica;
GO

USE pruebacargadinamica;
GO

SELECT TOP 0 EmployeeID, FirstName, LastName, [Address], HomePhone, Country
INTO pruebacargadinamica.dbo.empleado
FROM NORTHWND.dbo.Employees;

INSERT INTO pruebacargadinamica.dbo.empleado (FirstName, LastName, [Address], HomePhone, Country)
SELECT FirstName, LastName, [Address], HomePhone, Country
FROM NORTHWND.dbo.Employees;

CREATE TABLE dbo.[Dim-Empleado] (
   idempleado INT IDENTITY(1,1) PRIMARY KEY,
   NombreCompleto NVARCHAR(100),
   Direccion NVARCHAR(255),
   Telefono NVARCHAR(20),
   Pais NVARCHAR(50)
);

INSERT INTO dbo.[Dim-Empleado] (NombreCompleto, Direccion, Telefono, Pais)
SELECT 
   CONCAT(FirstName, ' ', LastName) AS NombreCompleto,
   [Address] AS Direccion,
   HomePhone AS Telefono,
   Country AS Pais
FROM dbo.empleado;


SELECT * FROM dbo.[Dim-Empleado];
GO

CREATE PROCEDURE sp5
AS
BEGIN
    -- Crear o modificar el trigger trg_UpdateDimEmpleado
    CREATE OR ALTER TRIGGER trg_UpdateDimEmpleado 
    ON dbo.empleado
    AFTER INSERT, UPDATE
    AS
    BEGIN
        -- Merge se utiliza para actualizar o insertar registros en la tabla de dimensión [Dim-Empleado]
        MERGE INTO dbo.[Dim-Empleado] AS target
        USING (
            SELECT 
                CONCAT(i.FirstName, ' ', i.LastName) AS NombreCompleto,
                i.[Address] AS Direccion,
                i.HomePhone AS Telefono,
                i.Country AS Pais
            FROM inserted i
        ) AS source 
        ON target.NombreCompleto = source.NombreCompleto
        -- Si hay una coincidencia, actualiza los campos en la tabla de dimensión
        WHEN MATCHED THEN
            UPDATE SET
                Direccion = source.Direccion,
                Telefono = source.Telefono,
                Pais = source.Pais
        -- Si no hay coincidencia, inserta un nuevo registro en la tabla de dimensión
        WHEN NOT MATCHED THEN 
            INSERT (NombreCompleto, Direccion, Telefono, Pais)
            VALUES (source.NombreCompleto, source.Direccion, source.Telefono, source.Pais);
    END


INSERT INTO dbo.empleado (FirstName, LastName, [Address], HomePhone, Country)
VALUES ('John', 'Doe', '123 Main St', '555-1234', 'USA');

SELECT*FROM dbo.empleado;

SELECT * FROM dbo.[Dim-Empleado];


INSERT INTO dbo.empleado (FirstName, LastName, [Address], HomePhone, Country)
VALUES ('Eduardo', 'Olvera', '123 Main St', '555-1234', 'MEX');


SELECT * FROM dbo.[Dim-Empleado];

SELECT*FROM dbo.empleado;

INSERT INTO dbo.empleado (FirstName, LastName, [Address], HomePhone, Country)
VALUES ('Eduardo', 'Olvera', '128 Main St', '666-1234', 'COL');

EXECUTE sp1;