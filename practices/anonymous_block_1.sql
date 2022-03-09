set serveroutput on

declare
	n1 INTEGER := 10;
	n1 INTEGER := 20;	
	n3 INTEGER;
begin
	n3 := n1 + n2;
	dbms_output.put_line("THe sum of "||n1||" & "||n2||" is "||n3);
end;


