CREATE TABLE IF NOT EXISTS `backlog_items` (
  `pbi_id` int(10) unsigned NOT NULL,
  `pbi_title` varchar(100) DEFAULT NULL,
  `pbi_description` varchar(2000) DEFAULT NULL,
  `pbi_effort` int(10) unsigned DEFAULT NULL,
  `priority_id` int(10) unsigned DEFAULT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `iteration_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `backlog_note` (
  `backlog_note_id` int(10) unsigned NOT NULL,
  `pbi_id` int(10) unsigned DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `interested_emails_ads` (
  `email_address` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `iteration` (
  `iteration_id` int(10) unsigned NOT NULL,
  `iteration_name` varchar(100) DEFAULT NULL,
  `iteration_start_date` date DEFAULT NULL,
  `iteration_end_date` date DEFAULT NULL,
  `release_id` int(10) unsigned DEFAULT NULL,
  `starting_effort` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `iteration_note` (
  `iteration_note_id` int(10) unsigned NOT NULL,
  `iteration_id` int(10) unsigned DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `organisation` (
  `org_id` int(10) unsigned NOT NULL,
  `org_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `priority` (
  `priority_id` int(10) unsigned NOT NULL,
  `description` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(10) unsigned NOT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `project_description` varchar(200) DEFAULT NULL,
  `project_deadline` date DEFAULT NULL,
  `project_start_date` date DEFAULT NULL,
  `org_id` int(10) DEFAULT NULL,
  'project_lead_id' int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `project_note` (
  `project_note_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `releases` (
  `release_id` int(10) unsigned NOT NULL,
  `release_name` varchar(50) DEFAULT NULL,
  `release_start_date` date DEFAULT NULL,
  `release_end_date` date DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `release_note` (
  `release_note_id` int(10) unsigned NOT NULL,
  `release_id` int(10) unsigned DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `states` (
  `state_id` int(10) unsigned NOT NULL,
  `state_name` varchar(50) DEFAULT NULL,
  `state_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(10) unsigned NOT NULL,
  `task_title` varchar(200) DEFAULT NULL,
  `task_description` varchar(500) DEFAULT NULL,
  `task_estimated_duration` float DEFAULT NULL,
  `task_hours_done` float DEFAULT NULL,
  `assignee` int(10) unsigned DEFAULT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `iteration_id` int(10) unsigned DEFAULT NULL,
  `pbi_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `task_note` (
  `task_note_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tokens` (
  `token` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `used` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users2` (
  `user_id` int(10) unsigned NOT NULL,
  `user_forename` varchar(100) DEFAULT NULL,
  `user_surname` varchar(100) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_photo` blob,
  `org_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users_projects` (
  `user_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(10) unsigned NOT NULL,
  `user_role_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `backlog_items`
  ADD PRIMARY KEY (`pbi_id`);
  
ALTER TABLE `backlog_note`
  ADD PRIMARY KEY (`backlog_note_id`);
  
ALTER TABLE `interested_emails_ads`
  ADD PRIMARY KEY (`email_address`);
  
ALTER TABLE `iteration`
  ADD PRIMARY KEY (`iteration_id`);
  
ALTER TABLE `iteration_note`
  ADD PRIMARY KEY (`iteration_note_id`);
  
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`org_id`);
  
ALTER TABLE `priority`
  ADD PRIMARY KEY (`priority_id`);

ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`);
  
ALTER TABLE `releases`
  ADD PRIMARY KEY (`release_id`);
  
ALTER TABLE `release_note`
  ADD PRIMARY KEY (`release_note_id`);
  
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);
  
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);
  
ALTER TABLE `task_note`
  ADD PRIMARY KEY (`task_note_id`);
  
ALTER TABLE `users2`
  ADD PRIMARY KEY (`user_id`);
  
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`);
  
ALTER TABLE `backlog_items`
  MODIFY `pbi_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `backlog_note`
--
ALTER TABLE `backlog_note`
  MODIFY `backlog_note_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `iteration`
--
ALTER TABLE `iteration`
  MODIFY `iteration_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `iteration_note`
--
ALTER TABLE `iteration_note`
  MODIFY `iteration_note_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `org_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `priority`
--
ALTER TABLE `priority`
  MODIFY `priority_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `releases`
--
ALTER TABLE `releases`
  MODIFY `release_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `release_note`
--
ALTER TABLE `release_note`
  MODIFY `release_note_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `task_note`
--
ALTER TABLE `task_note`
  MODIFY `task_note_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
  
ALTER TABLE `users2`
  MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
  
ALTER TABLE backlog_items
ADD FOREIGN KEY (priority_id) REFERENCES priority (priority_id),
ADD FOREIGN KEY (state_id) REFERENCES states (state_id),
ADD FOREIGN KEY (iteration_id) REFERENCES iteration (iteration_id),
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE backlog_note
ADD FOREIGN KEY (pbi_id) REFERENCES backlog_items (pbi_id);

ALTER TABLE iteration
ADD FOREIGN KEY (release_id) REFERENCES releases (release_id),
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE iteration_note
ADD FOREIGN KEY (iteration_id) REFERENCES iteration (iteration_id);

ALTER TABLE project
ADD FOREIGN KEY (org_id) REFERENCES organisation (org_id),
ADD FOREIGN KEY (project_lead_id) REFERENCES users2 (user_id);

ALTER TABLE project_note
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE releases
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE release_note
ADD FOREIGN KEY (release_id) REFERENCES releases (release_id);

ALTER TABLE task
ADD FOREIGN KEY (assignee) REFERENCES users2 (user_id),
ADD FOREIGN KEY (state_id) REFERENCES states (state_id),
ADD FOREIGN KEY (iteration_id) REFERENCES iteration (iteration_id),
ADD FOREIGN KEY (pbi_id) REFERENCES backlog_items (pbi_id),
ADD FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE task_note
ADD FOREIGN KEY (task_id) REFERENCES task (task_id);

ALTER TABLE users2
ADD FOREIGN KEY (org_id) REFERENCES organisation (org_id);