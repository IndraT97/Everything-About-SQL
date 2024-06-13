select * from t_1677_1;
select * from t_1677_2;


select name, sum(rest) rest, sum(paid) paid, sum(canceled) canceled, sum(refunded) refunded  
from t_1677_2 A
left join t_1677_1 B
using(product_id)
group by name;