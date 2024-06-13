select * from t_1587_1;
select * from t_1587_2;

select * from(
select name,sum(amount) as balance
from t_1587_2 A
left join t_1587_1 B
using (account)
group by name) A
where balance > 10000;
