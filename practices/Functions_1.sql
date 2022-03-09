set serveroutput on

create or replace function cal_annual_sal
(pempid NUMBER) RETURN NUMBER IS
  vsal NUMBER;
begin
  SELECT salary * 12 into vsal
  from employees
  where employee_id = pempid;
  RETURN vsal;
EXCEPTION
  when no_data_found then
    RETURN 0;
end;


select cal_annual_sal(100) from dual
or
select cal_annual_sal(employee_id) from employees
or
declare
  vsal number;
begin
  vsal := cal_annual_sal(100);
  dbms_output.put_line('sal : '|| vsal);
end;