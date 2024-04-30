with CTE as (
select *,
Lag(num,2) over(order by id) as previous_number2,
lag(num,1) over(order by id) as previous_number,
Lead(num,1) over(order by id) as next_number,
Lead(num,2) over(order by id) as next_number2
from t_180)

select distinct(num) 
from CTE
where (num = previous_number and num = previous_number2)
or (num = previous_number and num = next_number)
or (num = next_number and num = next_number2) ;
