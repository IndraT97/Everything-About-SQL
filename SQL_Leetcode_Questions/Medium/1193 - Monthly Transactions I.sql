select DATE_FORMAT(trans_date,'%Y-%m') AS month, country,count(distinct(id)) as trans_count, 
sum(amount) trans_total_amount,
sum(if(state = "approved",1,0)) approved_count,
sum(if(state = "approved",amount,0)) approved_total_amount
from t_1193
group by month(trans_date), country
order by country desc, trans_total_amount desc;