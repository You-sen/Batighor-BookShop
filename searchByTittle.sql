clear screen;

set serveroutput on;
set verify off;

declare
	searchtittle Books_Basic94.Title%TYPE := '&tittle';	
	BookID Books_Basic94.BookID%TYPE;
	BranchID Books_Basic94.BranchID%TYPE;
	Title Books_Basic94.Title%TYPE;
	AID Books_Basic94.AID%TYPE;
	Genre Books_Basic94.Genre%TYPE;
	Price Books_Basic94.Price%TYPE;

	

	
	cursor Books_Basic94bytittle(matchtittle Books_Basic94.Title%TYPE) is
	select * from Books_Basic94
	where Title = matchtittle;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('BookID'||' -- '||'BranchID'||' -- ' || 'Title'||' -- ' || 'AID' ||' -- '|| 'Genre'||' -- '|| 'Price' );
	
	open Books_Basic94bytittle(searchtittle);
	loop
		fetch Books_Basic94bytittle into BookID,BranchID,Title,AID,Genre,Price;
		
		exit when Books_Basic94bytittle%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(BookID)||' -- '|| TO_CHAR(BranchID) ||' -- '||Title||' -- '||TO_CHAR(AID)||' -- '|| Genre||' -- '||Price);
		
	end loop;
	close Books_Basic94bytittle;
	

end;
/
BookID, BranchID, Title, AID, Genre, Price