select A1.product_id, ifnull(B1.new_price,10) as new_price 
from t_1164 as A1
left join (
select product_id, max(change_date) as change_date, new_price
from (
select all product_id, change_date, new_price
from t_1164
group by product_id, change_date 
having change_date <= "2019-08-16"
order by product_id, new_price desc) A
group by product_id) B1
on A1.product_id = B1.product_id
group by product_id;
