ALTER TABLE backlog_items
ADD FOREIGN KEY (priority_id) REFERENCES priority (priority_id),
ADD FOREIGN KEY (state_id) REFERENCES states (state_id),
ADD FOREIGN KEY (iteration_id) REFERENCES iteration (iteration_id),
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE users
ADD FOREIGN KEY (user_role_id) REFERENCES user_roles (user_role_id);

ALTER TABLE project_note
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE release_note
ADD FOREIGN KEY (release_id) REFERENCES releases (release_id);

ALTER TABLE task_note
ADD FOREIGN KEY (task_id) REFERENCES task (task_id);

ALTER TABLE iteration
ADD FOREIGN KEY  (release_id) REFERENCES releases (release_id),
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE releases
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE task
ADD FOREIGN KEY  (assignee) REFERENCES users (user_id),
ADD FOREIGN KEY  (state_id) REFERENCES states (state_id),
ADD FOREIGN KEY  (iteration_id) REFERENCES iteration (iteration_id),
ADD FOREIGN KEY  (pbi_id) REFERENCES backlog_items (pbi_id);

ALTER TABLE backlog_note
ADD FOREIGN KEY (pbi_id) REFERENCES backlog_items (pbi_id);

ALTER TABLE users_projects
ADD FOREIGN KEY (project_id) REFERENCES projects (project_id),
ADD FOREIGN KEY (user_id) REFERENCES test_user (user_id);