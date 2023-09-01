SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE TRIGGER Order95_BI_TRG
BEFORE INSERT ON Order95
FOR EACH ROW
BEGIN
	SELECT SEQ_ORDER_ID.NEXTVAL INTO :new.OID FROM dual;
	
	dbms_output.put_line('Order inserted successfully');
	  DBMS_OUTPUT.PUT_LINE('CUST_OID: ' || :new.OID);
END;
/







CREATE OR REPLACE PACKAGE Book_Orders AS
  FUNCTION insert_Order (p_customer_name Customer95.CName%TYPE, p_book_title Books_Basic95.Title%TYPE, p_author_name Author95.Name%TYPE)
    RETURN Customer95.CID%TYPE;

  FUNCTION search_order (p_customer_id Customer95.CID%TYPE)
    RETURN SYS_REFCURSOR;

  FUNCTION get_books_by_genre (p_genre Books_Basic95.genre%TYPE)
    RETURN SYS_REFCURSOR;

  FUNCTION get_books_by_author (p_author_name Author95.Name%TYPE)
    RETURN SYS_REFCURSOR;
END Book_Orders;
/

CREATE OR REPLACE PACKAGE BODY Book_Orders AS
  FUNCTION insert_Order (p_customer_name Customer95.CName%TYPE, p_book_title Books_Basic95.Title%TYPE, p_author_name Author95.Name%TYPE)
    RETURN Customer95.CID%TYPE
  IS
    v_customer_id Customer95.CID%TYPE;
    v_book_id Books_Basic95.BookID%TYPE;
    v_author_id Author95.AID%TYPE;
	v_genre Books_Basic95.Genre%TYPE;
  BEGIN
   
    SELECT Customer95.CID, Books_Basic95.BookID, Author95.AID , Books_Basic95.Genre
    INTO v_customer_id, v_book_id, v_author_id ,v_genre
    FROM Customer95, Books_Basic95, Author95
    WHERE Customer95.CName = p_customer_name
    AND Books_Basic95.Title = p_book_title
    AND Author95.Name = p_author_name;
	


  
    INSERT INTO Order95 (CID, AID, BookID, Genre)
    VALUES (v_customer_id,v_author_id, v_book_id, v_genre);

    RETURN v_customer_id;
  END insert_Order;

  FUNCTION search_order (p_customer_id Customer95.CID%TYPE)
    RETURN SYS_REFCURSOR
  IS
    v_order_history SYS_REFCURSOR;
  BEGIN
    OPEN v_order_history FOR
    SELECT Books_Basic95.genre, Author95.Name
    FROM Order95, Books_Basic95, Author95
    WHERE Order95.CID = p_customer_id
    AND Books_Basic95.BookID = Order95.BookID
    AND Author95.AID = Books_Basic95.AID;

    RETURN v_order_history;
  END search_order;

  FUNCTION get_books_by_genre (p_genre Books_Basic95.genre%TYPE)
    RETURN SYS_REFCURSOR
  IS
    v_books_by_genre SYS_REFCURSOR;
  BEGIN
    OPEN v_books_by_genre FOR
    SELECT Title
    FROM Books_Basic95
    WHERE genre = p_genre;

RETURN v_books_by_genre;
END get_books_by_genre;

FUNCTION get_books_by_author (p_author_name Author95.Name%TYPE)
RETURN SYS_REFCURSOR
IS
v_books_by_author SYS_REFCURSOR;
BEGIN
OPEN v_books_by_author FOR
SELECT Books_Basic95.Title, Books_Basic95.genre
FROM Books_Basic95, Author95
WHERE Books_Basic95.AID = Author95.AID
AND Author95.Name = p_author_name;

RETURN v_books_by_author;
END get_books_by_author;
END Book_Orders;
/


DECLARE
  v_customer_id_d Customer95.CID%TYPE;
  v_order_history_d SYS_REFCURSOR;
  v_books_by_genre_d SYS_REFCURSOR;
  v_books_by_author_d SYS_REFCURSOR;
  v_customer_name Customer95.CName%TYPE := 'Customer 1';
  v_book_title Books_Basic95.Title%TYPE := 'Book3';
  v_author_name Author95.Name%TYPE := 'Author 5';
  v_genre_d Books_Basic95.Genre%TYPE;
  v_author Author95.Name%TYPE;
BEGIN

  v_customer_id_d := Book_Orders.insert_Order(v_customer_name, v_book_title, v_author_name);


  v_order_history_d := Book_Orders.search_order(v_customer_id_d);

  LOOP
    FETCH v_order_history_d INTO v_genre_d, v_author;
    EXIT WHEN v_order_history_d%NOTFOUND;


    v_books_by_genre_d := Book_Orders.get_books_by_genre(v_genre_d);
    dbms_output.put_line('Books by genre ' || v_genre_d);
    LOOP
      FETCH v_books_by_genre_d INTO v_book_title;
      EXIT WHEN v_books_by_genre_d%NOTFOUND;
      dbms_output.put_line('Title: ' || v_book_title);
    END LOOP;


    v_books_by_author_d := Book_Orders.get_books_by_author(v_author);
    dbms_output.put_line('Books by author ' || v_author);
    LOOP
      FETCH v_books_by_author_d INTO v_book_title, v_genre_d;
      EXIT WHEN v_books_by_author_d%NOTFOUND;
      dbms_output.put_line('Title: ' || v_book_title || ', Genre: ' || v_genre_d);
    END LOOP;
  END LOOP;
END;
/