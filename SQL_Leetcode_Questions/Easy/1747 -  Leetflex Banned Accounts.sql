select * from t_1747;

select A.account_id 
from t_1747 A
left join t_1747 B
on A.account_id = B.account_id and A.ip_address < B.ip_address
where B.account_id is not null and B.login <= A.logout;