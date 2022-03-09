set serveroutput on

--create a procedure named get_dname_city which accepts as empid as input param and
--returns deptname and city of that emp through out param

create or replace procedure get_dname_city 
(pempid employees.employee_id%type, pdname out departments.department_name% TYPE,
pcity out locations.city% TYPE) is
begin
  select d.department_name, l.city into pdname, pcity
  from employees e join departments d on (e.department_id = d.department_id)
  join locations l on (d.location_id = l.location_id)
  where employee_id = pempid;
exception
  when no_data_found then 
  dbms_output.put_line('No such employee found');
  pdname := 'X';
  pcity := 'X';
end;

show err

declare
  vempid number := &empid;
  vdname varchar(25);
  vcity varchar(25);
begin
 get_dname_city(vempid, vdname, vcity);
 dbms_output.put_line(vempid||' '||vdname||' '||vcity);
end;

