insert into Employee 
  values(1,100),
  (2,200),
  (3,300),
  (4,400),
  (5,1200),
  (8,1500);

-- 2nd heighest salary - Query

select min(salary) as SecondHeighestSalary 
  from (select distinct(salary) 
        from employee 
        order by salary desc limit 2) as t1;

-- Nth_Highest_Salary - Stored Procedure 

delimiter &&
create procedure Nth_Highest_Salary(IN Sal int)
begin
select min(Salary) as Salary 
  from (select distinct(Salary) 
  from Employee 
  order by salary desc limit Sal) as t1;
end 
&& delimiter ;

select * from Employee;
call Nth_highest_salary(5);
