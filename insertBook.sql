clear screen;

set serveroutput on;
set verify off;

declare

	bookid Books_Basic94.BookID%TYPE := '&BookID';
	branchid Books_Basic94.BranchID%TYPE := '&BranchID';
	title Books_Basic94.Title%TYPE := '&Title';
	aid Books_Basic94.AID%TYPE := '&AID';
	genre Books_Basic94.Genre%TYPE := '&Genre';
	price Books_Basic94.Price%TYPE := '&Price';
	
	bookidb Books_Details94.BookID%TYPE := '&BookID';
	isbn Books_Details94.ISBN%TYPE := '&ISBN';
	summary Books_Details94.Summary%TYPE := '&Summary';
	imageurl Books_Details94.Image_URL%TYPE := '&ImageURL';
	pages Books_Details94.Pages%TYPE := '&Pages';
	category Books_Details94.Category%TYPE := '&Category';
	publisher Books_Details94.Publisher%TYPE := '&Publisher';
	publicationdate Books_Details94.PublicationDate%TYPE := '&PublicationDate';
	bookshelfno Books_Details94.BookshelfNo%TYPE := '&BookshelfNo';
	

	
begin
    
	insert into Books_Basic94 values(BookID,BranchID,Title,AID,Genre,Price);
	insert into Books_Details94 values(BookIDb,ISBN,Summary,ImageURL,Pages,Category,Publisher,PublicationDate,BookshelfNo);

end;
/

