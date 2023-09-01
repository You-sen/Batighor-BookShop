SET SERVEROUTPUT ON;


-- Create views for each table
CREATE VIEW Branch94View AS SELECT * FROM Branch94@site_link;
CREATE VIEW Customer94View AS SELECT * FROM Customer94@site_link;
CREATE VIEW Author94View AS SELECT * FROM Author94@site_link;
CREATE VIEW Books_Basic94View AS SELECT * FROM Books_Basic94@site_link;
CREATE VIEW Books_Details94View AS SELECT * FROM Books_Details94@site_link;
CREATE VIEW Inventory94View AS SELECT * FROM Inventory94@site_link;
CREATE VIEW Order94View AS SELECT * FROM Order94@site_link;
CREATE VIEW OrderDetails94View AS SELECT * FROM OrderDetails94@site_link;

-- Select all data from each view
SELECT * FROM Branch94View;
SELECT * FROM Customer94View;
SELECT * FROM Author94View;
SELECT * FROM Books_Basic94View;
SELECT * FROM Books_Details94View;
SELECT * FROM Inventory94View;
SELECT * FROM Order94View;
SELECT * FROM OrderDetails94View;







CREATE VIEW Branch95View AS SELECT * FROM Branch95;
CREATE VIEW Customer95View AS SELECT * FROM Customer95;
CREATE VIEW Author95View AS SELECT * FROM Author95;
CREATE VIEW Books_Basic95View AS SELECT * FROM Books_Basic95;
CREATE VIEW Books_Details95View AS SELECT * FROM Books_Details95;
CREATE VIEW Inventory95View AS SELECT * FROM Inventory95;
CREATE VIEW Order95View AS SELECT * FROM Order95;
CREATE VIEW OrderDetails95View AS SELECT * FROM OrderDetails95;

-- Select all data from each view
SELECT * FROM Branch95View;
SELECT * FROM Customer95View;
SELECT * FROM Author95View;
SELECT * FROM Books_Basic95View;
SELECT * FROM Books_Details95View;
SELECT * FROM Inventory95View;
SELECT * FROM Order95View;
SELECT * FROM OrderDetails95View;
