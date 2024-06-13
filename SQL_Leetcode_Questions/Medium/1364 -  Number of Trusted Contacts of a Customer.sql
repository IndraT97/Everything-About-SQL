select * from t_1364_1;
select * from t_1364_2;
select * from t_1364_3;

with CTE as (
select invoice_id, price ,customer_name, c.user_id, c.contact_email,
(case when contact_email in (select email from t_1364_1) then 1 Else 0 END) trusted_contacts_cnt
from t_1364_3 A
left join t_1364_1 B
on A.user_id = B.customer_id
left join  t_1364_2 C
on B.customer_id = c.user_id)
select invoice_id, customer_name, price, count(contact_email) as contacts_cnt , sum(trusted_contacts_cnt) as trusted_contacts_cnt
from CTE
group by customer_name,price;
                        