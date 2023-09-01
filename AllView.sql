set serveroutput on;

-- Create views for each table
CREATE VIEW Branch94View AS SELECT * FROM Branch94;
CREATE VIEW Customer94View AS SELECT * FROM Customer94;
CREATE VIEW Author94View AS SELECT * FROM Author94;
CREATE VIEW Books_Basic94View AS SELECT * FROM Books_Basic94;
CREATE VIEW Books_Details94View AS SELECT * FROM Books_Details94;
CREATE VIEW Inventory94View AS SELECT * FROM Inventory94;
CREATE VIEW Order94View AS SELECT * FROM Order94;
CREATE VIEW OrderDetails94View AS SELECT * FROM OrderDetails94;

-- Select all data from each view
SELECT * FROM Branch94View;
SELECT * FROM Customer94View;
SELECT * FROM Author94View;
SELECT * FROM Books_Basic94View;
SELECT * FROM Books_Details94View;
SELECT * FROM Inventory94View;
SELECT * FROM Order94View;
SELECT * FROM OrderDetails94View;







CREATE VIEW Branch95View AS SELECT * FROM Branch95@site_link;
CREATE VIEW Customer95View AS SELECT * FROM Customer95@site_link;
CREATE VIEW Author95View AS SELECT * FROM Author95@site_link;
CREATE VIEW Books_Basic95View AS SELECT * FROM Books_Basic95@site_link;
CREATE VIEW Books_Details95View AS SELECT * FROM Books_Details95@site_link;
CREATE VIEW Inventory95View AS SELECT * FROM Inventory95@site_link;
CREATE VIEW Order95View AS SELECT * FROM Order95@site_link;
CREATE VIEW OrderDetails95View AS SELECT * FROM OrderDetails95@site_link;

-- Select all data from each view
SELECT * FROM Branch95View;
SELECT * FROM Customer95View;
SELECT * FROM Author95View;
SELECT * FROM Books_Basic95View;
SELECT * FROM Books_Details95View;
SELECT * FROM Inventory95View;
SELECT * FROM Order95View;
SELECT * FROM OrderDetails95View;
