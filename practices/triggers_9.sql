set serveroutput on

--should not delete president from employees

create or replace trigger del_pres
before delete on employees
for each row
  when (old.job_id = 'AD_PRES')
begin
  raise_application_error(-20100, 'can not delete the president, hehehehhehe');
end;

delete from employees where job_id = 'AD_PRES';
