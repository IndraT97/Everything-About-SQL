select * from t_1731;

select A.employee_id, A.name, count(B.employee_id) reports_count,round(avg(age),0) age
from (
	select distinct(employee_id) , name 
	from t_1731 
	where reports_to is null) A
left join t_1731 B
on A.employee_id = B.reports_to
where age is not null;