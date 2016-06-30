DROP FUNCTION IF EXISTS dataClear( ctype varchar );  

Create or replace function dataClear(ctype varchar) returns void as
$$
Declare
sql varchar;
Begin
IF ctype = 'pt_syslog' THEN 
	delete from pt_syslog where startdate <  (current_timestamp - interval  '30 day');    

ELSIF ctype = 'pt_resources' THEN 
	delete from pt_resources where createdate <  (current_timestamp - interval  '30 day');    
	
ELSE
End if;	
End;
$$
Language plpgsql;