select * from t_1378_1;
select * from t_1378_2;

select unique_id, name
from t_1378_1 
left join t_1378_2
using (id)
order by name;