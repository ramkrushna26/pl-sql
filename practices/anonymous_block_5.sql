set serveroutput on

-- record variable exm

declare
	vempid employees.employee_id%type := &vempid;
  vemprec employees%rowtype;--reccrd variable
--  vfname employees.first_name%TYPE;
--  vdes employees.job_id%TYPE;
--  vhdate employees.hire_date%TYPE;
begin
  select *
  into vemprec
  from employees
  where employee_id = vempid;
  dbms_output.put_line(vemprec.first_name);
end;
