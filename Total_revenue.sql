SET SERVEROUTPUT ON;
SET VERIFY OFF;

SET line 100;
SET linesize 300;
SET pagesize 300;

DECLARE
  v_revenue NUMBER(5);
BEGIN
  SELECT SUM(TotalPrice) INTO v_revenue
  FROM Order95 JOIN OrderDetails95
  ON Order95.OID = OrderDetails95.OID;
  
  DBMS_OUTPUT.PUT_LINE('Total Revenue: ' || v_revenue);
END;
/