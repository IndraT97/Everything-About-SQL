with T1 as (
select user_id,name, count(rating) counts
from t_1341_3
left join t_1341_2
using (user_id)
group by user_id
order by name, counts desc
limit 1) ,

T2 as (select movie_id,title, avg(rating) as rating 
from t_1341_3 
left join t_1341_1 
using (movie_id)
where DATE_FORMAT(created_at,'%Y-%m') in ("2020-02")
group by movie_id
order by rating desc
limit 1) 

select name as results 
from T1
union 
select title 
from T2;