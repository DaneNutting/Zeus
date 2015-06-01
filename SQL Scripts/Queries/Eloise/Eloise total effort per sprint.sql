SELECT   
iteration_id as 'Sprint',
SUM(pbi_effort) as 'Total Effort'
FROM backlog_items
WHERE iteration_id is not null
AND iteration_id > 0
GROUP BY iteration_id;  