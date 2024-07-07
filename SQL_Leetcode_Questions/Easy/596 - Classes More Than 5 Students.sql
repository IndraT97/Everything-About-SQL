select class, count(student) student
from t_596
group by class
order by student desc
limit 1;
 
