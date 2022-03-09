set serveroutput on

create or replace procedure add_job
(pjobid jobs.job_id%type, pjob_title jobs.job_title%type, 
pminsal jobs.min_salary%type, pmaxsal jobs.max_Salary%type) is
begin
  insert into jobs values(pjobid, pjob_title, pminsal, pmaxsal);
  dbms_output.put_line('Job added sucessfully');
end;


exec add_job('HR_MAN', 'human resource manager', 1000, 50000)