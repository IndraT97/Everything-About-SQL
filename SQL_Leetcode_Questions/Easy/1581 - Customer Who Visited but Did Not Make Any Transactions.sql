select * from t_1581_1;
select * from t_1581_2;

select customer_id, sum(ifnull(transaction_id,1)) count_no_trans
from t_1581_1 A 
left join t_1581_2 B
using (Visit_id)
where transaction_id is null
group by customer_id
order by count_no_trans desc;




