set serveroutput on

--write a block to accept managerid at runtime and print the empid, firstname, deptid
--of emp who report to that manager

declare
  vmid number := &vmid;
  cursor c1 is select employee_id, first_name, deptid from employees where manager_id = vmid;
  vid employees.employee_id% TYPE;
  vfname employees.first_name% TYPE;
  deptid employees.department_id% TYPE;
begin
  open c1;
  loop
    fetch c1 into vid, vfname, deptid;
    exit when c1%notfound;  
    dbms_output.put_line(vid|| vfname|| deptid);
  end loop;
  dbms_output.put_line(c1%rowcount);
  close c1;
end;



