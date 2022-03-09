set serveroutput on

--create a procedure which acceptsa date and returns the empid, fullname, joining date,
--dept name and city of all emp who have joined before that date
--return the data using OUT mode parameter of array type

create or replace package type_pack1 is
  type rec_type1 is record
  (employee_id number(4), first_name varchar(20), last_name varchar(20), department_name varchar(20), 
  hire_date date,city varchar(20));
  type cur_type1 is table of rec_type1 index by binary_integer;
end type_pack1;

create or replace procedure get_emps
  (phdate date, tab1 out type_pack1.cur_type1) is
  cursor c1 is select e.employee_id, e.first_name, e.last_name, d.department_name, 
  e.hire_date, l.city
  from employees e join departments d on(e.department_id = d.department_id)
  join locations l on(d.location_id = l.location_id) 
  where e.hire_date < phdate;
  i INTEGER := 1;
begin
  for x in c1
  loop
    tab1(i) := x;
    i := i+1;
  end loop;  
  for x in 1..tab1.count
  loop
  dbms_output.put_line(tab1(x).employee_id||' '||tab1(x).first_name||' '||tab1(x).last_name
  ||' '||tab1(x).department_name||' '||tab1(x).hire_date||' '|| tab1(x).city);
  end loop;
end;

show err

declare
  tab1 type_pack1.cur_type1;
begin
 get_emps('13-JAN-04', tab1);
end;

