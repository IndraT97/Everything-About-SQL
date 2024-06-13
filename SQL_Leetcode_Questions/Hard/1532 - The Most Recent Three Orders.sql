select * from t_1532_1;
select * from t_1532_2;

select name, customer_id, order_id, order_date 
from (
select *, dense_rank() over(partition by customer_id order by customer_id, order_date desc) as RK
from t_1532_2
left join t_1532_1
using (customer_id)) A 
where RK <= 3
order by name;
