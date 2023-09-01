SET SERVEROUTPUT ON;
DECLARE
   CURSOR author_cur IS
      SELECT *
        FROM Author95
      UNION
      SELECT *
        FROM Author94@site_link;
BEGIN
   FOR author_rec IN author_cur LOOP
      DBMS_OUTPUT.PUT_LINE (author_rec.AID || ' ' || author_rec.Name);
   END LOOP;
END;
/



DECLARE
   CURSOR c1 IS
      SELECT *
      FROM Branch95
      UNION
      SELECT *
      FROM Branch94@site_link;
BEGIN
   FOR r1 IN c1 LOOP
      dbms_output.put_line(r1.BranchID || ',' || r1.BranchName || ',' || r1.Email || ',' || r1.Phone || ',' || r1.Address || ',' || r1.Location);
   END LOOP;
END;
/