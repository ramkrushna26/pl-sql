set serveroutput on

--write a block which accept no betn 5 n 20 and prints following output

declare
	i INTEGER := '&i';
begin 
  if 5 <= i and i <= 20 then
    for j in 1..i
    loop
     dbms_output.put_line(j||' '||(i+1-j));
    end loop;
  else
    dbms_output.put_line('out of the scope');
  end if;
end;

