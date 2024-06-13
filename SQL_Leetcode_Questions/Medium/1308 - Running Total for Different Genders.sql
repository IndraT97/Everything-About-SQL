select gender, day, sum(score_points) over(partition by gender order by day) total
from t_1308
order by gender;