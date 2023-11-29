SELECT 
    P.Name AS Producto,
    SOH.OrderDate AS FechaCompleta,
    YEAR(SOH.OrderDate) AS Año,
    MONTH(SOH.OrderDate) AS Mes,
    DAY(SOH.OrderDate) AS Dia,
    PC.Name AS Categoria,
    C.FirstName + ' ' + C.LastName AS Cliente,
    C.EmailAddress AS EmailCliente,
    A.City AS CiudadCliente,
    SUM(SOD.OrderQty) AS CantidadVendida,
    SUM(SOD.LineTotal) AS TotalVentas
FROM 
    SalesLT.SalesOrderDetail SOD
    JOIN SalesLT.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID
    JOIN SalesLT.Product P ON SOD.ProductID = P.ProductID
    JOIN SalesLT.ProductCategory PC ON P.ProductCategoryID = PC.ProductCategoryID
    JOIN SalesLT.Customer C ON SOH.CustomerID = C.CustomerID
    JOIN SalesLT.CustomerAddress CA ON C.CustomerID = CA.CustomerID
    JOIN SalesLT.Address A ON CA.AddressID = A.AddressID
GROUP BY 
    P.Name,
    SOH.OrderDate,
    YEAR(SOH.OrderDate),
    MONTH(SOH.OrderDate),
    DAY(SOH.OrderDate),
    PC.Name,
    C.FirstName, 
    C.LastName,
    C.EmailAddress,
    A.City
ORDER BY 
    SOH.OrderDate, TotalVentas DESC;

