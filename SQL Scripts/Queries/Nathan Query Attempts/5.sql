SELECT
(SELECT SUM(pbi_effort)
FROM backlog_items) - 
(SELECT SUM(pbi_effort)
FROM backlog_items
WHERE state_id = 4) as 'Remaining Effort'