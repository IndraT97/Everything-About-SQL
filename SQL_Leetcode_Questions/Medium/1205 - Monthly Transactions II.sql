select A.month,A.country,chargeback_count,chargeback_amount,ifnull(approved_count,0) approved_count,ifnull(approved_amount,0) approved_amount
from  (
select DATE_FORMAT(B.trans_date,'%Y-%m') AS month, country, 
sum(if(country = "US",1,0)) chargeback_count ,
sum(if(country = "US",amount,0)) chargeback_amount
from t_1205_2 A 
left join t_1205_1 B
on A.id = B.trans_id
where B.trans_date is not null
group by DATE_FORMAT(B.trans_date,'%Y-%m'), country) A

left join

(select DATE_FORMAT(A.trans_date,'%Y-%m') AS month, country, 
ifnull(sum(if(state = "approved",1,0)),0) approved_count,
ifnull(sum(if(state = "approved",amount,0)),0) approved_amount
from t_1205_2 A 
left join t_1205_1 B
on A.id = B.trans_id
group by DATE_FORMAT(A.trans_date,'%Y-%m'), country) B
using (month);