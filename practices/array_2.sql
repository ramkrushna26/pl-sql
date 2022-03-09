set serveroutput on

create or replace package type_pack is
  type rec_type is record
  (first_name varchar(20), department_id number(10), department_name varchar(20),
  city varchar(20), state_province varchar(20), postal_code varchar(20));
  type cur_type is table of rec_type index by binary_integer;
end type_pack;


create or replace procedure get_country_details
  (pcountry countries.country_name%type, tab1 out type_pack.cur_type) is
  cursor c1 is select e.first_name, e.department_id, d.department_name, 
  l.city, l.state_province, l.postal_code
  from employees e join departments d on(e.department_id = d.department_id)
  join locations l on(d.location_id = l.location_id) 
  join countries c on(l.country_id = c.country_id)
  where lower(c.country_name) = lower(pcountry);
  i INTEGER := 1;
begin
  for x in c1
  loop
    tab1(i) := x;
    i := i+1;
  end loop;  
  for x in 1..tab1.count
  loop
  dbms_output.put_line(tab1(x).first_name||' '|| tab1(x).department_id||' '|| tab1(x).department_name
    ||' '|| tab1(x).city||' '|| tab1(x).state_province||' '|| tab1(x).postal_code);
  end loop;
end;

show err

declare
  tab1 type_pack.cur_type;
begin
 get_country_details('united kingdom', tab1);
  for x in 1..tab1.count
  loop
  dbms_output.put_line(tab1(x).first_name||' '|| tab1(x).department_id||' '|| tab1(x).department_name
    ||' '|| tab1(x).city||' '|| tab1(x).state_province||' '|| tab1(x).postal_code);
  end loop;
end;


