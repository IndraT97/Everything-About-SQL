# Solution 1 

select player_id,device_id 
FROM (select player_id,device_id,min(event_date) 
      from activity 
      group by player_id) as T1;

# Solution 2

SELECT a.player_id, b.device_id
FROM
      (SELECT player_id, MIN(event_date) AS event_date 
      FROM Activity
      GROUP BY player_id) a
            JOIN Activity b
            ON a.player_id = b.player_id 
            AND a.event_date = b.event_date;
