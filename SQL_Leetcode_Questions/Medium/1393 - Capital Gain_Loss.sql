select * from t_1393;

select stock_name, (sum(if(operation = 'Sell',price,0)) - sum(if(operation = 'Buy', price,0))) as capital_gain_loss 
from t_1393
group by stock_name
order by capital_gain_loss desc;
