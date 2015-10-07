CREATE TABLE task_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
task_id INT(10),
new_task_id INT(10),
task_title VARCHAR(200),
new_task_title VARCHAR(200),
task_description VARCHAR(500),
new_task_description VARCHAR(500),
task_estimated_duration FLOAT ,
new_task_estimated_duration FLOAT ,
task_hours_done FLOAT ,
new_task_hours_done FLOAT ,
assignee INT(10),
new_assignee INT(10),
state_id INT(10),
new_state_id INT(10),
iteration_id INT(10),
new_iteration_id INT(10),
pbi_id INT(10),
new_pbi_id INT(10) 
);

CREATE TRIGGER task_insert_trigger
BEFORE INSERT ON task
FOR EACH ROW
INSERT INTO task_audit
(audit_user, audit_action, task_id, task_title, task_description, task_estimated_duration, task_hours_done, assignee, state_id, iteration_id, pbi_id)
VALUES
(CURRENT_USER(), 'Insert', NEW.task_id, NEW.task_title, NEW.task_description, NEW.task_estimated_duration, NEW.task_hours_done, NEW.assignee, NEW.state_id, NEW.iteration_id, NEW.pbi_id);

CREATE TRIGGER task_update_trigger
BEFORE UPDATE ON task
FOR EACH ROW
INSERT INTO task_audit
(audit_user, audit_action, task_id, new_task_id, task_title, new_task_title, task_description, new_task_description, task_estimated_duration, new_task_estimated_duration, task_hours_done, new_task_hours_done, assignee, new_assignee, state_id, new_state_id, iteration_id, new_iteration_id, pbi_id, new_pbi_id)
VALUES
(CURRENT_USER(), 'Update', OLD.task_id, NEW.task_id, OLD.task_title, NEW.task_title, OLD.task_description, NEW.task_description, OLD.task_estimated_duration, NEW.task_estimated_duration, OLD.task_hours_done, NEW.task_hours_done, OLD.assignee, NEW.assignee, OLD.state_id, NEW.state_id, OLD.iteration_id, NEW.iteration_id, OLD.pbi_id, NEW.pbi_id);

CREATE TRIGGER task_delete_trigger
BEFORE DELETE ON task
FOR EACH ROW
INSERT INTO task_audit
(audit_user, audit_action, task_id, task_title, task_description, task_estimated_duration, task_hours_done, assignee, state_id, iteration_id, pbi_id)
VALUES
(CURRENT_USER(), 'Delete', OLD.task_id, OLD.task_title, OLD.task_description, OLD.task_estimated_duration, OLD.task_hours_done, OLD.assignee, OLD.state_id, OLD.iteration_id, OLD.pbi_id);