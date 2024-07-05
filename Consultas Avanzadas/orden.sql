USE NORTHWND;

SELECT *From Orders;
SELECT*FROM [Order Details];
SELECT*FROM Customers;
--Crear un sp, que muestre el total de ventas para cada cliente por un rango de un año;

USE NORTHWND;

CREATE or alter PROCEDURE proc_ordenes_año
    @DatePart INT
AS
BEGIN
    SELECT OrderDate
    FROM Orders
    WHERE YEAR(OrderDate) = @DatePart;
END;
GO
EXECUTE proc_ordenes_año @DatePart = 1997;

--total de ventas por cliente en el año que se solicite 
CREATE PROCEDURE Total_Ventas_Cliente
    @DatePart INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.CustomerID, 
        C.CompanyName AS CustomerName, 
        SUM(OD.UnitPrice * OD.Quantity) AS TotalPurchases
    FROM 
        Orders O
    INNER JOIN 
        Customers C ON O.CustomerID = C.CustomerID
    INNER JOIN 
        [Order Details] OD ON O.OrderID = OD.OrderID
    WHERE 
        YEAR(O.OrderDate) = @DatePart
    GROUP BY 
        C.CustomerID, C.CompanyName
    ORDER BY 
        TotalPurchases DESC;
END;
GO

EXEC Total_Ventas_Cliente @DatePart = 1997;

CREATE PROCEDURE Total_Ventas_Mejorado
    @DatePart INT,
    @CustomerID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.CustomerID, 
        C.CompanyName AS CustomerName, 
        SUM(OD.UnitPrice * OD.Quantity) AS TotalPurchases
    FROM 
        Orders O
    INNER JOIN 
        Customers C ON O.CustomerID = C.CustomerID
    INNER JOIN 
        [Order Details] OD ON O.OrderID = OD.OrderID
    WHERE 
        YEAR(O.OrderDate) = @DatePart
        AND (@CustomerID IS NULL OR C.CustomerID = @CustomerID)
    GROUP BY 
        C.CustomerID, C.CompanyName
    ORDER BY 
        TotalPurchases DESC;
END;
GO
EXEC Total_Ventas_Mejorado @DatePart = 1997, @CustomerID = 14;