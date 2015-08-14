CREATE TABLE releases_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
release_id INT(10),
new_release_id INT(10),
release_name VARCHAR(50),
new_release_name VARCHAR(50),
release_start_date DATE ,
new_release_start_date DATE ,
release_end_date DATE ,
new_release_end_date DATE ,
project_id INT(10),
new_project_id INT(10) 
);

CREATE TRIGGER releases_insert_trigger
BEFORE INSERT ON releases
FOR EACH ROW
INSERT INTO releases_audit
(audit_user, audit_action, release_id, release_name, release_start_date, release_end_date, project_id)
VALUES
(CURRENT_USER(), 'Insert', NEW.release_id, NEW.release_name, NEW.release_start_date, NEW.release_end_date, NEW.project_id);

CREATE TRIGGER releases_update_trigger
BEFORE UPDATE ON releases
FOR EACH ROW
INSERT INTO releases_audit
(audit_user, audit_action, release_id, new_release_id, release_name, new_release_name, release_start_date, new_release_start_date, release_end_date, new_release_end_date, project_id, new_project_id)
VALUES
(CURRENT_USER(), 'Update', OLD.release_id, NEW.release_id, OLD.release_name, NEW.release_name, OLD.release_start_date, NEW.release_start_date, OLD.release_end_date, NEW.release_end_date, OLD.project_id, NEW.project_id);

CREATE TRIGGER releases_delete_trigger
BEFORE DELETE ON releases
FOR EACH ROW
INSERT INTO releases_audit
(audit_user, audit_action, release_id, release_name, release_start_date, release_end_date, project_id)
VALUES
(CURRENT_USER(), 'Delete', OLD.release_id, OLD.release_name, OLD.release_start_date, OLD.release_end_date, OLD.project_id);