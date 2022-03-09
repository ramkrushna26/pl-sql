set serveroutput on

-- write block which accepts a city n print deptname, total sal, avg sal, n no. of emp
-- working in each deptin that city(use cursor for loop)

Declare
  vcity locations.city% TYPE := '&vcity';
  cursor c1 is SELECT d.department_name, SUM(e.salary) as sm, round(AVG(e.salary), 2) as av, count(e.employee_id) as ct
  from employees e join departments d on (e.department_id = d.department_id)
  join locations l on (d.location_id = l.location_id)
  where lower(l.city) = lower(vcity)
  group by d.department_name;
begin
  for i in c1
  loop
    dbms_output.put_line(i.department_name||'--'||i.sm||'--'||i.av||'--'||i.ct);
  end loop;
end;
