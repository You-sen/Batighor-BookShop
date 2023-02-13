clear screen;

set serveroutput on;
set verify off;

declare

	
	id1 Books_Basic94.BookID%TYPE := '&BookID';
	nprice Books_Basic94.Price%TYPE := '&UpdatePrice';
	
begin
	
	update Books_Basic94 set Price=nprice where BookID=id1;
	dbms_output.put_line('Price is updated');
end;
/