SELECT 
    country_name,
    CASE 
        WHEN AVG(weather_state) <= 15 THEN 'Cold' 
        WHEN AVG(weather_state) >= 25 THEN 'Hot' 
        ELSE 'Warm' 
    END AS temperature_category
FROM 
    t_1294_2 
    left join t_1294_1
    using (country_id)
WHERE 
    DATE_FORMAT(day, '%Y-%m') = '2019-11'
GROUP BY 
    country_id;