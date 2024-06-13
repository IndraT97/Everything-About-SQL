with CTE as (
select user2_id from t_1264_1
where user1_id = 1
union 
select user1_id from t_1264_1
where user2_id = 1)
select distinct(page_id) from CTE A
left join t_1264_2 B
on A.user2_id = B.user_id 
where page_id not in (select page_id from t_1264_2
						where user_id = 1)
order by page_id ;