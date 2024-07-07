with CTE as (
select *, row_number() over(order by id) as A # lag(id,1) over(order by id), lead(id,1) over(order by id) 
from t_601
where people > 100)
select * from CTE
where id - A = 2;