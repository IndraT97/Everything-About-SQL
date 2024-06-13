select * from t_1398_1;
select * from t_1398_2;

select * from t_1398_2 
where customer_id not in (
select customer_id
from t_1398_2
where product_name in ("C"))
group by customer_id
having SUM(product_name = 'A') > 0 AND
	   SUM(product_name = 'B') > 0;



