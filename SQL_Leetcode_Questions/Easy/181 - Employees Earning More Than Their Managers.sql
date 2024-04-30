insert into Employee1 
values (1,"joe",7000,"3"),
        (2,"henry",80000,4),
        (3,"Sam",60000,NULL),
        (4,"MAX",90000,NULL);

----
select distinct(a.Name) from t_181 a
left join t_181 b
on a.managerid = b.id
where a.salary > b.salary;
