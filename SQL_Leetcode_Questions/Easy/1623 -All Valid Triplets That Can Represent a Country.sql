select * from t_1623_1;
select * from t_1623_2;
select * from t_1623_3;

select Astudent_name,Bstudent_name,student_name from (
select A.student_id as Astudent_id, A.student_name as Astudent_name ,B.student_id as Bstudent_id, B.student_name as Bstudent_name
from t_1623_3 A
join t_1623_2 B
where A.student_id != B.student_id and A.student_name != B.student_name ) C
join t_1623_3 C
where Astudent_id != Bstudent_id and Astudent_id != C.student_id and Bstudent_id != C.student_id
and Astudent_name != Bstudent_name and Astudent_name != C.student_name and Bstudent_name != C.student_name;

