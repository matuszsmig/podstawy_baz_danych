USE Northwind

--Napisz polecenie, które oblicza wartoœæ sprzeda¿y dla ka¿dego zamówienia i
--zwraca wynik posortowany w malej¹cej kolejnoœci (wg wartoœci sprzeda¿y).

SELECT OrderID, SUM(UnitPrice*Quantity-(UnitPrice*Quantity)*Discount) as zysk -- 1.1
FROM [Order Details] group by OrderID

--Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwraca³o pierwszych 10 wierszy

SELECT TOP 10 OrderID, SUM(UnitPrice*Quantity-(UnitPrice*Quantity)*Discount) as zysk -- 1.2
FROM [Order Details] group by OrderID order by zysk desc

--Podaj liczbê zamówionych jednostek produktów dla produktów, dla których productid < 3

SELECT ProductID, SUM(Quantity) FROM [Order Details] group by ProductID having ProductID < 3  --2.1
SELECT ProductID, COUNT(*) FROM [Order Details] group by ProductID having ProductID < 3

--Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawa³o liczbê
--zamówionych jednostek produktu dla wszystkich produktów

SELECT ProductID, SUM(Quantity) FROM [Order Details] group by ProductID --2.2
SELECT ProductID, COUNT(*) FROM [Order Details] group by ProductID

--Podaj nr zamówienia oraz wartoœæ zamówienia, dla zamówieñ, dla których
--³¹czna liczba zamawianych jednostek produktów jest > 250 

SELECT OrderID, SUM(UnitPrice*Quantity-(UnitPrice*Quantity)*Discount) as wartosc --2.3
FROM [Order Details] group by OrderID having SUM(Quantity) > 250

-- Dla ka¿dego pracownika podaj liczbê obs³ugiwanych przez niego zamówieñ

SELECT EmployeeID, COUNT(*) as zamowienia FROM Orders group by EmployeeID --3.1

--Dla ka¿dego spedytora/przewoŸnika podaj wartoœæ "op³ata za przesy³kê"
--przewo¿onych przez niego zamówieñ

SELECT ShipVia, SUM(Freight) from Orders group by ShipVia order by ShipVia --3.2

--Dla ka¿dego spedytora/przewoŸnika podaj wartoœæ "op³ata za przesy³kê"
--przewo¿onych przez niego zamówieñ w latach o 1996 do 1997


SELECT ShipVia, SUM(Freight) from Orders where YEAR(ShippedDate)=1996 or YEAR(ShippedDate)=1997 --3.3
group by ShipVia order by ShipVia

--Dla ka¿dego pracownika podaj liczbê obs³ugiwanych przez niego zamówieñ z
--podzia³em na lata i miesi¹ce

SELECT EmployeeID,YEAR(OrderDate) as rok ,MONTH(OrderDate) as miesiac, count(*) as zamowienia  --4.1
from Orders group by EmployeeID, YEAR(OrderDate),MONTH(OrderDate) order by EmployeeID

--Dla ka¿dej kategorii podaj maksymaln¹ i minimaln¹ cenê produktu w tej kategorii

SELECT CategoryID, MAX(UnitPrice) as maks, MIN(UnitPrice) as mini from Products group by CategoryID --4.2