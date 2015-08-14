CREATE TABLE backlog_items_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
pbi_id INT(10),
new_pbi_id INT(10),
pbi_title VARCHAR(100),
new_pbi_title VARCHAR(100),
pbi_description VARCHAR(300),
new_pbi_description VARCHAR(300),
pbi_effort INT(10),
new_pbi_effort INT(10),
priority_id INT(10),
new_priority_id INT(10),
state_id INT(10),
new_state_id INT(10),
iteration_id INT(10),
new_iteration_id INT(10),
project_id INT(10),
new_project_id INT(10) 
);

CREATE TRIGGER pbi_insert_trigger
BEFORE INSERT ON backlog_items
FOR EACH ROW
INSERT INTO backlog_items_audit
(audit_user, audit_action, pbi_id, pbi_title, pbi_description, pbi_effort, priority_id, state_id, iteration_id, project_id)
VALUES
(CURRENT_USER(), 'Insert', NEW.pbi_id, NEW.pbi_title, NEW.pbi_description, NEW.pbi_effort, NEW.priority_id, NEW.state_id, NEW.iteration_id, NEW.project_id);

CREATE TRIGGER pbi_update_trigger
BEFORE UPDATE ON backlog_items
FOR EACH ROW
INSERT INTO backlog_items_audit
(audit_user, audit_action, pbi_id, new_pbi_id, pbi_title, new_pbi_title, pbi_description, new_pbi_description, pbi_effort, new_pbi_effort, priority_id, new_priority_id, state_id, new_state_id, iteration_id, new_iteration_id, project_id, new_project_id)
VALUES
(CURRENT_USER(), 'Update', OLD.pbi_id, NEW.pbi_id, OLD.pbi_title, NEW.pbi_title, OLD.pbi_description, NEW.pbi_description, OLD.pbi_effort, NEW.pbi_effort, OLD.priority_id, NEW.priority_id, OLD.state_id, NEW.state_id, OLD.iteration_id, NEW.iteration_id, OLD.project_id, NEW.project_id);

CREATE TRIGGER pbi_delete_trigger
BEFORE DELETE ON backlog_items
FOR EACH ROW
INSERT INTO backlog_items_audit
(audit_user, audit_action, pbi_id, pbi_title, pbi_description, pbi_effort, priority_id, state_id, iteration_id, project_id)
VALUES
(CURRENT_USER(), 'Delete', OLD.pbi_id, OLD.pbi_title, OLD.pbi_description, OLD.pbi_effort, OLD.priority_id, OLD.state_id, OLD.iteration_id, OLD.project_id);