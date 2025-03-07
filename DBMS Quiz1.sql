CREATE DATABASE GuestDB;

CREATE TABLE Hoteltab (
	HotelNo INT PRIMARY KEY,
	HotelName VARCHAR (50),
	City VARCHAR (50) NOT NULL
);

INSERT INTO Hoteltab VALUES ('1' ,'Grand Hotel', 'Faisalabad');
INSERT INTO Hoteltab VALUES ('2' ,'Primium Hotel', 'Islamabad');
INSERT INTO Hoteltab VALUES ('3' ,'Tulip Hotel', 'Karachi');
INSERT INTO Hoteltab VALUES ('4' ,'Kayyam Hotel', 'Faisalabad');
INSERT INTO Hoteltab VALUES ('5' ,'Sariyas Hotel', 'Lahore');
INSERT INTO Hoteltab VALUES ('6' ,'Sarina Hotel', 'Faisalabad');

SELECT * FROM Hoteltab;
SELECT * FROM Hoteltab WHERE City='Faisalabad';
SELECT COUNT(HotelNo)
FROM Hoteltab;

CREATE TABLE Roomtable (
	RoomNo INT ,
	HotelNo INT,
	PRIMARY KEY (RoomNo , HotelNo),
	Kind VARCHAR (50) NOT NULL,
	Price INT NOT NULL
);
INSERT INTO Roomtable VALUES ('1' ,'001' ,'Single', '50000');
INSERT INTO Roomtable VALUES ('2' ,'002','Double', '40000');
INSERT INTO Roomtable VALUES ('3' ,'003','Single', '80000');
INSERT INTO Roomtable VALUES ('4' ,'004','Double', '60000');
INSERT INTO Roomtable VALUES ('5' ,'005','Double', '20000');
INSERT INTO Roomtable VALUES ('6' ,'006','Single', '10000');
SELECT * FROM Roomtable;


SELECT * FROM Roomtable
WHERE HotelNo = (SELECT HotelNo FROM Hoteltab WHERE HotelName = 'Primium Hotel');
SELECT GuestName
FROM GuestTab
WHERE GuestNo = (SELECT HotelNo FROM Hoteltab WHERE HotelName = 'Primium Hotel');


SELECT Price, Kind 
FROM Roomtable
WHERE HotelNo = (SELECT HotelNo FROM Hoteltab WHERE HotelName = 'Primium Hotel');


SELECT SUM(Price)
FROM Roomtable
WHERE Kind='Double';

SELECT AVG(Price)
FROM Roomtable;

SELECT Kind, Price
FROM Roomtable
WHERE Price < 40000
ORDER BY Price ASC;

 


CREATE TABLE BookTable (
	GuestNo INT ,
	HotelNo INT,
	DateFrom VARCHAR (50),
	PRIMARY KEY (GuestNo , HotelNo),
	DateTo VARCHAR (50) NOT NULL,
	RoomNo INT NOT NULL
);
INSERT INTO BookTable VALUES ('1' ,'01','aug', '22 aug 2023', '001');
INSERT INTO BookTable VALUES ('2' ,'02','may', '15 feb 2024', '002');
INSERT INTO BookTable VALUES ('3' ,'03','oct', '31 dec 2030', '003');
INSERT INTO BookTable VALUES ('4' ,'04','feb', '25 may 2032', '004');
INSERT INTO BookTable VALUES ('5' ,'05','feb', '25 may 2032', '005');
INSERT INTO BookTable VALUES ('6' ,'06','aug', '20 sep 2022', '006');
INSERT INTO BookTable VALUES ('7' ,'07','aug', '24 aug 2019', '007');

SELECT COUNT(DISTINCT GuestNo)
FROM BookTable
WHERE DateFrom ='aug';


SELECT * FROM BookTable;
SELECT GuestNo, HotelNo, RoomNo 
FROM BookTable
WHERE DateTo IS NULL;

CREATE TABLE GuestTab (
	GuestNo INT PRIMARY KEY,
	GuestName VARCHAR (50) NOT NULL,
	GuestAddress VARCHAR (50) NOT NULL
);
INSERT INTO GuestTab VALUES ('1' ,'Hira','Faisalabad');
INSERT INTO GuestTab VALUES ('2' ,'Aniqa','Islamabad');
INSERT INTO GuestTab VALUES ('3' ,'Usma','Lahore');
INSERT INTO GuestTab VALUES ('4' ,'Fatima','Islamabad');
INSERT INTO GuestTab VALUES ('5' ,'Aliza','Faisalabad');
INSERT INTO GuestTab VALUES ('6' ,'Natasha','Karaci');
INSERT INTO GuestTab VALUES ('7' ,'Khadija','Faisalabad');

SELECT * FROM GuestTab;
SELECT GuestName, GuestAddress
From GuestTab 
ORDER BY GuestName ASC;

SELECT * FROM GuestTab
WHERE GuestNo = (SELECT HotelNo FROM Hoteltab WHERE HotelName = 'Primium Hotel');

SELECT SUM(Price) 
FROM Roomtable
WHERE Roomtable.HotelNo = (SELECT HotelNo FROM Hoteltab WHERE HotelName = 'Primium Hotel');

SELECT * FROM Roomtable 
WHERE Roomtable.HotelNo NOT IN (SELECT HotelNo FROM Hoteltab WHERE HotelName = 'Primium Hotel');

SELECT Hoteltab.HotelName, 
COUNT(Roomtable.RoomNo) 
FROM Hoteltab JOIN Roomtable ON Hoteltab.HotelNo = Roomtable.HotelNo GROUP BY Hoteltab.HotelName;


SELECT Hoteltab.HotelName, 
COUNT(Roomtable.RoomNo) 
FROM Hoteltab JOIN Roomtable ON Hoteltab.HotelNo = Roomtable.HotelNo 
WHERE Hoteltab.City = 'Lahore' GROUP BY Hoteltab.HotelName;

SELECT AVG(GuestNo)
FROM BookTable
WHERE DateFrom = 'aug';

ALTER TABLE Hoteltab
ADD Again VARCHAR(50);
SELECT * FROM Hoteltab;

ALTER TABLE Roomtable
ADD Again VARCHAR(50);
SELECT * FROM Roomtable;

ALTER TABLE Guesttab
ADD Again VARCHAR(50);
SELECT * FROM Guesttab;

ALTER TABLE BookTable
ADD Again VARCHAR(50);
SELECT * FROM BookTable;

UPDATE Roomtable
SET Price = Price * 1.05;
SELECT *FROM Roomtable;
