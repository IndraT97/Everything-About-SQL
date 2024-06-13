select post_id, ifnull(count(distinct(sub_id)),0) number_of_comments 
from (
	select distinct(sub_id) as post_id 
	from t_1241
	where parent_id is null) A
	left join t_1241 B 
	on A.post_id = B.parent_id
group by post_id
order by number_of_comments desc;