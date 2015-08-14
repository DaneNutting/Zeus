CREATE TABLE project_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
project_id INT(10),
new_project_id INT(10),
project_name VARCHAR(100),
new_project_name VARCHAR(100),
project_description VARCHAR(200),
new_project_description VARCHAR(200),
project_deadline DATE ,
new_project_deadline DATE ,
project_start_date DATE ,
new_project_start_date DATE 
);

CREATE TRIGGER project_insert_trigger
BEFORE INSERT ON project
FOR EACH ROW
INSERT INTO project_audit
(audit_user, audit_action, project_id, project_name, project_description, project_deadline, project_start_date)
VALUES
(CURRENT_USER(), 'Insert', NEW.project_id, NEW.project_name, NEW.project_description, NEW.project_deadline, NEW.project_start_date);

CREATE TRIGGER project_update_trigger
BEFORE UPDATE ON project
FOR EACH ROW
INSERT INTO project_audit
(audit_user, audit_action, project_id, new_project_id, project_name, new_project_name, project_description, new_project_description, project_deadline, new_project_deadline, project_start_date, new_project_start_date)
VALUES
(CURRENT_USER(), 'Update', OLD.project_id, NEW.project_id, OLD.project_name, NEW.project_name, OLD.project_description, NEW.project_description, OLD.project_deadline, NEW.project_deadline, OLD.project_start_date, NEW.project_start_date);

CREATE TRIGGER project_delete_trigger
BEFORE DELETE ON project
FOR EACH ROW
INSERT INTO project_audit
(audit_user, audit_action, project_id, project_name, project_decsription, project_deadline, project_start_date)
VALUES
(CURRENT_USER(), 'Delete', OLD.project_id, OLD.project_name, OLD.project_description, OLD.project_deadline, OLD.project_start_date);