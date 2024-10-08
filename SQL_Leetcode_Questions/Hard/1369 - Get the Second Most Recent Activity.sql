select * from t_1369;

with CTE as (
	select A.username,(case when count(RN) > 1 then 2 else 1 END) selection 
	from t_1369 A
	left join 
		(select *,row_number() over(partition by username order by startdate) as RN
		from t_1369) B
		using (username)
		group by username)
select t1.username, activity, startdate, enddate 
from CTE t1
left join 
	(select *,row_number() over(partition by username order by startdate) as RN
	from t_1369) t2
	on t1.selection = t2.RN and t1.username = t2.username;
    
    
# Query 2
    
with CTE as (
select * from (
select *, 
dense_rank() over(partition by username order by startDate) ABC from t_1369) t1
where ABC <3
order by username, ABC desc)
select username, activity
from CTE
where (username , ABC) in (select username, max(ABC) 
							from CTE
                            group by username);