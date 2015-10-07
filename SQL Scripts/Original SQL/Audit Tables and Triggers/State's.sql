CREATE TABLE state_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
state_id INT(10),
new_state_id INT(10),
state_name VARCHAR(50),
new_state_name VARCHAR(50),
state_type VARCHAR(50),
new_state_type VARCHAR(50) 
);

CREATE TRIGGER state_insert_trigger
BEFORE INSERT ON states
FOR EACH ROW
INSERT INTO state_audit
(audit_user, audit_action, state_id, state_name, state_type)
VALUES
(CURRENT_USER(), 'Insert', NEW.state_id, NEW.state_name, NEW.state_type);

CREATE TRIGGER state_update_trigger
BEFORE UPDATE ON states
FOR EACH ROW
INSERT INTO state_audit
(audit_user, audit_action, state_id, new_state_id, state_name, new_state_name, state_type, new_state_type)
VALUES
(CURRENT_USER(), 'Update', OLD.state_id, NEW.state_id, OLD.state_name, NEW.state_name, OLD.state_type, NEW.state_type);

CREATE TRIGGER state_delete_trigger
BEFORE DELETE ON states
FOR EACH ROW
INSERT INTO state_audit
(audit_user, audit_action, state_id, state_name, state_type)
VALUES
(CURRENT_USER(), 'Delete', OLD.state_id, OLD.state_name, OLD.state_type);