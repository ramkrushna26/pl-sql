set serveroutput on

Declare
 vempid employees.employee_id%type ;
 vfname employees.first_name%type; 
 vlname vfname%type;
 vsal employees.salary%type;
begin
  vempid := &vempid;
  select first_name, last_name, salary
  into vfname, vlname, vsal
  from employees where department_id = vempid;
  dbms_output.put_line(vempid||' '|| vfname||' '|| vlname||' '||vsal);
EXCEPTION 
  when no_data_found then
    dbms_output.put_line('No such employee found');
  when too_many_rows then
    dbms_output.put_line('Multiple rows selected'); 
  when others then
    dbms_output.put_line('Error in execution...  '||sqlerrm); 
end;
 