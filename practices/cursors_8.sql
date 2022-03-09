set serveroutput on

--write a block to accept name of the country and print the firstname, dept_name, city, postal_code, state
--of emp who work in that country

declare
  cursor c1 is SELECT employee_id, job_id, salary from employees for update of salary NOWAIT;
  vsal employees.employee_id% TYPE;
begin
  for x in c1
  loop
    dbms_output.put_line(x.employee_id||x.job_id||' current sal '||x.salary);
  if lower(x.job_id) like '%clerk' then
    vsal := x.salary + 1000;
  else
    vsal := x.salary + 500;
  end if;
  update employees set salary = vsal where CURRENT of c1;
  dbms_output.put_line('updated sal '|| vsal);
  end loop;
end;

