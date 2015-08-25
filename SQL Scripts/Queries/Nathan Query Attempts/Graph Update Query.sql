SELECT a.iteration_id 'Sprint ID', 
a.iteration_name 'Sprint Name', 
a.starting_effort 'Starting Effort', 
IFNULL((SELECT sum(pbi_effort) 
FROM backlog_items 
WHERE iteration_id <= a.iteration_id
AND state_id = 4),0) 'Effort Done To Date',
a.starting_effort - IFNULL((SELECT sum(pbi_effort) 
FROM backlog_items 
WHERE iteration_id <= a.iteration_id
AND state_id = 4),0) 'Remaining Effort'
FROM iteration a left outer join backlog_items b on a.iteration_id = b.iteration_id
where b.pbi_effort IS NOT NULL
AND a.iteration_start_date < CURDATE()
GROUP BY a.iteration_id
Order by a.iteration_id

i = a

b = b