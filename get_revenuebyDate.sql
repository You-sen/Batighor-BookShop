SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE FUNCTION get_revenue (p_order_date IN DATE)
RETURN NUMBER
IS
  v_revenue NUMBER(5);
BEGIN
  SELECT SUM(TotalPrice) INTO v_revenue
  FROM Order95 JOIN OrderDetails95
  ON Order95.OID = OrderDetails95.OID
  WHERE OrderDetails95.OrderDate = p_order_date;
  
  RETURN v_revenue;
END;
/

DECLARE
  v_result NUMBER;
BEGIN
  v_result := get_revenue('01-JAN-2022');
  DBMS_OUTPUT.PUT_LINE('Revenue: ' || v_result);
END;
/