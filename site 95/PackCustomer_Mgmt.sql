SET SERVEROUTPUT ON;
SET VERIFY OFF;

--DROP TRIGGER Customer95_BI_TRG;
CREATE OR REPLACE TRIGGER Customer95_BI_TRG
BEFORE INSERT ON Customer95
FOR EACH ROW
BEGIN
	SELECT Customer95_CID_SEQ.NEXTVAL INTO :new.CID FROM dual;
	
	dbms_output.put_line('Customer inserted successfully');
	  DBMS_OUTPUT.PUT_LINE('CUST_CID: ' || :new.CID);
END;
/


CREATE OR REPLACE PACKAGE Customer_Mgmt AS
   FUNCTION search_customer(p_cust_name IN Customer95.CName%TYPE) RETURN NUMBER;
END Customer_Mgmt;
/

CREATE OR REPLACE PACKAGE BODY Customer_Mgmt AS
   FUNCTION search_customer(p_cust_name IN Customer95.CName%TYPE) RETURN NUMBER IS
      v_cust_id Customer95.CID%TYPE;
   BEGIN
      SELECT CID
      INTO v_cust_id
      FROM Customer95
      WHERE CName = p_cust_name;
      RETURN v_cust_id;
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         RETURN NULL;
   END search_customer;
END Customer_Mgmt;
/


DECLARE
  CUST_NAME Customer95.CName%TYPE :='Yousuf';
  CUST_BRANCH_ID Customer95.BranchID%TYPE:= 1;
  CUST_AGE Customer95.Age%TYPE:= 30;
  CUST_CID Customer95.CID%TYPE;
  
   
   --CUST_NAME VARCHAR2(50) := &CUST_NAME;
   --CUST_BRANCH_ID NUMBER := &BRANCH_ID;
   --CUST_AGE NUMBER := &AGE;


 
  
  
BEGIN

  CUST_CID := Customer_Mgmt.Search_Customer(CUST_NAME);
  IF CUST_CID IS NULL THEN
   -- Customer_Mgmt.Insert_Customer(CUST_NAME,CUST_BRANCH_ID,CUST_AGE);
	-- dbms_output.put_line('Customer inserted successfully');
 INSERT INTO Customer95 (BranchID, CName, Age)VALUES (CUST_BRANCH_ID, CUST_NAME, CUST_AGE);
  DBMS_OUTPUT.PUT_LINE('Customer name: ' || CUST_NAME);
  DBMS_OUTPUT.PUT_LINE('Branch ID: ' || CUST_BRANCH_ID);
  DBMS_OUTPUT.PUT_LINE('Age: ' || CUST_AGE);
   ELSE
    dbms_output.put_line('Customer already exists');
	
  END IF;
  

  

  DBMS_OUTPUT.PUT_LINE('FUNCTION_CUST_CID: ' || CUST_CID);

  COMMIT;
END;
/

