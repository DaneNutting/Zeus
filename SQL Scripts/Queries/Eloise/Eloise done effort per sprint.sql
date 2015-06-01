SELECT
iteration_id as 'Sprint',
SUM(pbi_effort) as 'Effort Done'
FROM backlog_items  
WHERE state_id = 4
AND iteration_id IS NOT NULL
AND iteration_id > 0
GROUP BY iteration_id
 