insert into customers 
  values(1,"Joe"),
  (2,"Henry"),
  (3,"Sam"),
  (4,"Max");

insert into orders values(1,3),
  (2,1);

select name from 
customers 
where ID not in (select c.ID 
                  from customers c 
                  right join orders o 
                  on c.id = o.customerid);

