USE Northwind

--Napisz polecenie, kt�re oblicza warto�� sprzeda�y dla ka�dego zam�wienia i
--zwraca wynik posortowany w malej�cej kolejno�ci (wg warto�ci sprzeda�y).

SELECT OrderID, SUM(UnitPrice*Quantity-(UnitPrice*Quantity)*Discount) as zysk -- 1.1
FROM [Order Details] group by OrderID

--Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwraca�o pierwszych 10 wierszy

SELECT TOP 10 OrderID, SUM(UnitPrice*Quantity-(UnitPrice*Quantity)*Discount) as zysk -- 1.2
FROM [Order Details] group by OrderID order by zysk desc

--Podaj liczb� zam�wionych jednostek produkt�w dla produkt�w, dla kt�rych productid < 3

SELECT ProductID, SUM(Quantity) FROM [Order Details] group by ProductID having ProductID < 3  --2.1
SELECT ProductID, COUNT(*) FROM [Order Details] group by ProductID having ProductID < 3

--Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawa�o liczb�
--zam�wionych jednostek produktu dla wszystkich produkt�w

SELECT ProductID, SUM(Quantity) FROM [Order Details] group by ProductID --2.2
SELECT ProductID, COUNT(*) FROM [Order Details] group by ProductID

--Podaj nr zam�wienia oraz warto�� zam�wienia, dla zam�wie�, dla kt�rych
--��czna liczba zamawianych jednostek produkt�w jest > 250 

SELECT OrderID, SUM(UnitPrice*Quantity-(UnitPrice*Quantity)*Discount) as wartosc --2.3
FROM [Order Details] group by OrderID having SUM(Quantity) > 250

-- Dla ka�dego pracownika podaj liczb� obs�ugiwanych przez niego zam�wie�

SELECT EmployeeID, COUNT(*) as zamowienia FROM Orders group by EmployeeID --3.1

--Dla ka�dego spedytora/przewo�nika podaj warto�� "op�ata za przesy�k�"
--przewo�onych przez niego zam�wie�

SELECT ShipVia, SUM(Freight) from Orders group by ShipVia order by ShipVia --3.2

--Dla ka�dego spedytora/przewo�nika podaj warto�� "op�ata za przesy�k�"
--przewo�onych przez niego zam�wie� w latach o 1996 do 1997


SELECT ShipVia, SUM(Freight) from Orders where YEAR(ShippedDate)=1996 or YEAR(ShippedDate)=1997 --3.3
group by ShipVia order by ShipVia

--Dla ka�dego pracownika podaj liczb� obs�ugiwanych przez niego zam�wie� z
--podzia�em na lata i miesi�ce

SELECT EmployeeID,YEAR(OrderDate) as rok ,MONTH(OrderDate) as miesiac, count(*) as zamowienia  --4.1
from Orders group by EmployeeID, YEAR(OrderDate),MONTH(OrderDate) order by EmployeeID

--Dla ka�dej kategorii podaj maksymaln� i minimaln� cen� produktu w tej kategorii

SELECT CategoryID, MAX(UnitPrice) as maks, MIN(UnitPrice) as mini from Products group by CategoryID --4.2