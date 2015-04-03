/* Inserted into Database as a test */
INSERT INTO Project
VALUES
(NULL, 'Zeus', 'Group Project for University Module 6008', '2015-12-05', '2016-05-31');

INSERT INTO Releases
VALUES
(NULL, 'Release 1', '2015-03-11', '2015-03-25', '1');

INSERT INTO Iteration
VALUES
(NULL, 'Sprint 1', '2015-03-11', '2015-03-25', '1')
(NULL, 'Sprint 2', '2015-03-25', '2015-04-08', '1');

/* For PBIs 1a1 to 1f1 and 6a1 to 12a1 */
/* First NULL indicates the auto populated ID number, NULL further on is for iterations as they have not been assigned one yet */
/* ID, Title, Description, Effort, Priority, State, Iteration, Project */

INSERT INTO Backlog_Items
VALUES
(NULL, 'Content/Site Map', 'Diagram detailing where content goes/Navigational layout of the website', '5', '3', '1', '2', '1'),
(NULL, 'Wireframes', 'Diagrams of structural layout of the website', '5', '3', '1', NULL, '1'),
(NULL, 'Brand Identity Document', 'Document detailing all aspects of coporate branding - Colours, Logos, Fonts', '8', '3', '1', '2', '1'),
(NULL, 'Produce Visual Templated', 'Designs for different pages within the website', '13', '3', '1', NULL, '1'),
(NULL, 'Competitor Critique', 'Comapare different websites that do the same thing and see how we can go one better', '3', '3', '1', NULL, '1'),
(NULL, 'Decide on Web Design Frameworks', 'Decide on a Bootstrap template to use', '2', '3', '1', '2', '1'),
(NULL, 'Edit HTML and CSS inline with Design Work', '', '5', '3', '1', NULL, '1'),
(NULL, 'Write PHP', '', '13', '3', '1', NULL, '1'),
(NULL, 'Write Json', '', '5', '3', '1', NULL, '1'),
(NULL, 'Write JavaScript', '', '13', '3', '1', NULL, '1'),
(NULL, 'Write AJAX', '', '5', '3', '1', NULL, '1'),
(NULL, 'Add coming soon page', '', '3', '3', '1', '1', '1'),
(NULL, 'Bring coming soon page inline with Brand ID Document', '', '5', '3', '1', '2', '1'),
(NULL, 'Decide on Project Metrics', 'Be able to show a Release Burndown, multiple burndowns, velocity and an admin page', '1', '3', '1', '1', '1'),
(NULL, 'Research Graphs', 'A look into what makes a good graph and how they should be presented', '3', '3', '1', '2', '1'),
(NULL, 'Redesign Database and create ERD', 'Look at whether we need more tables and create an ERD to reflect the design', '16', '3', '1', '1', '1'),
(NULL, 'Create Physical Data Model', 'Create a data model so that we know what fields attributes are going to have', '5', '3', '1', '1', '1'),
(NULL, 'Write SQL Scripts', 'Write CREATE, ALTER, DROP and INSERT scripts to populate the database', '5', '3', '1', NULL, '1'),
(NULL, 'Input data into database using our own data', 'Using our own data insert into database the PBIs, Tasks etc', '8', '3', '1', NULL, '1'),
(NULL, 'Populate Database', '', '5', '3', '1', '1', '1'),
(NULL, 'Get Hosting', 'VidaHost', '3', '3', '1', '1', '1'),
(NULL, 'Allow user to choose project that they are a member of', '', '3', '1', NULL, '1'),
(NULL, 'Create rating system for tasks', '', '', '3', '1', NULL, '1'),
(NULL, 'Integrate rating system with database', '', '', '3', '1', NULL, '1'),
(NULL, 'Design UI for assigning work', 'Come up with a way to assign work to other group members', '', '3', '1', NULL, '1'),
(NULL, 'Send notification when work is assigned to you', 'What type of notification? email etc', '', '3', '1', NULL, '1'),
(NULL, 'Send notification when work assigned to you is edited', '', '', '3', '1', NULL, '1'),
(NULL, 'Task/PBI creator field in database', '', '', '3' '1', NULL, '1'),
(NULL, 'Task/PBI created date', '', '', '3', '1', NULL, '1'),
(NULL, 'Task/PBI updated date', '', '', '3', '1', NULL, '1'),
(NULL, 'Display one Burndown graph on a page', 'Design page template, build, PHP, JavaScript', '', '3', '1', NULL '1'),
(NULL, 'Display multiple burndowns per page', 'Adapt PHP and JavaScript', '', '3', '1', NULL, '1'),
(NULL, 'Research Bootstrap Login', '', '', '3', '1', NULL, '1'),
(NULL, 'Implement a simple login system', '', '', '3', '1', NULL, '1'),
(NULL, 'Develop JavaScript to make use of notifications - Graphs', 'Be able to click on the graph and obtain information', '', '3', '1', NULL, '1'),
(NULL, 'Develop JavaScript to make use of notifications - Daashboard', 'Be able to click on the graph and obtain information', '', '3', '1', NULL, '1');


/* To be decided on */
INSERT INTO Priority_ID
VALUES
(NULL, 'Critical')
(NULL, 'High'),
(NULL, 'Medium'),
(NUll, 'Low');

/* To be decided on */
INSERT INTO States
VALUES
(NULL, 'New', 'PBI'),
(NULL, 'In Progress', 'PBI'),
(NULL, 'In Review', 'PBI'),
(NULL, 'Done', 'PBI'),
(NULL, 'Re-Opened', 'PBI');
(NULL, 'Closed', 'PBI');