SELECT
iteration_name,
SUM(pbi_effort) as 'Total Effort'
FROM iteration, backlog_items
WHERE iteration.iteration_id = backlog_items.iteration_id
AND pbi_effort > 0
GROUP BY iteration_name

