select * from t_1445;

select sale_date, (sum(case when fruit = "apples" then sold_num else 0 END))- (sum(case when fruit = "oranges" then sold_num else 0 END)) diff
 from t_1445
 group by sale_date;
 
 
 ----
 with dataa as (
select a.sale_date, a.fruit,a.sold_num,b.sold_num as orange_sold_num 
from t_1445 a 
left join t_1445 b
on a.t_1445 = b.t_1445 and b.fruit in ("oranges"))

select sale_date, (sold_num - orange_sold_num) as num 
from dataa
group by sale_date;