SELECT b.iteration_id 'Sprint ID', 
i.iteration_name 'Sprint Name', 
i.starting_effort 'Starting Effort', 
SUM(b.pbi_effort) AS 'Effort Done', 
(SELECT sum(pbi_effort) 
FROM backlog_items 
WHERE iteration_id <= i.iteration_id
AND state_id = 4) 'Effort Done To Date',
i.starting_effort - (SELECT sum(pbi_effort) 
FROM backlog_items 
WHERE iteration_id <= i.iteration_id
AND state_id = 4) 'Remaining Effort'
FROM iteration i, backlog_items b
WHERE i.iteration_id = b.iteration_id
AND b.pbi_effort IS NOT NULL
AND i.iteration_id IS NOT NULL
AND b.state_id = 4
AND i.iteration_id > (SELECT MAX(iteration_id) - 7 
FROM iteration)
AND i.iteration_start_date < CURDATE()
GROUP BY b.iteration_id
Order by b.iteration_id