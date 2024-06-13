select * from t_1607_1;
select * from t_1607_2;
select * from t_1607_3;

select B.seller_name
from t_1607_2 B
where seller_id not in (select seller_id 
						from t_1607_3
						where date_format(sale_date,"%Y") in ("2020"));