set serveroutput on

create or replace type myobj is OBJECT
(c1 number, c2 varchar(20));

create or replace type mytab is table of myobj;

create or replace function get_coll return mytab is
  tab1 mytab := mytab();
  i INTEGER := 1;
  cursor c1 is SELECT department_id, department_name from departments;
begin
  for x in c1
  loop
    tab1.extend;
    tab1(i) := myobj(x.department_id, x.department_name);
    i := i + 1;
  end loop;
  return tab1;
end;

show err

declare
  tab1 mytab := mytab();
begin
  tab1 := get_coll;
  for n in 1..tab1.count
  loop
    dbms_output.put_line(tab1(n).c1||'-'|| tab1(n).c2);
  end loop;
end;

