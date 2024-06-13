select * from t_1511_1;
select * from t_1511_2;
select * from t_1511_3;

with CTE as (
	select name,customer_id, date_format(order_date,"%Y-%m") Month_year,sum(price*quantity) total_price
	from t_1511_3 A
	left join t_1511_2 B
	using(product_id)
	left join t_1511_1 C
	using(customer_id)
	where date_format(order_date,'%Y-%m') in ("2020-06","2020-07")
	group by name, date_format(order_date,"%Y-%m"))
select name
from CTE 
where total_price >= 100
group by name
having count(name) >= 2;
