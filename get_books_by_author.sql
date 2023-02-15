SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION get_books_by_author_new (f_author_name IN VARCHAR2)
RETURN sys_refcursor
IS
  l_result sys_refcursor;
BEGIN
  OPEN l_result FOR
    SELECT b.title, b.Genre
    FROM Books_Basic95 b
    JOIN Author95 a ON b.aid = a.aid
    WHERE a.name = f_author_name;

  RETURN l_result;
END get_books_by_author_new;
/
DECLARE
  l_result sys_refcursor;
  l_title Books_Basic95.title%type;
  l_genre Books_Basic95.genre%type;
BEGIN
  l_result := get_books_by_author_new('Author 1');

  LOOP
    FETCH l_result INTO l_title, l_genre;
    EXIT WHEN l_result%notfound;
    DBMS_OUTPUT.PUT_LINE(l_title || ', ' || l_genre);
  END LOOP;

  CLOSE l_result;
END;
/