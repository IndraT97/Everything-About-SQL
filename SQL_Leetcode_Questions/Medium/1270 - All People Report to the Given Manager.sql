select * from t_1270;

select A.employee_id from t_1270 A
left join t_1270 B
on A.manager_id = B.employee_id 
left join t_1270 C 
on B.manager_id = C.employee_id 
where C.manager_id = 1 and C.manager_id <> A.employee_id;