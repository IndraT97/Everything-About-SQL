select * from t_1501_1;
select * from t_1501_2;
select * from t_1501_3;

with CTE as (
	select country,duration from 
	(select caller_id, duration
	from t_1501_3
	union all
	select callee_id, duration
	from t_1501_3) t1
	left join
		(select A.id,B.name as country 
		from t_1501_1 A
		left join t_1501_2 B
		on substring(phone_number,1,3) = country_code) t2 
		on t1.caller_id = t2.id)
    
select country 
from CTE
group by country
having avg(duration) > 
(select avg(duration)
from CTE);
