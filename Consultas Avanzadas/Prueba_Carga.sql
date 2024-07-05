-- Crear la base de datos pruebacargadinamica
CREATE DATABASE pruebacargadinamica;
GO

-- Cambiar al contexto de la base de datos pruebacargadinamica
USE pruebacargadinamica;
GO

SELECT TOP 0 EmployeeID, FirstName, LastName, [Address], HomePhone, Country
INTO dbo.empleado
FROM NORTHWND.dbo.Employees;

INSERT INTO dbo.empleado (EmployeeID, FirstName, LastName, [Address], HomePhone, Country)
SELECT EmployeeID, FirstName, LastName, [Address], HomePhone, Country
FROM NORTHWND.dbo.Employees;

-- Crear tabla Dim-Empleado
CREATE TABLE dbo.[Dim-Empleado] (
    idempleado INT IDENTITY(1,1) PRIMARY KEY,
    NombreCompleto NVARCHAR(100),
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(20),
    Salario DECIMAL(10, 2)  
);

-- Insertar datos en Dim-Empleado desde la tabla empleado
INSERT INTO dbo.[Dim-Empleado] (NombreCompleto, Direccion, Telefono, Salario)
SELECT 
    CONCAT(FirstName, ' ', LastName) AS NombreCompleto,
    [Address] AS Direccion,
    HomePhone AS Telefono,
    CAST(0 AS DECIMAL(10, 2)) AS Salario
FROM dbo.empleado;

-- Verificar que los datos se insertaron correctamente en Dim-Empleado
SELECT * FROM dbo.[Dim-Empleado];
GO

-- Crear o alterar el trigger para mantener actualizada Dim-Empleado
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
            i.HomePhone AS Telefono,
            COALESCE(i.Salario, 0) AS Salario  -- Ajusta 'Salario' si es necesario
        FROM inserted i
    ) AS source ON target.NombreCompleto = source.NombreCompleto
    WHEN MATCHED THEN
        UPDATE SET
            Direccion = source.Direccion,
            Telefono = source.Telefono,
            Salario = source.Salario
    WHEN NOT MATCHED THEN
        INSERT (NombreCompleto, Direccion, Telefono, Salario)
        VALUES (source.NombreCompleto, source.Direccion, source.Telefono, source.Salario);
END;
GO