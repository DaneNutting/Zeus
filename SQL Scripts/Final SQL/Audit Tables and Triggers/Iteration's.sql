CREATE TABLE iteration_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
iteration_id INT(10),
new_iteration_id INT(10),
iteration_name VARCHAR(100),
new_iteration_name VARCHAR(100),
iteration_start_date DATE ,
new_iteration_start_date DATE ,
iteration_end_date DATE ,
new_iteration_end_date DATE ,
release_id INT(10),
new_release_id INT(10),
starting_effort INT(10),
new_starting_effort INT(10) 
);

CREATE TRIGGER iteration_insert_trigger
BEFORE INSERT ON iteration
FOR EACH ROW
INSERT INTO iteration_audit
(audit_user, audit_action, iteration_id, iteration_name, iteration_start_date, iteration_end_date, release_id, starting_effort)
VALUES
(CURRENT_USER(), 'Insert', NEW.iteration_id, NEW.iteration_name, NEW.iteration_start_date, NEW.iteration_end_date, NEW.release_id, NEW.starting_effort);

CREATE TRIGGER iteration_update_trigger
BEFORE UPDATE ON iteration
FOR EACH ROW
INSERT INTO iteration_audit
(audit_user, audit_action, iteration_id, new_iteration_id, iteration_name, new_iteration_name, iteration_start_date, new_iteration_start_date, iteration_end_date, new_iteration_end_date, release_id, new_release_id, starting_effort, new_starting_effort)
VALUES
(CURRENT_USER(), 'Update', OLD.iteration_id, NEW.iteration_id, OLD.iteration_name, NEW.iteration_name, OLD.iteration_start_date, NEW.iteration_start_date, OLD.iteration_end_date, NEW.iteration_end_date, OLD.release_id, NEW.release_id, OLD.starting_effort, NEW.starting_effort);

CREATE TRIGGER iteration_delete_trigger
BEFORE DELETE ON iteration
FOR EACH ROW
INSERT INTO iteration_audit
(audit_user, audit_action, iteration_id, iteration_name, iteration_start_date, iteration_end_date, release_id, starting_effort)
VALUES
(CURRENT_USER(), 'Delete', OLD.iteration_id, OLD.iteration_name, OLD.iteration_start_date, OLD.iteration_end_date, OLD.release_id, OLD.starting_effort);