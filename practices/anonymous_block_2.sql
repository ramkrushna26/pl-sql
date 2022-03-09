set serveroutput on

declare
	n1 INTEGER := &n1;
	n2 INTEGER := &n2;	
	n3 INTEGER;
  a CONSTANT integer := 100;
begin
	n3 := n1 + n2 + 100;
	dbms_output.put_line('THe sum of '||n1||' and '||n2||' is '||n3);
end;