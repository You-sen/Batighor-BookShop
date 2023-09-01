clear screen;
SET line 100;
SET linesize 300;
SET pagesize 300;

--@"G:\Education\All Academic Project\4.1 DDS\BookStore Management System\Site PC - 95\Site95.sql";
DROP TABLE Branch95 CASCADE CONSTRAINTS;
DROP TABLE Customer95 CASCADE CONSTRAINTS;
DROP TABLE Books_Basic95 CASCADE CONSTRAINTS;
DROP TABLE Books_Details95 CASCADE CONSTRAINTS;
DROP TABLE Inventory95 CASCADE CONSTRAINTS;
DROP TABLE Order95 CASCADE CONSTRAINTS;
DROP TABLE OrderDetails95 CASCADE CONSTRAINTS;
DROP TABLE Author95 CASCADE CONSTRAINTS;

CREATE TABLE Branch95(
	BranchID NUMBER(5),
	BranchName VARCHAR2(50),
	Email VARCHAR2(50),	
	Phone VARCHAR2(15),
	Address VARCHAR2(50),
    Location VARCHAR2(50), 
	PRIMARY KEY (BranchID)
);

CREATE TABLE Customer95(
	CID NUMBER(5),
	BranchID NUMBER(5),
	CName VARCHAR2(50),	
	Age NUMBER(3),
	PRIMARY KEY (CID),
	FOREIGN KEY (BranchID) REFERENCES Branch95 (BranchID)
);


CREATE TABLE Author95 (
  AID NUMBER(5) PRIMARY KEY,
  Name VARCHAR2(50)
);



CREATE TABLE Books_Basic95(
	BookID NUMBER(5),
	BranchID NUMBER(5),
	Title VARCHAR2(50), 
	AID NUMBER(5),
	Genre VARCHAR2(50),
    Price NUMBER(10),
	PRIMARY KEY (BookID),
	FOREIGN KEY (BranchID) REFERENCES Branch95 (BranchID),
	FOREIGN KEY (AID) REFERENCES Author95 (AID)
);


CREATE TABLE Books_Details95 (
  BookID NUMBER(5),
  ISBN VARCHAR2(50),
  Summary VARCHAR2(50),
  Image_URL VARCHAR2(50),
  Pages NUMBER(5),
  Category VARCHAR2(50),
  Publisher VARCHAR2(50),
  PublicationDate DATE,
  BookshelfNo NUMBER(5),
  FOREIGN KEY (BookID) REFERENCES Books_Basic95 (BookID)
);



CREATE TABLE Inventory95(
	BookID NUMBER(5),
    BranchID NUMBER(5),
    QuantityInStock	NUMBER(5),
	QuantityOnOrder NUMBER(5),
	FOREIGN KEY (BookID) REFERENCES Books_Basic95 (BookID),
	FOREIGN KEY (BranchID) REFERENCES Branch95 (BranchID)
);
	
CREATE TABLE Order95(
	OID  NUMBER(5),
	CID  NUMBER(5),
	AID  NUMBER(5),
	BookID  NUMBER(5),
	Genre VARCHAR2(50),
	PRIMARY KEY (OID),
	FOREIGN KEY (CID) REFERENCES Customer95 (CID),
	FOREIGN KEY (AID) REFERENCES Author95 (AID),
    FOREIGN KEY (BookID) REFERENCES Books_Basic95 (BookID)
);

create table OrderDetails95(
	OID  NUMBER(5),
	BranchID NUMBER(5),
	Quantity  NUMBER(5),
	TotalPrice  NUMBER(5),
	OrderDate date,
	FOREIGN KEY (OID) REFERENCES Order95 (OID),  
	FOREIGN KEY (BranchID) REFERENCES Branch95 (BranchID)	
);




--DROP SEQUENCE Customer95_CID_SEQ;
DROP SEQUENCE Customer95_CID_SEQ;


DROP SEQUENCE SEQ_BOOK_ID;


DROP SEQUENCE SEQ_AUTHOR_ID;


DROP SEQUENCE SEQ_ORDER_ID;

--CREATE SEQUENCE Customer95_CID_SEQ;
CREATE SEQUENCE Customer95_CID_SEQ
START WITH 6
INCREMENT BY 1;

CREATE SEQUENCE SEQ_BOOK_ID
START WITH 6
INCREMENT BY 1;

CREATE SEQUENCE SEQ_AUTHOR_ID
START WITH 6
INCREMENT BY 1;

CREATE SEQUENCE SEQ_ORDER_ID
START WITH 6
INCREMENT BY 1;

COLUMN ISBN FORMAT A20;
COLUMN Summary FORMAT A20;
COLUMN Image_URL FORMAT A20;

COLUMN Category FORMAT A20;
COLUMN Publisher FORMAT A20;
COLUMN PublicationDate FORMAT A20;

-- Insert 5 rows into Branch95
INSERT INTO Branch95 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (1, 'Branch 1', 'branch1@gmail.com', '111-111-1111', 'Address 1', 'Chittagong');

INSERT INTO Branch95 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (2, 'Branch 2', 'branch2@gmail.com', '222-222-2222', 'Address 2', 'Chittagong');

INSERT INTO Branch95 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (3, 'Branch 3', 'branch3@gmail.com', '333-333-3333', 'Address 3', 'Chittagong');

INSERT INTO Branch95 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (4, 'Branch 4', 'branch4@gmail.com', '444-444-4444', 'Address 4', 'Chittagong');

INSERT INTO Branch95 (BranchID, BranchName, Email, Phone, Address, Location)
VALUES (5, 'Branch 5', 'branch5@gmail.com', '555-555-5555', 'Address 5', 'Chittagong');

-- Insert 5 rows into Customer95
INSERT INTO Customer95 (CID, BranchID, CName, Age)VALUES (1, 1, 'Customer 1', 25);

INSERT INTO Customer95 (CID, BranchID, CName, Age)VALUES (2, 2, 'Customer 2', 30);

INSERT INTO Customer95 (CID, BranchID, CName, Age)VALUES (3, 3, 'Customer 3', 35);

INSERT INTO Customer95 (CID, BranchID, CName, Age)VALUES (4, 4, 'Customer 4', 40);

INSERT INTO Customer95 (CID, BranchID, CName, Age)VALUES (5, 5, 'Customer 5', 45);


INSERT INTO Author95 (AID, Name)VALUES (1, 'Author 1'); 
INSERT INTO Author95 (AID, Name)VALUES(2, 'Author 2'); 
INSERT INTO Author95 (AID, Name)VALUES(3, 'Author 3'); 
INSERT INTO Author95 (AID, Name)VALUES(4, 'Author 4');
INSERT INTO Author95 (AID, Name)VALUES (5, 'Author 5');

-- Insert 5 rows into Books_Basic95
INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (1, 1, 'Book1', 1, 'Fiction', 20);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (2, 2, 'Book2', 2, 'Drama', 25);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (3, 3, 'Book3', 3, 'Fiction', 30);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (4, 4, 'Book4', 4, 'Romance', 35);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (5, 5, 'Book5', 5, 'Horror', 40);


/*
INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (1, 1, 'Book1', 1, 'Fiction', 20);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (2, 2, 'Book2', 2, 'Drama', 25);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (3, 3, 'Book3', 3, 'Mystery', 30);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (4, 4, 'Book4', 4, 'Fiction', 35);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (5, 5, 'Book5', 5, 'Fiction', 40);

INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (6, 1, 'Book6', 1, 'Romance', 30);
INSERT INTO Books_Basic95 (BookID, BranchID, Title, AID, Genre, Price)VALUES (7, 1, 'Book7', 3, 'Horror', 30);
*/
INSERT INTO Books_Details95 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo)VALUES (1, 'ISBN1', 'Summary', 'www.image1.com', 200, 'Novel', 'Publisher 1', '01-JAN-2022', 1);
INSERT INTO Books_Details95 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo)VALUES (2, 'ISBN2', 'Summary', 'www.image2.com', 250, 'Novel', 'Publisher 2', '01-JAN-2022', 2);
INSERT INTO Books_Details95 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo)VALUES (3, 'ISBN3', 'Summary', 'www.image3.com', 300, 'Novel', 'Publisher 3', '01-JAN-2022', 3);
INSERT INTO Books_Details95 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo)VALUES (4, 'ISBN4', 'Summary', 'www.image4.com', 350, 'Novel', 'Publisher 4', '01-JAN-2022', 4);
INSERT INTO Books_Details95 (BookID, ISBN, Summary, Image_URL, Pages, Category, Publisher, PublicationDate, BookshelfNo)VALUES (5, 'ISBN5', 'Summary', 'www.image5.com', 400, 'Novel', 'Publisher 5', '01-JAN-2022', 5);

INSERT INTO Inventory95 (BookID, BranchID, QuantityInStock, QuantityOnOrder)VALUES(1, 1, 10, 5);
INSERT INTO Inventory95 (BookID, BranchID, QuantityInStock, QuantityOnOrder)VALUES(2, 2, 20, 10);
INSERT INTO Inventory95 (BookID, BranchID, QuantityInStock, QuantityOnOrder)VALUES(3, 3, 30, 15);
INSERT INTO Inventory95 (BookID, BranchID, QuantityInStock, QuantityOnOrder)VALUES(4, 4, 40, 20);
INSERT INTO Inventory95 (BookID, BranchID, QuantityInStock, QuantityOnOrder)VALUES(5, 5, 50, 25);

INSERT INTO Order95 (OID, CID, AID, BookID, Genre)VALUES (1, 1, 1, 1, 'Fiction');
INSERT INTO Order95 (OID, CID, AID, BookID, Genre)VALUES (2, 1, 2, 2, 'Drama');
INSERT INTO Order95 (OID, CID, AID, BookID, Genre)VALUES (3, 1, 3, 3, 'Mystery'); 
INSERT INTO Order95 (OID, CID, AID, BookID, Genre)VALUES (4, 4, 4, 4, 'Romance');
INSERT INTO Order95 (OID, CID, AID, BookID, Genre)VALUES (5, 5, 5, 5, 'Horror');

INSERT INTO OrderDetails95 (OID, BranchID, Quantity, TotalPrice, OrderDate)VALUES (1, 1, 5, 100, '01-JAN-2022');
INSERT INTO OrderDetails95 (OID, BranchID, Quantity, TotalPrice, OrderDate)VALUES(2, 2, 10, 200, '01-JAN-2022');
INSERT INTO OrderDetails95 (OID, BranchID, Quantity, TotalPrice, OrderDate)VALUES(3, 3, 15, 300, '01-JAN-2022');
INSERT INTO OrderDetails95 (OID, BranchID, Quantity, TotalPrice, OrderDate)VALUES(4, 4, 20, 400, '01-JAN-2022');
INSERT INTO OrderDetails95 (OID, BranchID, Quantity, TotalPrice, OrderDate)VALUES(5, 5, 25, 500, '01-JAN-2022');









SELECT * FROM Branch95;
SELECT * FROM Customer95;
SELECT * FROM Books_Basic95;
SELECT * FROM Books_Details95;
SELECT * FROM Author95;
SELECT * FROM Inventory95;
SELECT * FROM Order95;
SELECT * FROM OrderDetails95;








-- Saving all in database
commit;