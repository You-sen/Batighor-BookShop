set serveroutput on;

create or replace function countauthorbook(matchauthor Author94.Name%TYPE)
  return number
  is
  
  totalbooks number;

begin
	
	 select count(BookID) into totalbooks from Books_Basic94
	 where AID in ( select AID from Author94 where Name = matchauthor);
	 
	return totalbooks;

end countauthorbook;
/

declare

    name Author94.Name%TYPE := '&AuthorName';
	res number;
	
begin

	res := countauthorbook(name);
	dbms_output.put_line('Total Books ' ||name|| ' = '||res);
	
end;
/