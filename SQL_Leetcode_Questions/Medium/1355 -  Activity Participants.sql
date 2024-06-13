select * from t_1355_1;
select * from t_1355_2;

select activity, count(activity) as counts
from t_1355_2 
group by activity
order by counts
limit 1,1;
                        
                        
                        
                        
                        