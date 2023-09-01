SET SERVEROUTPUT ON;
SET VERIFY OFF;

SET line 100;
SET linesize 300;
SET pagesize 300;

COLUMN ISBN FORMAT A20;
COLUMN Summary FORMAT A20;
COLUMN Image_URL FORMAT A20;

COLUMN Category FORMAT A20;
COLUMN Publisher FORMAT A20;
COLUMN PublicationDate FORMAT A20;

DECLARE
   CURSOR books_cursor IS
      SELECT bb.BookID, bb.BranchID, bb.Title, bb.AID, bb.Genre, bb.Price,
             bd.ISBN, bd.Summary, bd.Image_URL, bd.Pages, bd.Category, bd.Publisher, bd.PublicationDate, bd.BookshelfNo
        FROM Books_Basic95 bb
        JOIN Books_Details95 bd ON bb.BookID = bd.BookID;
   books_rec books_cursor%ROWTYPE;
BEGIN
   OPEN books_cursor;
   FETCH books_cursor INTO books_rec;
   DBMS_OUTPUT.PUT_LINE('BookID' || ' ' || 'BranchID' || ' ' || 'Title' || ' ' || 'AID' || ' ' || 'Genre' || ' ' || 'Price' || ' ' || 'ISBN' || ' ' || 'Summary' || ' ' || 'Image_URL' || ' ' || 'Pages' || ' ' || 'Category' || ' ' || 'Publisher' || ' ' || 'PublicationDate' || ' ' || 'BookshelfNo');
   WHILE books_cursor%FOUND LOOP
      DBMS_OUTPUT.PUT_LINE(books_rec.BookID || ' ' || books_rec.BranchID || ' ' || books_rec.Title || ' ' || books_rec.AID || ' ' || books_rec.Genre || ' ' || books_rec.Price || ' ' || books_rec.ISBN || ' ' || books_rec.Summary || ' ' || books_rec.Image_URL || ' ' || books_rec.Pages || ' ' || books_rec.Category || ' ' || books_rec.Publisher || ' ' || books_rec.PublicationDate || ' ' || books_rec.BookshelfNo);
      FETCH books_cursor INTO books_rec;
   END LOOP;
   CLOSE books_cursor;
END;
/

DECLARE
   CURSOR books_cursor IS
      SELECT bb.BookID, bb.BranchID, bb.Title, bb.AID, bb.Genre, bb.Price,
             bd.ISBN, bd.Summary, bd.Image_URL, bd.Pages, bd.Category, bd.Publisher, bd.PublicationDate, bd.BookshelfNo
        FROM Books_Basic94@site_link bb
        JOIN Books_Details94@site_link bd ON bb.BookID = bd.BookID;
   books_rec books_cursor%ROWTYPE;
BEGIN
   OPEN books_cursor;
   FETCH books_cursor INTO books_rec;
   DBMS_OUTPUT.PUT_LINE('BookID' || ' ' || 'BranchID' || ' ' || 'Title' || ' ' || 'AID' || ' ' || 'Genre' || ' ' || 'Price' || ' ' || 'ISBN' || ' ' || 'Summary' || ' ' || 'Image_URL' || ' ' || 'Pages' || ' ' || 'Category' || ' ' || 'Publisher' || ' ' || 'PublicationDate' || ' ' || 'BookshelfNo');
WHILE books_cursor%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(books_rec.BookID || ' ' || books_rec.BranchID || ' ' || books_rec.Title || ' ' || books_rec.AID || ' ' || books_rec.Genre || ' ' || books_rec.Price || ' ' || books_rec.ISBN || ' ' || books_rec.Summary || ' ' || books_rec.Image_URL || ' ' || books_rec.Pages || ' ' || books_rec.Category || ' ' || books_rec.Publisher || ' ' || books_rec.PublicationDate || ' ' || books_rec.BookshelfNo);
FETCH books_cursor INTO books_rec;
END LOOP;
CLOSE books_cursor;
END;
/