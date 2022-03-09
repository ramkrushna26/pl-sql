set serveroutput on

declare
	vname VARCHAR2(10) := '&vname';
begin 
  for i in 1..5
  loop
    dbms_output.put_line('Hello '|| vname||i);
  end loop;
  dbms_output.put_line('out of the loop');
end;

