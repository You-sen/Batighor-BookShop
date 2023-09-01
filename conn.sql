
drop database link site_link;

create database link site_link
 connect to system identified by "12345678"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 0.tcp.in.ngrok.io)
		 (PORT = 12521))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  
