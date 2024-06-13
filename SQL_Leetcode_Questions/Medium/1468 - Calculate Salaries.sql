select * from t_1468;


select A.company_id, A.employee_id, A.employee_name,
	case 
		when mS < 1000 then round(1 * A.salary,0)
		when mS >= 1000 and mS <= 10000 then round(0.76 * A.salary,0)
		when mS > 10000 then round(0.51 * A.salary,0)
		else "check" END as New_Salary
 from t_1468 A
 left join(
	select company_id,
	max(salary) mS
	from t_1468
	group by company_id) B
 using (company_id);