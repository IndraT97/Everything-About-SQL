select * from t_2084
where (customer_id,order_type) not in (
		select customer_id, 1 as order_type 
		from t_2084
		where order_type = 0)
order by order_type desc;