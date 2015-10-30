CREATE TABLE users_audit(
audit_date TIMESTAMP,
audit_user VARCHAR(40),
audit_action ENUM('Insert','Update','Delete'),
user_id INT(10),
new_user_id INT(10),
user_forename VARCHAR(20),
new_user_forename VARCHAR(20),
user_surname VARCHAR(20),
new_user_surname VARCHAR(20),
user_email VARCHAR(50),
new_user_email VARCHAR(50),
user_password VARCHAR(20),
new_user_password VARCHAR(20),
user_photo BLOB,
new_user_photo BLOB,
user_role_id INT(10),
new_user_role_id INT(10)
);

CREATE TRIGGER test_user_insert_trigger
BEFORE INSERT ON test_user
FOR EACH ROW
INSERT INTO users_audit
(audit_user, audit_action, user_id, user_forename, user_surname, user_email, user_password, user_role_id)
VALUES
(CURRENT_USER(), 'Insert', NEW.user_id, NEW.user_forename, NEW.user_surname, NEW.user_email, NEW.user_password, NEW.user_role_id);

CREATE TRIGGER test_user_update_trigger
BEFORE UPDATE ON test_user
FOR EACH ROW
INSERT INTO users_audit
(audit_user, audit_action, user_id, new_user_id, user_forename, new_user_forename, user_surname, new_user_surname, user_email, new_user_email, user_password, new_user_password, user_role_id, new_user_role_id)
VALUES
(CURRENT_USER(), 'Update', OLD.user_id, NEW.user_id, OLD.user_forename, NEW.user_forename, OLD.user_surname, NEW.user_surname, OLD.user_email, NEW.user_email, OLD.user_password, NEW.user_password, OLD.user_role_id, NEW.user_role_id);

CREATE TRIGGER test_user_delete_trigger
BEFORE DELETE ON test_user
FOR EACH ROW
INSERT INTO users_audit
(audit_user, audit_action, user_id, user_forename, user_surname, user_email, user_password, user_role_id)
VALUES
(CURRENT_USER(), 'Delete', OLD.user_id, OLD.user_forename, OLD.user_surname, OLD.user_email, OLD.user_password, OLD.user_role_id);