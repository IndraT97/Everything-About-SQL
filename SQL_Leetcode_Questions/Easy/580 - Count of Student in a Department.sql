insert into student values(1,"Jack","M",1),(2,"Jane","F",1),(3,"mark","M",2);
insert into Department1 values(1,"Engineering"),(2,"Science"),(3,"Law");

select * from Department1;
select * from student;

select dept_name,ifnull(count(student_id),0) from student s right join Department1 d using (Dept_id) group by dept_name;
