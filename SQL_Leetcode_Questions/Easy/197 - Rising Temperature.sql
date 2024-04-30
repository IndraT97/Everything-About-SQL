insert into weather values(1,"2015-01-01",10),(2,"2015-01-02",25),(3,"2015-01-03",20),(4,"2015-01-04",30);
select * from weather;


select w2.id from weather w1 join weather w2 on datediff(w2.recorddate,w1.recorddate) = 1 and w2.temperature > w1.temperature; 

