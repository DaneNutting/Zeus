CREATE TABLE priority_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
priority_id INT(10),
new_priority_id INT(10),
description VARCHAR(15),
new_description VARCHAR(15) 
);

CREATE TRIGGER priority_insert_trigger
BEFORE INSERT ON priority
FOR EACH ROW
INSERT INTO priority_audit
(audit_user, audit_action, priority_id, description)
VALUES
(CURRENT_USER(), 'Insert', NEW.priority_id, NEW.description);

CREATE TRIGGER priority_update_trigger
BEFORE UPDATE ON priority
FOR EACH ROW
INSERT INTO priority_audit
(audit_user, audit_action, priority_id, new_priority_id, description, new_description)
VALUES
(CURRENT_USER(), 'Update', OLD.priority_id, NEW.priority_id, OLD.description, NEW.description);

CREATE TRIGGER priority_delete_trigger
BEFORE DELETE ON priority
FOR EACH ROW
INSERT INTO priority_audit
(audit_user, audit_action, priority_id, description)
VALUES
(CURRENT_USER(), 'Delete', OLD.priority_id, OLD.description);