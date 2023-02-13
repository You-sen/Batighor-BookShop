set serveroutput on;

create or replace procedure countbranchcustomer(
		matchbranchname in Branch94.BranchName%TYPE, totalCustomer in out number )
		IS	
	
begin  

	select count(CID) into totalCustomer from Customer94
	 where BranchID in ( select BranchID from Branch94 where BranchName = matchbranchname);
	 
	 
end countbranchcustomer;
/
declare
    name Branch94.BranchName%TYPE := '&BranchName';
	res number:=0;
begin
	
	countbranchcustomer(name,res);
	dbms_output.put_line('Total Customer ' ||name|| ' = '||res);

end;
/