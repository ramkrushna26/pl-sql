set serveroutput on

declare
	vname VARCHAR2(10) := '&vname';
  i INTEGER := 1;
begin
  loop
    dbms_output.put_line('Hello '|| vname);
  exit when i > 4;
    i := i + 1;
  end loop;
  dbms_output.put_line('out of the loop');
end;

