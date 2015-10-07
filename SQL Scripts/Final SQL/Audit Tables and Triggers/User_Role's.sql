CREATE TABLE user_role_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
user_role_id INT(10),
new_user_role_id INT(10),
user_role_description VARCHAR(50),
new_user_role_description VARCHAR(50) 
);

CREATE TRIGGER user_role_insert_trigger
BEFORE INSERT ON user_roles
FOR EACH ROW
INSERT INTO user_role_audit
(audit_user, audit_action, user_role_id, user_role_description)
VALUES
(CURRENT_USER(), 'Insert', NEW.user_role_id, NEW.user_role_description);

CREATE TRIGGER user_role_update_trigger
BEFORE UPDATE ON user_roles
FOR EACH ROW
INSERT INTO user_role_audit
(audit_user, audit_action, user_role_id, new_user_role_id, user_role_description, new_user_role_description)
VALUES
(CURRENT_USER(), 'Update', OLD.user_role_id, NEW.user_role_id, OLD.user_role_description, NEW.user_role_description);

CREATE TRIGGER user_role_delete_trigger
BEFORE DELETE ON user_roles
FOR EACH ROW
INSERT INTO user_role_audit
(audit_user, audit_action, user_role_id, user_role_description)
VALUES
(CURRENT_USER(), 'Delete', OLD.user_role_id, OLD.user_role_description);