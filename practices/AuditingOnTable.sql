set serveroutput on

--auditing on the table

create table dept_copy as select * from departments where 1=2;

select * from dept_copy;

alter table dept_copy add(action varchar(10), act_date date, username varchar(20));

create or replace trigger audit_dept
after insert or update or delete on departments
for each row
begin
  if inserting then
    insert into dept_copy values(:new.department_id, :new.department_name, :new.manager_id, :new.location_id,
      'insert', sysdate, user);
  elsif updating then
    insert into dept_copy values(:old.department_id, :old.department_name, :old.manager_id, :old.location_id,
      'update O', sysdate, user);
    insert into dept_copy values(:new.department_id, :new.department_name, :new.manager_id, :new.location_id,
      'update N', sysdate, user);
  elsif deleting then
    insert into dept_copy values(:old.department_id, :old.department_name, :old.manager_id, :old.location_id,
      'delete', sysdate, user);
  end if;
end;

select * from dept_copy;

insert into departments values(300, 'Protector', 100, 2000);

UPDATE departments set department_name = 'Salesman' where department_id = 300;

delete from departments where department_id = 300;

