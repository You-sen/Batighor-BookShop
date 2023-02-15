SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION get_books_by_genre (f_genre IN VARCHAR2)
RETURN sys_refcursor
IS
  l_result sys_refcursor;
BEGIN
  OPEN l_result FOR
    SELECT title
    FROM Books_Basic95
    WHERE genre = f_genre;

  RETURN l_result;
END get_books_by_genre;
/
DECLARE
  l_result sys_refcursor;
  l_title Books_Basic95.title%type;
BEGIN
  l_result := get_books_by_genre('Fiction');

  LOOP
    FETCH l_result INTO l_title;
    EXIT WHEN l_result%notfound;
    DBMS_OUTPUT.PUT_LINE(l_title);
  END LOOP;

  CLOSE l_result;
END;
/