CREATE TABLE IF NOT EXISTS backlog_items (
pbi_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
pbi_title VARCHAR(100),
pbi_description VARCHAR(2000),
pbi_effort INT UNSIGNED,
priority_id INT UNSIGNED,
state_id INT UNSIGNED,
iteration_id INT UNSIGNED,
project_id INT UNSIGNED,
PRIMARY KEY (pbi_id)
);

CREATE TABLE IF NOT EXISTS backlog_note (
backlog_note_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
pbi_id INT UNSIGNED,
note VARCHAR(500),
PRIMARY KEY (backlog_note_id)
);

CREATE TABLE IF NOT EXISTS interested_emails_ads (
email_address VARCHAR(100),
PRIMARY KEY (email_address)
);

CREATE TABLE IF NOT EXISTS iteration (
iteration_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
iteration_name VARCHAR(100),
iteration_start_date DATE,
iteration_end_date DATE,
release_id INT UNSIGNED,
starting_effort INT UNSIGNED,
PRIMARY KEY (iteration_id)
);

CREATE TABLE IF NOT EXISTS iteration_note (
iteration_note_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
iteration_id INT UNSIGNED,
note VARCHAR(500),
PRIMARY KEY(iteration_note_id)
);

CREATE TABLE IF NOT EXISTS priority(
priority_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
description VARCHAR(15),
PRIMARY KEY(priority_id)
);

CREATE TABLE IF NOT EXISTS project (
project_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
project_name VARCHAR(100),
project_description VARCHAR(200),
project_start_date DATE,
project_deadline DATE,
PRIMARY KEY (project_id)
);

CREATE TABLE IF NOT EXISTS project_note (
project_note_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
project_id INT UNSIGNED,
note VARCHAR(500),
PRIMARY KEY (project_note_id)
);

CREATE TABLE IF NOT EXISTS releases (
release_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
release_name VARCHAR(50),
release_start_date DATE,
release_end_date DATE,
project_id INT UNSIGNED,
PRIMARY KEY(release_id)
);

CREATE TABLE IF NOT EXISTS release_note (
release_note_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
release_id INT UNSIGNED,
note VARCHAR(500),
PRIMARY KEY(release_note_id)
);

CREATE TABLE IF NOT EXISTS states (
state_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
state_name VARCHAR(50),
state_type VARCHAR(50),
PRIMARY KEY(state_id)
);

CREATE TABLE IF NOT EXISTS task (
task_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
task_title VARCHAR(200),
task_description VARCHAR(500),
task_estimated_duration FLOAT,
task_hours_done FLOAT,
assignee INT UNSIGNED,
state_id INT UNSIGNED,
iteration_id INT UNSIGNED,
pbi_id INT UNSIGNED,
PRIMARY KEY(task_id)
);

CREATE TABLE IF NOT EXISTS task_note (
task_note_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
task_id INT UNSIGNED,
note VARCHAR(500),
PRIMARY KEY(task_note_id)
);

CREATE TABLE tokens (
token VARCHAR(10),
email VARCHAR(25),
used INT UNSIGNED
);

CREATE TABLE IF NOT EXISTS testing_users (
user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_forename VARCHAR(100),
user_surname VARCHAR(100),
user_email VARCHAR(100),
user_password VARCHAR(32),
user_role_id INT UNSIGNED DEFAULT '2',
PRIMARY KEY(user_id) 
);

CREATE TABLE IF NOT EXISTS user_roles (
user_role_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_role_description VARCHAR(50),
PRIMARY KEY(user_role_id)
);

CREATE TABLE IF NOT EXISTS users_projects(
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_id INT UNSIGNED NOT NULL,
project_id INT UNSIGNED NOT NULL,
PRIMARY KEY(id)
);