set serveroutput on

--create a procedure named update_pcode which accepts a locaion_id and a new postal code and
--update the existing pcode of that location

create or replace procedure update_pcode
(plocid locations.location_id% TYPE, pcode locations.postal_code% TYPE) is
begin
  update locations set postal_code = pcode
  where location_id = plocid;
end;

show err

exec update_pcode(1000, 'NB100')

create or replace function get_num_of_dept
(pcid countries.country_id% TYPE) return number is
  vndept NUMBER;
begin
  select count(d.department_id) into vndept
  from departments d join locations l on (d.location_id = d.department_id)
  join countries c on (l.country_id = c.country_id)
  where c.country_id = pcid;
  return vndept;
end;

select get_num_of_dept('IT') from dual
