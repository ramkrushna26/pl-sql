set serveroutput on

begin
update employees set salary = salary where department_id = &deptid;
dbms_output.put_line(SQL%rowcount||' modifiewd');
delete from employees where job_id = 'ST_CLERK';
dbms_output.put_line(SQL%rowcount||' deleted');
end;
