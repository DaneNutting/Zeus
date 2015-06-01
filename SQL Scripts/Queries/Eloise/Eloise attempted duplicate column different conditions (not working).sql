SELECT
iteration_name as 'Sprint',
(SELECT SUM(pbi_effort) FROM backlog_items WHERE state_id = 4) as 'Effort Done',
(SELECT SUM(pbi_effort) FROM backlog_items) as 'Total Sprint Effort'
FROM backlog_items, iteration
WHERE iteration.iteration_id = backlog_items.iteration_id
AND backlog_items.iteration_id is not null
AND backlog_items.iteration_id > 0
GROUP BY backlog_items.iteration_id

