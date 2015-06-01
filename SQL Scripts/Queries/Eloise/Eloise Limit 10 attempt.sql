SELECT b.iteration_id AS  'Sprint',
       a.iteration_name AS 'Iteration Name',
	   SUM(b.pbi_effort) as 'Total Effort',
       a.starting_effort AS 'Starting Effort',
       (SELECT SUM(pbi_effort ) FROM backlog_items WHERE state_id = 4 AND iteration_id <= b.iteration_id) AS 'Effort Done',
       (a.starting_effort - (SELECT SUM(pbi_effort)FROM backlog_items WHERE state_id = 4 AND iteration_id <= b.iteration_id)) AS 'Remaining Effort'
FROM backlog_items b, iteration a
WHERE a.iteration_id = b.iteration_id
     AND b.iteration_id IS NOT NULL
       AND b.iteration_id >0
       AND a.iteration_start_date < SYSDATE()
      GROUP BY b.iteration_id
      ORDER BY a.iteration_start_date
      LIMIT 10