select * from t_1479_2;
select * from t_1479_1;

select all(A.item_category),
	sum(case when dayname(order_date) in ("Monday") then quantity else 0 end) Monday,
    sum(case when dayname(order_date) in ('Tuesday') then quantity else 0 end) Tuesday,
    sum(case when dayname(order_date) in ("Wednesday") then quantity else 0 end) Wednesday,
    sum(case when dayname(order_date) in ("Thursday") then quantity else 0 end) Thursday,
    sum(case when dayname(order_date) in ("Friday") then quantity else 0 end) Friday,
    sum(case when dayname(order_date) in ("Saturday") then quantity else 0 end) Saturday,
    sum(case when dayname(order_date) in ("Sunday") then quantity else 0 end) Sunday
from t_1479_2 A
left join t_1479_1 B
using (item_id)
group by A.item_category;