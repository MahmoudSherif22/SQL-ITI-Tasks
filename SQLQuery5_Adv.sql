

-------------------------------------------
--AdventureWorks DB

--1 
SELECT SOH.SalesOrderID AS S_ID,SOH.ShipDate AS SD
FROM sales.SalesOrderHeader AS SOH
WHERE SOH.ShipDate > '7/28/2002' AND SOH.ShipDate < '7/29/2014'; 
--------------------------------------------
--2
SELECT *
FROM Production.Product AS PD 
WHERE PD.StandardCost < 11000;
--------------------------------------------
--3 
SELECT PD.Name ,PD.ProductID
FROM Production.Product AS PD 
WHERE PD.Weight IS NULL;

--------------------------------------------
--4 
SELECT *
FROM Production.Product AS PD 
WHERE PD.Color IN('Silver','Black','Red');
----------------------------------------------
--5 
SELECT *
FROM Production.Product AS Pd 
WHERE Pd.Name LIKE 'B%'
----------------------------------------------
--6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

SELECT *
FROM Production.ProductDescription AS Pd 
WHERE pd.Description LIKE '%_%';
-----------------------------------------------
--7
SELECT SUM(SOH.TotalDue)
FROM Sales.SalesOrderHeader AS SOH
GROUP BY SOH.OrderDate
HAVING SOH.OrderDate > '7/1/2001' AND SOH.OrderDate < '7/31/2014';

------------------------------------------------
--8 
SELECT DISTINCT (Emp.HireDate)
FROM HumanResources.Employee AS Emp;

------------------------------------------------
--9 
SELECT AVG(DISTINCT(P.ListPrice))
FROM  Production.Product AS P;
-------------------------------------------------
--10 
SELECT 'The ' + P.Name + ' is only! ' + CAST(P.ListPrice AS VARCHAR)
FROM Production.Product AS P
WHERE P.ListPrice < 120 AND P.ListPrice > 100;
--------------------------------------------------
--11
SELECT S.rowguid,S.Name,S.SalesPersonID,S.Demographics
INTO Sales.store_Archive
FROM Sales.Store S;

select rowguid ,Name, SalesPersonID, Demographics 
from Sales.store_Archive;

SELECT rowguid ,Name, SalesPersonID, Demographics 
INTO store_Archive 
FROM Sales.Store WHERE 1<>1
---------------------------------------------------
--12 
SELECT FORMAT(GETDATE(),'MM/dd/yy') AS Today
UNION
SELECT FORMAT(GETDATE(),'dddd')
UNION 
SELECT FORMAT(GETDATE(),'MM')
UNION 
SELECT FORMAT(GETDATE(),'yy')
UNION 
SELECT FORMAT(GETDATE(),'dddd-MM-yyyy') 