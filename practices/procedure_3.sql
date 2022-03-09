set serveroutput on

--create a procedure name get_job_hdate which accepts asn empid through input param and
--prints jobid and hiredate of that emp

create or replace procedure get_job_hdate
(pempid employees.employee_id% TYPE) is
  vjobid employees.job_id% TYPE;
  vhdate date;
begin
  select job_id, hire_date into vjobid, vhdate
  from employees where employee_id = pempid;
  dbms_output.put_line(pempid||'-'||vjobid||'-'|| vhdate);
EXCEPTION
  when no_data_found then dbms_output.put_line('no such emp found');
end;

exec get_job_hdate(100)