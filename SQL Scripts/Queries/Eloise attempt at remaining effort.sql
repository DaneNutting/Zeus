SELECT b.iteration_id AS  'Sprint', 
a.iteration_name AS 'Iteration Name',
a.starting_effort AS 'Starting Effort',
SUM( pbi_effort ) AS  'Effort Done',
(a.starting_effort-SUM(pbi_effort)) AS 'Remaining Effort'
FROM backlog_items b, iteration a
WHERE a.iteration_id = b.iteration_id
AND b.state_id =4
AND b.iteration_id IS NOT NULL 
AND b.iteration_id >0
GROUP BY b.iteration_id

