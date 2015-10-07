CREATE TABLE iteration_note_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
iteration_note_id INT(10),
new_iteration_note_id INT(10),
iteration_id INT(10),
new_iteration_id INT(10),
note VARCHAR(500),
new_note VARCHAR(500) 
);

CREATE TRIGGER iteration_note_insert_trigger
BEFORE INSERT ON iteration_note
FOR EACH ROW
INSERT INTO iteration_note_audit
(audit_user, audit_action, iteration_note_id, iteration_id, note)
VALUES
(CURRENT_USER(), 'Insert', NEW.iteration_note_id, NEW.iteration_id, NEW.note);

CREATE TRIGGER iteration_note_update_trigger
BEFORE UPDATE ON iteration_note
FOR EACH ROW
INSERT INTO iteration_note_audit
(audit_user, audit_action, iteration_note_id, new_iteration_note_id, iteration_id, new_iteration_id, note, new_note)
VALUES
(CURRENT_USER(), 'Update', OLD.iteration_note_id, NEW.iteration_note_id, OLD.iteration_id, NEW.iteration_id, OLD.note, NEW.note);

CREATE TRIGGER iteration_note_delete_trigger
BEFORE DELETE ON iteration_note
FOR EACH ROW
INSERT INTO iteration_note_audit
(audit_user, audit_action, iteration_note_id, iteration_id, note)
VALUES
(CURRENT_USER(), 'Delete', OLD.iteration_note_id, OLD.iteration_id, OLD.note);