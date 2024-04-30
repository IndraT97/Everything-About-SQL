use practise_set;
insert into scores 
  values(3.50),
  (3.65),
  (4.0),
  (3.85),
  (4.0),
  (3.65);


select Score,Dense_rank() over(order by Score desc) as test_rank 
from scores;




