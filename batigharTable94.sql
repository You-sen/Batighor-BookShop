DROP TABLE Branch94 CASCADE CONSTRAINTS;
DROP TABLE Customer94 CASCADE CONSTRAINTS;
DROP TABLE Books_Basic94 CASCADE CONSTRAINTS;
DROP TABLE Books_Details94 CASCADE CONSTRAINTS;
DROP TABLE Inventory94 CASCADE CONSTRAINTS;
DROP TABLE Order94 CASCADE CONSTRAINTS;
DROP TABLE OrderDetails94 CASCADE CONSTRAINTS;
DROP TABLE Author94 CASCADE CONSTRAINTS;

CREATE TABLE Branch94(
	BranchID NUMBER(5),
	BranchName VARCHAR2(50),
	Email VARCHAR2(50),	
	Phone VARCHAR2(15),
	Address VARCHAR2(50),
    Location VARCHAR2(50), 
	PRIMARY KEY (BranchID)
);

CREATE TABLE Customer94(
	CID NUMBER(5),
	BranchID NUMBER(5),
	CName VARCHAR2(50),	
	Age NUMBER(3),
	PRIMARY KEY (CID),
	FOREIGN KEY (BranchID) REFERENCES Branch94 (BranchID)
);

CREATE TABLE Author94 (
  AID NUMBER(5) PRIMARY KEY,
  Name VARCHAR2(50)
);

CREATE TABLE Books_Basic94(
	BookID NUMBER(5),
	BranchID NUMBER(5),
	Title VARCHAR2(50), 
	AID NUMBER(5),
	Genre VARCHAR2(50),
    Price NUMBER(10),
	PRIMARY KEY (BookID),
	FOREIGN KEY (BranchID) REFERENCES Branch94 (BranchID),
	FOREIGN KEY (AID) REFERENCES Author94 (AID)
);

CREATE TABLE Books_Details94 (
  BookID NUMBER(5),
  ISBN VARCHAR2(50),
  Summary VARCHAR2(500),
  Image_URL VARCHAR2(500),
  Pages NUMBER(5),
  Category VARCHAR2(50),
  Publisher VARCHAR2(50),
  PublicationDate DATE,
  BookshelfNo NUMBER(5),
  FOREIGN KEY (BookID) REFERENCES Books_Basic94 (BookID)
);

CREATE TABLE Inventory94(
	BookID NUMBER(5),
    BranchID NUMBER(5),
    QuantityInStock	NUMBER(5),
	QuantityOnOrder NUMBER(5),
	FOREIGN KEY (BookID) REFERENCES Books_Basic94 (BookID),
	FOREIGN KEY (BranchID) REFERENCES Branch94 (BranchID)
);
	
CREATE TABLE Order94(
	OID  NUMBER(5),
	CID  NUMBER(5),
	AID  NUMBER(5),
	BookID  NUMBER(5),
	Genre VARCHAR2(50),
	PRIMARY KEY (OID),
	FOREIGN KEY (CID) REFERENCES Customer94 (CID),
	FOREIGN KEY (AID) REFERENCES Author94 (AID),
    FOREIGN KEY (BookID) REFERENCES Books_Basic94 (BookID)
);

create table OrderDetails94(
	OID  NUMBER(5),
	BranchID NUMBER(5),
	Quantity  NUMBER(5),
	TotalPrice  NUMBER(5),
	OrderDate date,
	FOREIGN KEY (OID) REFERENCES Order94 (OID),  
	FOREIGN KEY (BranchID) REFERENCES Branch94 (BranchID)	
);





-- Insert 5 rows into Branch94
INSERT INTO Branch94 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (1001, 'Branch 1001', 'branch1001@gmail.com', '111-111-1001', 'Address 1001', 'Dhaka');

INSERT INTO Branch94 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (1002, 'Branch 1002', 'branch1002@gmail.com', '222-222-1002', 'Address 1002', 'Dhaka');

INSERT INTO Branch94 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (1003, 'Branch 1003', 'branch1003@gmail.com', '333-333-1003', 'Address 1003', 'Dhaka');

INSERT INTO Branch94 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (1004, 'Branch 1004', 'branch1004@gmail.com', '444-444-1004', 'Address 1004', 'Dhaka');

INSERT INTO Branch94 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (1005, 'Branch 1005', 'branch1005@gmail.com', '555-555-1005', 'Address 1005', 'Dhaka');

-- Insert 5 rows into Customer94
INSERT INTO Customer94 (CID, BranchID, CName, Age)
VALUES (1001, 1001, 'Customer 1001', 25);

INSERT INTO Customer94 (CID, BranchID, CName, Age)
VALUES (1002, 1001, 'Customer 1002', 30);

INSERT INTO Customer94 (CID, BranchID, CName, Age)
VALUES (1003, 1003, 'Customer 1003', 35);

INSERT INTO Customer94 (CID, BranchID, CName, Age)
VALUES (1004, 1003, 'Customer 1004', 40);

INSERT INTO Customer94 (CID, BranchID, CName, Age)
VALUES (1005, 1005, 'Customer 1005', 45);


INSERT INTO Author94 (AID, Name) 
VALUES (1001, 'Author 1');
INSERT INTO Author94 (AID, Name) 
VALUES (1002, 'Author 2');
INSERT INTO Author94 (AID, Name) 
VALUES (1003, 'Author 3');
INSERT INTO Author94 (AID, Name) 
VALUES (1004, 'Author 4');
INSERT INTO Author94 (AID, Name) 
VALUES (1005, 'Author 5');


-- Insert 5 rows into Books_Basic94
INSERT INTO Books_Basic94 (BookID, BranchID, Title, AID, Genre, Price)
VALUES (1001, 1001, 'Book 1001', 1001, 'Genre 1', 20);

INSERT INTO Books_Basic94 (BookID, BranchID, Title, AID, Genre, Price)
VALUES (1002, 1001, 'Book 1002', 1002, 'Genre 1', 25);

INSERT INTO Books_Basic94 (BookID, BranchID, Title, AID, Genre, Price)
VALUES (1003, 1003, 'Book 1003', 1001, 'Genre 3', 30);

INSERT INTO Books_Basic94 (BookID, BranchID, Title, AID, Genre, Price)
VALUES (1004, 1004, 'Book 1004', 1002, 'Genre 3', 35);

INSERT INTO Books_Basic94 (BookID, BranchID, Title, AID, Genre, Price)
VALUES (1005, 1004, 'Book 1005', 1003, 'Genre 5', 40);


INSERT INTO Books_Details94 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo) VALUES
(1001, 'ISBN1001', 'Summary 1001', 'Image_URL1001', 100, 'Category 1001', 'Publisher 1001', '01-JAN-2021', 1001);
INSERT INTO Books_Details94 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo) VALUES
(1002, 'ISBN1002', 'Summary 1002', 'Image_URL1002', 200, 'Category 1002', 'Publisher 1002', '01-FEB-2021', 1002);
INSERT INTO Books_Details94 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo) VALUES
(1003, 'ISBN1003', 'Summary 1003', 'Image_URL1003', 300, 'Category 1003', 'Publisher 1003', '01-MAR-2021', 1003);
INSERT INTO Books_Details94 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo) VALUES
(1004, 'ISBN1004', 'Summary 1004', 'Image_URL1004', 400, 'Category 1004', 'Publisher 1004', '01-APR-2021', 1004);
INSERT INTO Books_Details94 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo) VALUES
(1005, 'ISBN1005', 'Summary 1005', 'Image_URL1005', 500, 'Category 1005', 'Publisher 1005', '01-MAY-2021', 1005);

INSERT INTO Inventory94 (BookID, BranchID, QuantityInStock, QuantityOnOrder) VALUES
(1001, 1001, 10, 5);
INSERT INTO Inventory94 (BookID, BranchID, QuantityInStock, QuantityOnOrder) VALUES
(1002, 1001, 20, 10);
INSERT INTO Inventory94 (BookID, BranchID, QuantityInStock, QuantityOnOrder) VALUES
(1003, 1003, 30, 15);
INSERT INTO Inventory94 (BookID, BranchID, QuantityInStock, QuantityOnOrder) VALUES
(1004, 1004, 40, 20);
INSERT INTO Inventory94 (BookID, BranchID, QuantityInStock, QuantityOnOrder) VALUES
(1005, 1004, 50, 25);

INSERT INTO Order94 (OID, CID, AID, BookID, Genre) VALUES
(1001, 1001, 1001, 1001, 'Genre 1');
INSERT INTO Order94 (OID, CID, AID, BookID, Genre) VALUES
(1002, 1002, 1002, 1004, 'Genre 3');


INSERT INTO OrderDetails94 (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1001, 1001, 1, 100, '01-JAN-2022');
INSERT INTO OrderDetails94 (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1002, 1001, 2, 200, '01-FEB-2022');
INSERT INTO OrderDetails94 (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1003, 1003, 3, 300, '01-MAR-2022');
INSERT INTO OrderDetails94 (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1004, 1004, 4, 400, '01-APR-2022');
INSERT INTO OrderDetails94 (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1005, 1004, 5, 500, '01-MAY-2022');

SELECT * FROM Branch94;
SELECT * FROM Customer94;
SELECT * FROM Books_Basic94;
SELECT * FROM Author94;
SELECT * FROM Books_Details94;
SELECT * FROM Inventory94;
SELECT * FROM Order94;
SELECT * FROM OrderDetails94;
