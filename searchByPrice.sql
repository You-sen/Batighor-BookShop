clear screen;

set serveroutput on;
set verify off;

declare

	a Books_Basic94.Price%TYPE := '&pricerangeA';	
	b Books_Basic94.Price%TYPE := '&pricerangeb';
	BookID Books_Basic94.BookID%TYPE;
	BranchID Books_Basic94.BranchID%TYPE;
	Title Books_Basic94.Title%TYPE;
	AID Books_Basic94.AID%TYPE;
	Genre Books_Basic94.Genre%TYPE;
	Price Books_Basic94.Price%TYPE;
	
	cursor Books_Basic94byprice(matchpricea Books_Basic94.price%TYPE,matchpriceb Books_Basic94.price%TYPE) is
	select * from Books_Basic94 where Price BETWEEN a AND b Union SELECT * from Books_Basic95@site_link where Price BETWEEN a AND b;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('BookID'||' -- '||'BranchID'||' -- ' || 'Title'||' -- ' || 'AID' ||' -- '|| 'Genre'||' -- '|| 'Price' );
	
	open Books_Basic94byprice(a,b);
	loop
		fetch Books_Basic94byprice into BookID,BranchID,Title,AID,Genre,Price;
		
		exit when Books_Basic94byprice%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(BookID)||' -- '|| TO_CHAR(BranchID) ||' -- '||Title||' -- '||TO_CHAR(AID)||' -- '|| Genre||' -- '||Price);
		
	end loop;
	close Books_Basic94byprice;
	

end;
/
