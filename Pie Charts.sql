/* Pie Chart 1 */
/* Hard Coded */
SELECT (IFNULL(n.numerator,0)/d.denominator) * 100 percent_done, 
100 - ((IFNULL(n.numerator,0)/d.denominator) * 100) percent_remaining
FROM (SELECT b.iteration_id, IFNULL(SUM(a.pbi_effort),1) denominator 
        FROM backlog_items a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.project_id = 1) d
LEFT OUTER JOIN 
       (SELECT b.iteration_id, SUM(a.pbi_effort) numerator
        FROM backlog_items a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.state_id = 4
        AND a.project_id = 1) n
ON d.iteration_id = n.iteration_id;

/* Pie Chart 1 */
/* Dynamic */
SELECT (IFNULL(n.numerator,0)/d.denominator) * 100 percent_done, 
100 - ((IFNULL(n.numerator,0)/d.denominator) * 100) percent_remaining
FROM (SELECT b.iteration_id, IFNULL(SUM(a.pbi_effort),1) denominator 
        FROM backlog_items a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') d
LEFT OUTER JOIN 
       (SELECT b.iteration_id, SUM(a.pbi_effort) numerator
        FROM backlog_items a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.state_id = 4
        AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') n
ON d.iteration_id = n.iteration_id;

/* Pie Chart 2 */
/* Hard-Coded */
SELECT (IFNULL(n.numerator,0)/d.denominator) * 100 percent_done, 
100 - ((IFNULL(n.numerator,0)/d.denominator) * 100) percent_remaining
FROM (SELECT b.iteration_id, IFNULL(SUM(a.task_estimated_duration),1) denominator 
        FROM task a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.project_id = 1) d
LEFT OUTER JOIN 
       (SELECT b.iteration_id, SUM(a.task_hours_done) numerator
        FROM task a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.state_id = 10
        AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') n
ON d.iteration_id = n.iteration_id;

/* Dynamic */
SELECT (IFNULL(n.numerator,0)/d.denominator) * 100 percent_done, 
100 - ((IFNULL(n.numerator,0)/d.denominator) * 100) percent_remaining
FROM (SELECT b.iteration_id, IFNULL(SUM(a.task_estimated_duration),1) denominator 
        FROM task a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.project_id = 1) d
LEFT OUTER JOIN 
       (SELECT b.iteration_id, SUM(a.task_hours_done) numerator
        FROM task a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.state_id = 10
        AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') n
ON d.iteration_id = n.iteration_id;

/* Pie Chart 3 */
/* Hard Coded */
SELECT (IFNULL(n.numerator,0)/d.denominator) * 100 percent_done, 
100 - ((IFNULL(n.numerator,0)/d.denominator) * 100) percent_remaining
FROM (SELECT b.iteration_id, IFNULL(SUM(a.task_hours_done),1) denominator 
        FROM task a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.assignee = 3
        AND a.project_id = 1) d
LEFT OUTER JOIN 
       (SELECT b.iteration_id, SUM(a.task_hours_done) numerator
        FROM task a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.state_id = 10
        AND a.assignee = 3
        AND a.project_id = 1) n
ON d.iteration_id = n.iteration_id;

/* Dynamic */
SELECT (IFNULL(n.numerator,0)/d.denominator) * 100 percent_done, 
100 - ((IFNULL(n.numerator,0)/d.denominator) * 100) percent_remaining
FROM (SELECT b.iteration_id, IFNULL(SUM(a.task_hours_done),1) denominator 
        FROM task a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.assignee = '".$_SESSION['SESS_USER_ID']."'
        AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') d
LEFT OUTER JOIN 
       (SELECT b.iteration_id, SUM(a.task_hours_done) numerator
        FROM task a
        INNER JOIN iteration b
        ON b.iteration_id = a.iteration_id
        WHERE b.iteration_start_date <= CURDATE()
        AND b.iteration_end_date >= CURDATE()
        AND a.state_id = 10
        AND a.assignee = '".$_SESSION['SESS_USER_ID']."'
        AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') n
ON d.iteration_id = n.iteration_id;