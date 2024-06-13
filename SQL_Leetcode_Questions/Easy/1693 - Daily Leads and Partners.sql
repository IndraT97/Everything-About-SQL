select * from t_1693;

select date_id, make_name, count(distinct(lead_id)) lead_id, count(distinct(partner_id)) partner_id
from t_1693
group by date_id, make_name
order by make_name desc, date_id desc;