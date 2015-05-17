SELECT iteration_id, SUM(pbi_effort) as 'effort done'
FROM backlog_items
WHERE state_id = 4
AND pbi_effort > 0
GROUP BY iteration_id