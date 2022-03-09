set serveroutput on

--salary should not decrease

create or replace trigger desc_sal
before update of salary on employees
for each row
  when (old.salary < new.salary)
begin
  raise_application_error(-21000, 'Salary can not be decreased');
end;

show err

update employees set salary = 5 where employee_id = 100;