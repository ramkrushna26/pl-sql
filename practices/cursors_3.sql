set serveroutput on

declare
  amt number := &sal;
  cursor c1 is select employee_id, first_name, salary from employees where salary > amt;
  vid employees.employee_id% TYPE;
  vfname employees.first_name% TYPE;
  vsal employees.salary% TYPE;
begin
  open c1;
  loop
    fetch c1 into vid, vfname, vsal;
    exit when c1%notfound;  
    dbms_output.put_line(vid|| vfname|| vsal);
  end loop;
  dbms_output.put_line(c1%rowcount);
  close c1;
end;



