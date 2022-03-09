set serveroutput on

--creating a package specification
create or replace PACKAGE pack1 is
  a NUMBER := 100;
  procedure add_dept (pdeptid NUMBER, pdname VARCHAR2, pmgr NUMBER, ploc NUMBER);
  procedure upd_dept (pdeptid NUMBER, pdname VARCHAR2);
  procedure del_dept (pdeptid NUMBER);
  function get_num_emp (pdeptid NUMBER) RETURN INTEGER;
end pack1;
--------------------------------------------------------------------------------

--creating package body
create or replace PACKAGE body pack1 is
  flag boolean;
  function chk_dept(pdeptid number) return boolean is
    i integer;
  begin
    select count(department_id) into i from departments where department_id = pdeptid;
    if i = 0 then return false;
    else return true; end if;
  end chk_dept;
  procedure add_dept (pdeptid NUMBER, pdname VARCHAR2, pmgr NUMBER, ploc NUMBER) is
  begin
    flag := chk_dept(pdeptid);
    if flag then dbms_output.put_line('This dept already exists.. Try again');
    else insert into departments values (pdeptid, pdname, pmgr, ploc);
    dbms_output.put_line('Dept added sucessfully');
    end if;
  end add_dept;
  procedure upd_dept (pdeptid NUMBER, pdname VARCHAR2) is
  begin
    flag := chk_dept(pdeptid);
    if not flag then dbms_output.put_line('This dept does not exists.. Try again');
    else update departments set department_name = pdname where department_id = pdeptid;
    dbms_output.put_line('Deptname changed sucessfully');
    end if;
  end upd_dept;
  procedure del_dept (pdeptid NUMBER) is
  begin
    flag := chk_dept(pdeptid);
    if not flag then dbms_output.put_line('This dept does not exists.. Try again');
    else delete from  departments where department_id = pdeptid;
    dbms_output.put_line('Dept deleted sucessfully');
    end if;
  end del_dept;
  function get_num_emp (pdeptid NUMBER) RETURN INTEGER is
    num INTEGER;
  begin
     flag := chk_dept(pdeptid);
    if not flag then RETURN 0;
    else select count(employee_id) into num from employees where department_id = pdeptid;
    return num;
    end if;
  end get_num_emp;
end pack1;


exec pack1.add_dept(280, 'IT',200, 1700)

exec pack1.upd_dept(280, 'Sales')
exec pack1.upd_dept(290, 'Sales')

exec pack1.del_dept(280)

select department_id, department_name, pack1.get_num_emp(department_id) as num_emp from departments;

