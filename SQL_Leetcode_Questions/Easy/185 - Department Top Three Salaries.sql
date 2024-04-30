use practise_set;
create table employee3(id int,name varchar(50),Salary int,DepartmentID int);
insert into employee3 values(1,"Joe",70000,1),(2,"Jim",90000,1),(3,"Henry",80000,2),(4,"Sam",60000,2),(5,"Max",90000,1),(6,"Randy",85000,1),(7,"Will",7000,1);
select * from employee3;
select * from dept;

-- Below code won't give the three heighest salary
select name ,salary,A from (select name,(salary),(row_number() over(partition by name order by salary desc )) as A from (select d.name,(e.salary) from employee3 e left join dept d on e.departmentID=d.id) as T1 
order by name,salary desc) as T2 where A < 4;

# Below code 
select * from (select d.name as Employee ,e.name,e.salary,dense_rank() over(partition by d.name order by salary desc) as Ranks from employee3 e left join dept d on e.departmentID=d.id 
order by d.name,salary desc) as T1 where ranks < 4;

