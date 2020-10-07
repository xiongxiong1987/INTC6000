CREATE DATABASE Yan_Xu

CREATE TABLE Customer
(
CustomerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
StreetAddress varchar(20) NOT NULL,
Apartment varchar(20) NOT NULL,
City varchar(20) NOT NULL,
State varchar(20) NOT NULL,
Zip varchar(7) NOT NULL,
HomePhone varchar(14) NOT NULL,
MobilePhone varchar(14),
OtherPhone varchar(14)
)

CREATE TABLE Donut
(
DonutID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
DonutName varchar(20) NOT NULL,
Description varchar(30) NOT NULL,
UnitPrice decimal(5,2) NOT NULL
)

CREATE TABLE Invoice
(
DonutOrderID INT NOT NULL IDENTITY(1,1),
CustomerID INT NOT NULL,
OrderDate DATE NOT NULL,
Notes VARCHAR(255),
PRIMARY KEY (DonutOrderID),
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
)

INSERT INTO Customer
(FirstName,LastName,StreetAddress,Apartment,City,State,Zip,HomePhone,MobilePhone,OtherPhone)
VALUES 
       ('Adam','Baut','695-4588 Ac Av.','#7','Chicago','Illinois','44027','456-000-3982',NULL,NULL),
       ('John','Chan','1007 MLK Jr dr','#9','Seattle','Washington','98122','206-000-3982',NULL,NULL);

CREATE VIEW CustomerView
AS
SELECT
    FirstName, 
 LastName, 
 CONCAT(FirstName,' ',LastName) as FullName
FROM
    Customer c

CREATE INDEX i1 ON Donut (DonutName);
select * from sys.indexes
where object_id = (select object_id from sys.objects where name = 'Donut')
