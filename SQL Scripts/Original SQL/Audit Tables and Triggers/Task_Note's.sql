CREATE TABLE task_note_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
task_note_id INT(10),
new_task_note_id INT(10),
task_id INT(10),
new_task_id INT(10),
note VARCHAR(500),
new_note VARCHAR(500) 
);

CREATE TRIGGER task_note_insert_trigger
BEFORE INSERT ON task_note
FOR EACH ROW
INSERT INTO task_note_audit
(audit_user, audit_action, task_note_id, task_id, note)
VALUES
(CURRENT_USER(), 'Insert', NEW.task_note_id, NEW.task_id, NEW.note);

CREATE TRIGGER task_note_update_trigger
BEFORE UPDATE ON task_note
FOR EACH ROW
INSERT INTO task_note_audit
(audit_user, audit_action, task_note_id, new_task_note_id, task_id, new_task_id, note, new_note)
VALUES
(CURRENT_USER(), 'Update', OLD.task_note_id, NEW.task_note_id, OLD.task_id, NEW.task_id, OLD.note, NEW.note);

CREATE TRIGGER task_note_delete_trigger
BEFORE DELETE ON task_note
FOR EACH ROW
INSERT INTO task_note_audit
(audit_user, audit_action, task_note_id, task_id, note)
VALUES
(CURRENT_USER(), 'Delete', OLD.task_note_id, OLD.task_id, OLD.note);