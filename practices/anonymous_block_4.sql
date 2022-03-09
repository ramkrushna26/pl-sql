set serveroutput on

-- write a block to print name, designation, joing date of emp

declare
	vempid employees.employee_id%type := &vempid;
  vemprec employees%rowtype;
--  vfname employees.first_name%TYPE;
--  vdes employees.job_id%TYPE;
--  vhdate employees.hire_date%TYPE;
begin
  select first_name, job_id, hire_date
  into vfname, vdes, vhdate
  from employees
  where employee_id = vempid;
  dbms_output.put_line(vfname||vdes|| vhdate);
end;
