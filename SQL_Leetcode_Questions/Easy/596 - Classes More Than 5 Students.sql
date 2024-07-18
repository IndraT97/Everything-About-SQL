select * 
from t_1107
where activity_date >= DATE_ADD('2019-06-30', INTERVAL -90 DAY);

select * 
from t_1107;

select login_date, count(user_id) as id from (
SELECT user_id, MIN(activity_date) AS login_date
    FROM t_1107
    WHERE activity = 'login'
    GROUP BY user_id) A 
where login_date >= DATE_ADD('2019-06-30', INTERVAL -90 DAY)
group by login_date;

select *, (ifnull(extra,0) / post_id) * 100 Percentage from (
select action_date, count(post_id) post_id 
from t_1132
group by action_date) a
left join(
select action_date, ifnull(count(extra),0) as extra 
from t_1132
where extra in ('spam')
group by action_date) B
using(action_date);

select * from t_1149;

select viewer_id 
from t_1149
where viewer_id in (
select viewer_id
from t_1149
group by view_date
having count(viewer_id) > 1)
group by viewer_id
having count(distinct(article_id)) > 1;

select * from 
(select distinct(product_id) product_id, new_price, max(change_date) change_date
from t_1164
group by product_id) a left join (
select product_id, max(change_date) change_date
from t_1164
where change_date <= '2019-08-16'
group by product_id) b
on a.product_id = b.product_id and a.change_date = b.change_date;

select * from t_1280_1;
select * from t_1280_2;
select * from t_1280_3;


select * 
from t_1280_1
join t_1280_2;

select question_id, round(avg(case when action in ('answer') then 1 else 0 end),1) as avgrate
from t_578
group by question_id
order by avgrate desc
limit 1;

#601

with CTE as (
select *, id - row_number() over(order by id) diff
from t_601
where people >= 100)
select * from CTE
where diff in (
select diff 
from CTE
group by diff
having count(diff)>= 3) ;

# 603

with CTE as (
select *, seat_id - row_number() over(order by seat_id) diff
from t_603
where free != 0)
select * 
from CTE
where diff in (select diff 
			   from CTE 
               group by diff
               having count(diff)>=3);
               
# 615

select * from t_615_1;
select * from t_615_2;

select pay_date, department_id,case
	when amount > Avg_amount then "Higher"
    when amount < Avg_amount then "Lower"
    when amount = Avg_amount then "Same"
    END AS Comparison
from t_615_2 A
left join t_615_1 B
using(employee_id)
join (select round(avg(amount),2) Avg_amount
		from t_615_2) C
Group by pay_date, department_id;

# 626

select * from t_626;
select IF(id<(SELECT MAX(id) FROM t_626),IF(id%2=0,id-1, id+1),id) new_id, student 
from t_626
order by new_id;

select project_id
from t_1076_1
group by project_id
order by count(employee_id) desc
limit 1;

#1077

select *
from t_1076_1 A
left join t_1076_2 B
using(employee_id)
group by project_id
having max(experience_years);

# 1083

select * from t_1082_1;
select * from t_1082_2;

select * 
from t_1082_2 A
left join t_1082_1 B
using(product_id)
where product_name in ("S8");


select action_date, avg(case when extra in ('spam') then 1 else 0 end) ABC
from t_1132
group by action_date;

select count(distinct(session_id)) / count(distinct(user_id)) from t_1142
where activity_type in ('open_session') and activity_date > date_sub("2019-07-27",INTERVAL 30 DAY);

select * from t_1149;

select A.viewer_id from (
select viewer_id, min(view_date) view_date, article_id 
from t_1149
group by viewer_id) A
left join t_1149 B
on A.viewer_id = B.viewer_id and A.view_date = B.view_date and A.article_id != B.article_id
where B.article_id is not null;

with cte as (
select *,"Failed"
from t_1225_1
where fail_date between "2019-01-01" and "2019-12-31"
union all 
select *,"Succeeded" 
from t_1225_2
where success_date between "2019-01-01" and "2019-12-31"
order by 1)

SELECT *, date_sub(success_date, interval ROW_NUMBER() OVER(ORDER BY success_date) day) AS diff, 1 AS state
FROM t_1225_2
WHERE success_date BETWEEN "2019-01-01" AND "2019-12-31";

select * 
from t_1355_2;


select activity, count(id) CT
from t_1355_2
group by activity;

with CTE as (
select * from (
select *, 
dense_rank() over(partition by username order by startDate) ABC from t_1369) t1
where ABC <3
order by username, ABC desc)
select username, activity
from CTE
where (username , ABC) in (select username, max(ABC) 
							from CTE
                            group by username);
                            

# t_1378

select * 
from t_1378_1 A;

select name, unique_id
from t_1378_1 B
left join t_1378_2 A
using(id)
order by unique_id;

# t_1412_2

select * from t_1412_2;

select PT, (sum(AMT) + B.credit) Final_AMT
from (
select paid_by as PT, -(amount) AMT
from t_1555_2
union all
select paid_to as PT, (amount) AMT
from t_1555_2
order by PT) A
left join
t_1555_1 B on A.PT = B.user_id
group by PT;


select * from t_1581_1;
select * from t_1581_2;

select customer_id, count(visit_id) from t_1581_1
where visit_id not in (select distinct(visit_id)
						from t_1581_2)
group by customer_id;

# t_1596

select * from t_1596_1;
select * from t_1596_2;

with cte as (
select customer_id, product_id , count(product_id) CT
from t_1596_2
group by customer_id, product_id
order by customer_id, CT desc)
select * from cte
where (customer_id , CT) in (select customer_id, max(CT) CT 
							from cte
                            group by customer_id);






select exam_id, max(score) score
from t_1412_2
group by exam_id
union 
select exam_id, min(score) score
from t_1412_2
group by exam_id
order by exam_id;


select distinct(student_id) student_id
from t_1412_2
group by student_id
having count(exam_id) >= 1;

