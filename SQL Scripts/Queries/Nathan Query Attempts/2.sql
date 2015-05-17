SELECT iteration_id, SUM(pbi_effort)
FROM backlog_items
where pbi_effort > 0
and pbi_effort is not null
and iteration_id is not null
group by iteration_id