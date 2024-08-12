-- # Aufgabenstellung

-- Ziel: SQL Select verstehen und anwenden

-- Benutze die [SQL-Testumgebung der W3Schools](https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc)

-- Schreibe deine Lösungen für die Aufgaben in eine Datei mit Endung .sql und lege sie in deinem Repository ab

-- 1. Zeige alle Daten aus der Customers-Tabelle an
-- 2. Zeige nur die Spalten CustomerName, City und Country aus der Customers-Tabelle an.
-- 3. Zeige alle Kunden aus Deutschland an.
-- 4. Zeige alle Kunden aus London, UK an.
-- 5. Zeige alle Kunden alphabetisch nach CustomerName sortiert an
-- 6. Zeige nur die ersten 5 Einträge der Tabelle Customers an
-- 7. Gib die Gesamtzahl aller Einträge in der Customers-Tabelle aus


1. SELECT * FROM Customers
2. SELECT CustomerName, City, Country FROM Customers
3.SELECT *  FROM Customers Where Country ='Germany'
4.SELECT *  FROM Customers Where Country ='UK' AND City= 'London'
5. SELECT *  FROM Customers ORDER BY CustomerId DESC
6.SELECT * FROM Customers LIMIT 5;
7.SELECT Count(*) FROM Customers 

-- SQL-Select-2-1
-- Benutze die [SQL-Testumgebung der W3Schools](https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc)

-- Schreibe deine Lösungen für die Aufgaben in eine Datei mit Endung .sql und lege sie in deinem Repository ab

-- 1. Zeige alle Kunden aus der Customers-Tabelle an, deren Name mit A beginnt
-- 2. Sortiere die Kunden absteigend nach Postleitzahl 
-- 3. Zeige alle Kunden aus Mexico, sortiert zuerst nach Stadt und dann nach Kundenname
-- 4. Zeige  alle Kunden an, die sich in Deutschland, dem Vereinigten Königreich oder Frankreich befinden.

-- Wechsle zur Tabelle Products
-- 5. Zeige alle Produkte an, die in Flaschen verkauft werden
-- 6. Zeige alle Produkte an, deren Preis zwischen 20 und 30 Dollar liegt
-- 7. Erstelle eine Liste, die die Anzahl der Produkte pro Kategorie anzeigt.

1.SELECT * FROM Customers WHERE CustomerName LIKE 'A%'
2. SELECT * FROM Customers ORDER BY PostalCode DESC
3.SELECT * FROM Customers Where Country='Mexico' ORDER BY City, CustomerName
4. SELECT * FROM Customers Where Country='Germany' OR  Country = 'France' OR  Country = ' UK'
5. SELECT * FROM Products Where Unit Like '%bottles%';
6. SELECT * FROM Products Where Price BETWEEN 20 And 30
7. SELECT CategoryID, COUNT(*) AS AnzahlProdukte
FROM Products GROUP BY CategoryID;


-- SQL-Select-3-1

-- Ziel: SQL Select verstehen und anwenden

-- Benutze die [SQL-Testumgebung der W3Schools](https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc)

-- Schreibe deine Lösungen für die Aufgaben in eine Datei mit Endung .sql und lege sie in deinem Repository ab

-- Tabelle Customers:

-- 1. Zeige alle Länder an, die mehr als fünf Kunden haben

-- Tabelle Orders:

-- 1. Zeige alle Bestellungen im August 1996 an
-- 2. Zeige alle CustomerIds, die mehr als eine Bestellung getätigt haben
-- 3. Zeige die CustomerId mit den meisten Bestellungen an
-- Bonus: Zeige direkt den Kundennamen an (nutze JOIN um zwei Tabellenabfragen zu verbinden)

-- Tabelle Products

-- 1. Zeige alle Produkte an, die von der Firma “Heli Süßwaren GmbH & Co. KG ” geliefert werden
-- 2. Zeige den Durchschnittspreis aller Produkte an
-- 3. Zeige den Höchstpreis aller Produkte an

-- Tabelle Suppliers

-- 1. Zeige alle Lieferanten an, deren Telefonnummer keine Klammern () enthält
-- 2. Liste die Länder mit der Anzahl der Lieferanten auf, sortiert nach der Anzahl der Lieferanten in absteigender Reihenfolge und bei gleicher Anzahl von Lieferanten alphabetisch nach Ländernamen.
Tabelle Customers:

1. SELECT COUNT(*) AS [Number of customers] , Country
FROM customers
GROUP BY Country
HAVING COUNT(*) 
>= 5

Tabelle Orders:
2. SELECT * 
FROM Orders 
WHERE YEAR(OrderDate) = 1996 
AND MONTH(OrderDate) = 8;
3.SELECT CustomerId
FROM Orders
GROUP BY CustomerId
HAVING COUNT(OrderID) >= 1;

Tabelle Products:
5.SELECT * FROM Products where SupplierID=11;
6. SELECT AVG(Price)FROM Products;
7. SELECT MAX(Price)FROM Products;

Tabelle Suppliers:
8.SELECT * FROM Suppliers WHERE Phone NOT LIKE '%(%' AND Phone NOT LIKE '%)%';
9.SELECT Country, COUNT(*) AS NumberOfSuppliers
FROM Suppliers GROUP BY Country ORDER BY COUNT(*) DESC, Country ASC;