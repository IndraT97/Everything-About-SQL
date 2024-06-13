select * from t_1495_1;
select * from t_1495_2;

select distinct(title) 
from t_1495_1
left join t_1495_2
using (content_id)
where Kids_content in ("Y") and date_format(program_date,  "%Y-%m" ) = "2020-06";