CREATE TABLE backlog_note_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
backlog_note_id INT(10),
new_backlog_note_id INT(10),
pbi_id INT(10),
new_pbi_id INT(10),
note VARCHAR(500),
new_note VARCHAR(500) 
);

CREATE TRIGGER pbi_note_insert_trigger
BEFORE INSERT ON backlog_note
FOR EACH ROW
INSERT INTO backlog_note_audit
(audit_user, audit_action, backlog_note_id, pbi_id, note)
VALUES
(CURRENT_USER(), 'Insert', NEW.backlog_note_id, NEW.pbi_id, NEW.note);

CREATE TRIGGER pbi_note_update_trigger
BEFORE UPDATE ON backlog_note
FOR EACH ROW
INSERT INTO backlog_note_audit
(audit_user, audit_action, backlog_note_id, new_backlog_note_id, pbi_id, new_pbi_id, note, new_note)
VALUES
(CURRENT_USER(), 'Update', OLD.backlog_note_id, NEW.backlog_note_id, OLD.pbi_id, NEW.pbi_id, OLD.note, NEW.note);

CREATE TRIGGER pbi_note_delete_trigger
BEFORE DELETE ON backlog_note
FOR EACH ROW
INSERT INTO backlog_note_audit
(audit_user, audit_action, backlog_note_id, pbi_id, note)
VALUES
(CURRENT_USER(), 'Delete', OLD.backlog_note_id, OLD.pbi_id, OLD.note);