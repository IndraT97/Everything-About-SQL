select * from t_1454_1;
select * from t_1454_2;


with CTE as (
select *, dense_rank() over(partition by id order by login_date) RK
 from t_1454_2
 left join t_1454_1
 using(id))
 select id,name 
 from CTE 
 where RK >= 5
 group by 1;