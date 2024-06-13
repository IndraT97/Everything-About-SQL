select * from t_1596_1;
select * from t_1596_2;
select * from t_1596_3;

with CTE as (
select *, count(product_id) as CT
from t_1596_2 A
left join t_1596_1 B
using(customer_id)
left join t_1596_3 C
using(product_id)
group by customer_id, product_id
having count(product_id)
order by customer_id,CT desc) 
select customer_id, product_name ,product_name
from CTE
where (customer_id, CT) in (select customer_id, max(CT) CT
							from CTE
							group by name);