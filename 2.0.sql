USE Northwind

SELECT * FROM Products

SELECT MAX(UnitPrice) FROM Products WHERE UnitPrice < 20

SELECT MIN(UnitPrice), MAX(UnitPrice), AVG(UnitPrice) FROM Products where QuantityPerUnit LIKE '%bottles%'

SELECT * FROM Products WHERE UnitPrice > 38.7545

SELECT SUM(UnitPrice) FROM [Order Details] where OrderID = 10250



SELECT OrderID, MAX(UnitPrice), MIN(UnitPrice) FROM [Order Details] GROUP BY OrderID ORDER BY MAX(UnitPrice)

SELECT SupplierID, UnitsOnOrder FROM Products GROUP BY SupplierID

SELECT * FROM Orders

SELECT TOP 1 COUNT(*) as dostawy, ShipVia FROM Orders WHERE ShippedDate LIKE '%97%'  GROUP BY ShipVia ORDER BY dostawy desc

SELECT OrderID, COUNT(*) FROM [Order Details] GROUP BY OrderID HAVING COUNT(*) > 5

SELECT CustomerID, COUNT(*) FROM Orders WHERE ShippedDate LIKE '%98%'
GROUP BY CustomerID having COUNT(*) > 8 ORDER BY SUM(Freight) desc