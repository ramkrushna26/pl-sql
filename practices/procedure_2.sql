set serveroutput on

create or replace procedure get_name_sal
(pempid employees.employee_id% TYPE )is
  vfname employees.first_name% TYPE;
  vlname vfname% TYPE;
  vsal employees.salary% TYPE;
begin
  select first_name, last_name, salary
  into vfname, vlname, vsal
  from employees where employee_id = pempid;
  dbms_output.put_line(vfname||'-'|| vlname||'-'|| vsal);
exception
  when no_data_found then dbms_output.put_line('No such emp found');
end;


exec get_name_sal(10000)