CREATE TABLE release_note_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
release_note_id INT(10),
new_release_note_id INT(10),
release_id INT(10),
new_release_id INT(10),
note VARCHAR(500),
new_note VARCHAR(500) 
);

CREATE TRIGGER release_note_insert_trigger
BEFORE INSERT ON release_note
FOR EACH ROW
INSERT INTO release_note_audit
(audit_user, audit_action, release_note_id, release_id, note)
VALUES
(CURRENT_USER(), 'Insert', NEW.release_note_id, NEW.release_id, NEW.note);

CREATE TRIGGER release_note_update_trigger
BEFORE UPDATE ON release_note
FOR EACH ROW
INSERT INTO release_note_audit
(audit_user, audit_action, release_note_id, new_release_note_id, release_id, new_release_id, note, new_note)
VALUES
(CURRENT_USER(), 'Update', OLD.release_note_id, NEW.release_note_id, OLD.release_id, NEW.release_id, OLD.note, NEW.note);

CREATE TRIGGER release_note_delete_trigger
BEFORE DELETE ON release_note
FOR EACH ROW
INSERT INTO release_note_audit
(audit_user, audit_action, release_note_id, release_id, note)
VALUES
(CURRENT_USER(), 'Delete', OLD.release_note_id, OLD.release_id, OLD.note);