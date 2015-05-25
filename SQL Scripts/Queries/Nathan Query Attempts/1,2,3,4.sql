SELECT b.iteration_id, i.iteration_name, i.starting_effort, SUM(b.pbi_effort) AS 'Effort Done', 
(SELECT sum(pbi_effort) FROM backlog_items 
WHERE iteration_id <= i.iteration_id
AND state_id = 4) 'effort_to_date'
FROM iteration i, backlog_items b
WHERE i.iteration_id = b.iteration_id
AND b.pbi_effort > 0
AND b.pbi_effort IS NOT NULL
AND i.iteration_id IS NOT NULL
AND b.state_id = 4
GROUP BY b.iteration_id

