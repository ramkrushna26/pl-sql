set serveroutput on

--create a function named cal_tax which return tax of the a given emp : tax = sal * 10%
--create a function named cal_pf which return pf of the a given emp : pf = salary *12%
--create a function named cal_netsal which return netsal of the a given emp : netsal = salary - tax - pf
--create a procedure get_emp_details which print above details and additional details in the employee table of the given employee

create or replace function cal_tax
(pempid NUMBER) RETURN NUMBER IS
  vsal NUMBER;
begin
  SELECT salary * 10/100 into vsal
  from employees
  where employee_id = pempid;
  RETURN vsal;
EXCEPTION
  when no_data_found then
    RETURN 0;
end;


create or replace function cal_pf
(pempid NUMBER) RETURN NUMBER IS
  vsal NUMBER;
begin
  SELECT salary * 12/100 into vsal
  from employees
  where employee_id = pempid;
  RETURN vsal;
EXCEPTION
  when no_data_found then
    RETURN 0;
end;


create or replace function cal_netsal
(pempid NUMBER) RETURN NUMBER IS
  vsal NUMBER;
begin
  SELECT salary - cal_tax(pempid) - cal_pf(pempid) into vsal
  from employees
  where employee_id = pempid;
  RETURN vsal;
EXCEPTION
  when no_data_found then
    RETURN 0;
end;


create or replace procedure get_emp_details
(pempid employees.employee_id% TYPE) is
  vempid employees.employee_id% TYPE;
  vname employees.first_name% TYPE;
  vlname vname% TYPE;
  vdname departments.department_name% TYPE;
  vcity locations.city% TYPE;
  vsal employees.salary% TYPE;
  vtax NUMBER;
  vpf NUMBER;
  vnetsal NUMBER;
begin
  get_name_sal(pempid, vname, vlname, vsal);
  get_dname_city(pempid, vdname, vcity);
  select e.employee_id , cal_tax(e.employee_id) as tax, cal_pf(e.employee_id) as pf, cal_netsal(e.employee_id) as netsal
  into vempid, vtax, vpf, vnetsal
  from employees e join departments d on (e.department_id = d.department_id)
  join locations l on (d.location_id = l.location_id)
  where e.employee_id = pempid;
  dbms_output.put_line(vempid||'-'||vname||'-'||vdname||'-'||vcity||'-'||vsal||'-'||vtax||'-'||vpf||'-'||vnetsal);
end;

show err

declare
  cursor c1 is select employee_id from employees;
begin
  for i in c1
  loop
    get_emp_details(i.employee_id);
  end loop;
end;
    

  