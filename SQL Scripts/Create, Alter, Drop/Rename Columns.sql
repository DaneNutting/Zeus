/* backlog_items */
ALTER TABLE backlog_items CHANGE PBI_ID pbi_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE backlog_items CHANGE PBI_Title pbi_title VARCHAR(100);
ALTER TABLE backlog_items CHANGE PBI_Description pbi_description VARCHAR(300);
ALTER TABLE backlog_items CHANGE PBI_Effort pbi_effort INT UNSIGNED;
ALTER TABLE backlog_items CHANGE Priority_ID priority_id INT UNSIGNED;
ALTER TABLE backlog_items CHANGE State_ID state_id INT UNSIGNED;
ALTER TABLE backlog_items CHANGE Iteration_ID iteration_id INT UNSIGNED;
ALTER TABLE backlog_items CHANGE Project_ID project_id INT UNSIGNED;

/* backlog_note */
ALTER TABLE backlog_note CHANGE Backlog_Note_ID backlog_note_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE backlog_note CHANGE PBI_ID pbi_id INT UNSIGNED;
ALTER TABLE backlog_note CHANGE Note note VARCHAR(500);

/* interested_email_ads */
ALTER TABLE interested_emails_ads CHANGE EmailAddress email_address VARCHAR(100);

/* iteration */
ALTER TABLE iteration CHANGE Iteration_ID iteration_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE iteration CHANGE Iteration_Name iteration_name VARCHAR(100);
ALTER TABLE iteration CHANGE Iteration_Start_Date iteration_start_date DATE;
ALTER TABLE iteration CHANGE Iteration_End_Date iteration_end_date DATE;
ALTER TABLE iteration CHANGE Release_ID release_id INT UNSIGNED;
ALTER TABLE iteration CHANGE Starting_Effort starting_effort INT UNSIGNED;

*/ iteration_note */
ALTER TABLE iteration_note CHANGE Iteration_Note_ID iteration_note_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE iteration_note CHANGE Iteration_ID iteration_id INT UNSIGNED;
ALTER TABLE iteration_note CHANGE Note note VARCHAR(500);

*/ priority */
ALTER TABLE priority CHANGE Priority_ID priority_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE priority CHANGE Priority_Description description VARCHAR(15);

*/ project */
ALTER TABLE project CHANGE Project_ID project_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE project CHANGE Project_Name project_name VARCAR(100);
ALTER TABLE project CHANGE Project_Description project_description VARCHAR(200);
ALTER TABLE project CHANGE Project_Deadline project_deadline DATE;
ALTER TABLE project CHANGE Project_Start_Date project_start_date DATE;

*/ project_note */
ALTER TABLE project_note CHANGE Project_Note_ID project_note_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE project_note CHANGE Project_ID priority_id INT UNSIGNED;
ALTER TABLE project_note CHANGE Note note VARCHAR(500);

*/ releases */
ALTER TABLE releases CHANGE Release_ID release_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE releases CHANGE Release_Name release_name VARCHAR(50);
ALTER TABLE releases CHANGE Release_Start_Date release_start_date DATE;
ALTER TABLE releases CHANGE Release_End_Date release_end_date DATE;
ALTER TABLE releases CHANGE Project_ID project_id INT UNSIGNED;

*/ release_note */
ALTER TABLE release_note CHANGE Release_Note_ID release_note_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE release_note CHANGE Release_ID release_id INT UNSIGNED;
ALTER TABLE release_note CHANGE Note note VARCHAR(500);

*/ states */
ALTER TABLE states CHANGE State_ID state_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE states CHANGE State_Name state_name VARCHAR(50);
ALTER TABLE states CHANGE State_Type state_type VARCHAR(50);

*/ task */
ALTER TABLE task CHANGE Task_ID task_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE task CHANGE Task_Title task_title VARCHAR(200);
ALTER TABLE task CHANGE Task_Description task_description VARCHAR(500);
ALTER TABLE task CHANGE Task_estimated_Duration task_estimated_duration FLOAT;
ALTER TABLE task CHANGE Task_Hours_Done task_hours_done FLOAT;
ALTER TABLE task CHANGE Assignee assignee INT UNSIGNED;
ALTER TABLE task CHANGE State_ID state_id INT UNSIGNED;
ALTER TABLE task CHANGE Iteration_ID iteration_id INT UNSIGNED;
ALTER TABLE task CHANGE PBI_ID pbi_id INT UNSIGNED;

*/ task_note */
ALTER TABLE task_note CHANGE Task_Note_ID task_note_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE task_note CHANGE Task_ID task_id INT UNSIGNED;
ALTER TABLE task_note CHANGE Note note VARCHAR(500);

*/ users */
ALTER TABLE users CHANGE User_ID user_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE users CHANGE User_Forename user_forename VARCHAR(20);
ALTER TABLE users CHANGE User_Surname user_surname VARCHAR(20);
ALTER TABLE users CHANGE User_Email user_email VARCHAR(50);
ALTER TABLE users CHANGE User_Password user_password VARCHAR(20);
ALTER TABLE users CHANGE User_Photo user_photo BLOB;
ALTER TABLE users CHANGE User_Role_ID user_role_id INT UNSIGNED;

*/ user_roles */
ALTER TABLE user_roles CHANGE User_Role_ID user_role_id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE user_roles CHANGE User_Role_Description user_role_description VARCHAR(50);