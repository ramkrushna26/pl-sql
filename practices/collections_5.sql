set serveroutput on

declare
  type varray_type is varray(107) of number;
  arr1 varray_type := varray_type();
  cursor c1 is  select salary from employees;
  i INTEGER := 1;
begin
  for a in c1
  loop
    arr1.extend;
    arr1(i) := a.salary;
    i := i+1;
  end loop;
  for b in 1..arr1.count
  loop
  dbms_output.put_line(arr1(b));
  end loop;
end;

