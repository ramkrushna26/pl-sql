set serveroutput on

create or replace procedure inc_sal
(psal in out NUMBER, inc_parcent NUMBER) is
begin
  psal := psal + psal * inc_parcent/100;
end;

show err

declare
  vsal employees.salary% TYPE := &sal;
begin
  dbms_output.put_line('current sal : '||vsal);
  inc_sal(vsal, 150);
  dbms_output.put_line('updated sal : '||vsal);
end;

