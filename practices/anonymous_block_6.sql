set serveroutput on

-- print the dept name and city of given emp

declare
	vempid employees.employee_id%type := &vempid;
  vdept departments.department_name% TYPE;
  vcity locations.city% TYPE;
--  vfname employees.first_name%TYPE;
--  vdes employees.job_id%TYPE;
--  vhdate employees.hire_date%TYPE;
begin
  select d.department_id, l.city
  into vdept, vcity
  from employees e join departments d on (e.department_id = d.department_id)
  join locations l on (d.location_id = l.location_id)
  where employee_id = vempid;
  dbms_output.put_line(vdept|| vcity);
end;
