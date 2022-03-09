set serveroutput on

create or replace trigger msg_trig
after insert or update or delete on regions
begin
  if inserting then 
    dbms_output.put_line('added a region');
  elsif updating THEN
    dbms_output.put_line('modified a region');
  elsif deleting THEN
    dbms_output.put_line('deleted a region');
  end if;
end;

show err

insert into regions values(11, 'abnd');
update regions set region_name = 'abcd' where region_id = 11;
delete from regions where region_id = 11;