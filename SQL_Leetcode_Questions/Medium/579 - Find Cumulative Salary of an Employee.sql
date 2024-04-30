insert into employee4 
  values(1,1,20),
  (2,1,20),
  (1,2,30),
  (2,2,30),
  (3,2,40),
  (1,3,40),
  (3,3,60),
  (1,4,60),
  (3,4,70);

select *,sum(salary) over(partition by id order by month) 
  from employee4 
  where (id,month) not in (select id , max(month) 
                           from employee4 
                           group by id);

