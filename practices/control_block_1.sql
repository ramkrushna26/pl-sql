set serveroutput on

declare
	vempid employees.employee_id%type := &vempid;
  vfname employees.first_name%TYPE;
  vlname vfname%TYPE;
  vsal employees.salary%TYPE;
  vjob employees.job_id%TYPE;
begin
  select first_name, last_name, salary, job_id
  into vfname, vlname, vsal, vjob
  from employees
  where employee_id = vempid;
  dbms_output.put_line(vempid||vfname ||vlname|| vsal||vjob);
  if lower(vjob) like '%clerk' then
    vsal := vsal + 1000;
  elsif lower(vjob) like '%man' then
    vsal := vsal + 2000;
  else
    vsal := vsal + 500;
  end if;
  dbms_output.put_line(vsal);
end;
