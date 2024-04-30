select * from activity1;

insert into activity1 values(1,2,"2016-03-01",5),(1,2,"2016-05-02",6),(1,3,"2017-06-25",1),(3,1,"2016-03-02",0),(3,4,"2018-07-03",5);

select Player_id,event_date ,sum(games_played) over(partition by player_id order by event_date) as R from activity1 order by player_id,event_date;

