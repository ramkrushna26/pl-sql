set serveroutput on

declare
  type array_type is table of number;
  arr1 array_type := array_type(1,2,3,4,5);
  i INTEGER;
begin
  i := arr1.count + 1;
  for a in i..20
  loop
    arr1.extend;
    arr1(i) := a;
    i := i+1;
  end loop;
  for b in 1..arr1.count
  loop
  dbms_output.put_line(arr1(b));
  end loop;
end;

