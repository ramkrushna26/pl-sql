set serveroutput on

--write a block to accept managerid at runtime and print the empid, firstname, deptid
--of emp who report to that manager

declare
  cursor c1 is select * from employees;
  vemprec employees%rowtype;
begin
  open c1;
  loop
    fetch c1 into vemprec;
    exit when c1%notfound;  
    dbms_output.put_line(vemprec.employee_id);
  end loop;
  dbms_output.put_line(c1%rowcount);
  close c1;
end;

