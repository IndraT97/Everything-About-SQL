select replace("  Indra j e e t"," ",'') as A;

select * from t_1543;

select lower(replace(product_name," ","")) product_name,date_format(sale_date,"%Y-%m") sale_date, count(lower(replace(product_name," ",""))) As Ct 
from t_1543
group by lower(replace(product_name," ","")), date_format(sale_date,"%Y-%M")
order by Ct desc;
