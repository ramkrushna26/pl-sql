set serveroutput on

create or replace view v1
as select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e join departments d
ON (e.department_id = d.department_id)

select * FROM v1;

create or replace trigger inst_trig
instead of insert on v1
for each row
begin
  insert into departments (department_id, department_name)
  values(:new.department_id, :new.department_name);
  insert into employees (employee_id, last_name, department_id)
  values(:new.employee_id, :new.last_name, :new.department_id);
end;

show err

insert into v1 values(1111, 'ABC', 3000, 'XYZ');
