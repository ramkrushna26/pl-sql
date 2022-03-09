set serveroutput on

declare 
  vregionid regions.region_id%type := &regid;
  vregname regions.region_name%type := '&regname';
  null_reg EXCEPTION;
  pragma exception_init(null_reg, -1400);
begin
  insert into regions values (vregionid, vregname);
  dbms_output.put_line(SQL%rowcount||' region added');
EXCEPTION
  when null_reg then
  dbms_output.put_line('region id cannot be null');
end;
