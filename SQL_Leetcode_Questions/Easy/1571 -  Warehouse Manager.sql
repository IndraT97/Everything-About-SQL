select * from t_1571_1;
select * from t_1571_2;

select name,sum(Width * Length * Height * units) as volume
from t_1571_2
left join t_1571_1
using(product_id)
group by name
order by Volume desc;




