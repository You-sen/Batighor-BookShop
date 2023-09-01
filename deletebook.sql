clear screen;

set serveroutput on;
set verify off;

declare

	id Books_Basic94.BookID%TYPE := '&BookID';
	
begin
	delete from Books_Details94 where BookID=id;
	delete from Books_Basic94 where BookID=id;
	dbms_output.put_line('data deleted from book table');
end;
/