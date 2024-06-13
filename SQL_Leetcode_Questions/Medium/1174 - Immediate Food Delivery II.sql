select * from t_1174;
select *, round(sum(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)/count(DISTINCT customer_id)*100,2) ABC from (
select customer_id, min(order_date) order_date, min(customer_pref_delivery_date) customer_pref_delivery_date 
from t_1174
group by customer_id)A;