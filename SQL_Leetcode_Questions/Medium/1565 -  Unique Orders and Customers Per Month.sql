select date_format(order_date,"%Y-%m") as Month, count(distinct(customer_id)) customer_count , count(distinct(order_id)) order_count 
from t_1565
where invoice > 20
group by date_format(order_date,"%Y-%m");
