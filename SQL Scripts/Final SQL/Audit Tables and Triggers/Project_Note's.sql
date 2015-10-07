CREATE TABLE project_note_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
project_note_id INT(10),
new_project_note_id INT(10),
project_id INT(10),
new_project_id INT(10),
note VARCHAR(500),
new_note VARCHAR(500) 
);

CREATE TRIGGER project_note_insert_trigger
BEFORE INSERT ON project_note
FOR EACH ROW
INSERT INTO project_note_audit
(audit_user, audit_action, project_note_id, project_id, note)
VALUES
(CURRENT_USER(), 'Insert', NEW.project_note_id, NEW.project_id, NEW.note);

CREATE TRIGGER project_note_update_trigger
BEFORE UPDATE ON project_note
FOR EACH ROW
INSERT INTO project_note_audit
(audit_user, audit_action, project_note_id, new_project_note_id, project_id, new_project_id, note, new_note)
VALUES
(CURRENT_USER(), 'Update', OLD.project_note_id, NEW.project_note_id, OLD.project_id, NEW.project_id, OLD.note, NEW.note);

CREATE TRIGGER project_note_delete_trigger
BEFORE DELETE ON project_note
FOR EACH ROW
INSERT INTO project_note_audit
(audit_user, audit_action, project_note_id, project_id, note)
VALUES
(CURRENT_USER(), 'Delete', OLD.project_note_id, OLD.project_id, OLD.note);