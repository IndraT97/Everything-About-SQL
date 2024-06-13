select *,round(avg(rating / position),3) quality,
round((sum(case when rating < 3 then 1 ELSE 0 END) / count(query_name)),2) poor_query_percentage 
from t_1211
group by query_name;