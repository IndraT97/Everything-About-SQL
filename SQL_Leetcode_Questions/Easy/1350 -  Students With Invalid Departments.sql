select * from t_1350_1;
select * from t_1350_2;

select id, name 
from t_1350_2
where department_id not in (select id 
						from t_1350_1)
                        
                        
                        
                        
                        