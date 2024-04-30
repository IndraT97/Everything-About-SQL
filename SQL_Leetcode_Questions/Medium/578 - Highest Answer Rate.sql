insert into survey_log values(5,"show",285,null),(5,"answer",285,124124),(5,"show",369,null),(5,"skip",369,null);
select * from survey_log;

SELECT question_id AS survey_log from
(SELECT question_id,
        SUM(IF(action='show', 1, 0)) AS num_show,
        SUM(IF(action='answer', 1, 0)) AS num_answer
 FROM survey_log GROUP BY question_id) as t
 order by (num_answer/num_show) DESC LIMIT 1;
 
 select question_id ,count(question_id) as Answer_rate from 
 (select question_id ,action from survey_log where action = "answer") as t1 
 group by question_id order by Answer_rate desc limit 1;
