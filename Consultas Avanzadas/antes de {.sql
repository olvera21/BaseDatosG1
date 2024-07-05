CREATE VIEW vista_ventas AS
SELECT 
    c.CustomerID AS ClaveCliente, 
    c.CompanyName AS Cliente,
    CONCAT(e.FirstName, ' ', e.LastName) AS Nombre,
    o.OrderDate AS FechadelaOrden, 
    DATEPART(year, o.OrderDate) AS AñoDeCompra,
    DATENAME(month, o.OrderDate) AS MesDeCompra,
    DATEPART(quarter, o.OrderDate) AS Trimestre,
    UPPER(p.ProductName) AS NombreDelProducto,
    od.Quantity AS CantidadVendida,
    od.UnitPrice AS PrecioVenta,
    p.SupplierID AS ProveedorID
FROM 
    orders AS o
INNER JOIN 
    Customers AS c ON o.CustomerID = c.CustomerID
INNER JOIN 
    Employees AS e ON e.EmployeeID = o.EmployeeID
INNER JOIN 
    [Order Details] AS od ON od.OrderID = o.OrderID
INNER JOIN 
    Products AS p ON p.ProductID = od.ProductID;

SELECT 
    ClaveCliente, 
    Nombre, 
    NombreDelProducto, 
    FechadelaOrden,
    (CantidadVendida * PrecioVenta) AS IMPORTE
FROM 
    vista_ventas
WHERE 
    NombreDelProducto = 'CHAI'
    AND (CantidadVendida * PrecioVenta) > 600
    AND DATEPART(year, FechadelaOrden) = 1966;
    
    SELECT * 
FROM 
    vista_ventas AS vv
INNER JOIN 
    Suppliers AS s 
ON 
    s.SupplierID = vv.ProveedorID;
