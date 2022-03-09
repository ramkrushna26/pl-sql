set serveroutput on

create or replace trigger no_dml
before insert or update or delete on countries
begin
  if to_char(sysdate, 'Dy') in ('Fri', 'Sat', 'Sun') then
    raise_application_error(-20000, 'table cannot modified on this day...');
  end if;
end;

show err

delete from countries where country_id = 'IN';

