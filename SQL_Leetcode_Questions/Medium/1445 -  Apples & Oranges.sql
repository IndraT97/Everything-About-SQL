with dataa as (
select a.sale_date, a.fruit,a.sold_num,b.sold_num as orange_sold_num from sales a 
left join sales b
on a.sale_date = b.sale_date and b.fruit in ("oranges"))

select sale_date, (sold_num - orange_sold_num) as num 
from dataa
group by sale_date;

select sale_date, fruit, sold_num, 
lead(sold_num,1) over(partition by sale_date order by fruit) as A from sales;