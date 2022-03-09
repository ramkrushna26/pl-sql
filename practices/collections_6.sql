set serveroutput on

create or replace type addr_obj is object
(street varchar(20), city varchar(20), pcode varchar(20));

create or replace type addr_tab is table of addr_obj;

create or replace type contact_arr is varray(3) of number(10);

create table customer
(custid number(4) primary key,
custname varchar(20),
contact_num contact_arr,
custaddr addr_tab)
nested table custaddr store as c_addr;

select * from customer;
select * from table(select custaddr from customer where custid = 11);

insert into customer values(12, 'ramesh', contact_arr(123,456,789), 
addr_tab(addr_obj('FC', 'Pune', 1111),
  addr_obj('Link', 'mmb', 222)));

insert into customer values(11, 'BATMAN', contact_arr(122,455,788), 
addr_tab(addr_obj('Street Anenue', 'GOTHAM', 1222),
  addr_obj('Wall Street', 'GOTHAM', 2333)));

select c.custid, c.custname, con.*, cadd.*
from customer c,
table(select contact_num from customer where custid = 11) con,
table(select custaddr from customer where custid = 12) cadd
where c.custid = 11;

