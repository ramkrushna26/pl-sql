set serveroutput on

--write a block to accept name of the country and print the firstname, dept_name, city, postal_code, state
--of emp who work in that country

declare
  vcountry countries.country_name% TYPE := '&vcountry';
  cursor c1 is select e.first_name, d.department_name, l.city, l.postal_code, l.state_province 
  from employees e join departments d on e.department_id = d.department_id
  join locations l on d.location_id = l.location_id
  join countries c on l.country_id = c.country_id
  where lower(c.country_name) = lower(vcountry);
  vname employees.employee_id% TYPE;
  vdname departments.department_name% TYPE;
  vcity locations.city% TYPE;
  vcode locations.postal_code% TYPE;
  vstate locations.state_province% TYPE;
begin
  open c1;
  loop
    fetch c1 into vname, vdname, vcity, vcode, vstate;
    exit when c1%notfound;
    dbms_output.put_line(vname|| vdname|| vcity|| vcode|| vstate);
  end loop;
  if c1%rowcount = 0 then
    dbms_output.put_line('No emps in country '|| vcountry);
  else
    dbms_output.put_line(c1%rowcount||' emps in '|| vcountry);
  end if;
  close c1;
end;

