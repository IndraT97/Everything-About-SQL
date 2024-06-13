select * from t_1549_1;
select * from t_1549_2;
select * from t_1549_3;

select * from (
select product_name,product_id,order_id,order_date, dense_rank() over(partition by product_id order by product_id, order_date desc) as RK
from t_1549_3
left join t_1549_2 
using(product_id)
left join t_1549_1 
using (customer_id)) A 
where RK = 1;