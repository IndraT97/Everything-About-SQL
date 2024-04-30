insert into person1 values(1,"ABCD"),(2,"BCD"),(3,"ABCD");
select * from person1;
select email,count(email) as c from person1 group by email having c > 1; 
