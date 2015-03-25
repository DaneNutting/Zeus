INSERT INTO Project
VALUES
(NULL, 'Zeus', 'Group Project for University Module 6008', '2015-12-05', '2016-05-31');

/*Need some clarification about what a release is? */
INSERT INTO Releases
VALUES
(NULL, 'Release 1', '2015-03-11', '2015-03-25', '1');

INSERT INTO Iteration
VALUES
(NULL, 'Sprint 1', '2015-03-11', '2015-03-25', '1')
(NULL, 'Sprint 2', '2015-03-25', '2015-04-08', '1');

/* For PBIs 1a1 through to 1a5 */
/* First NULL indicates the auto populated ID number, NULL further on is for iterations as they have not been assigned one yet */
INSERT INTO Backlog_Items
VALUES
(NULL, 'Content/Site Map', 'Diagram detailing where content goes/Navigational layout of the website', 5, 2, 1, NULL, 1),
(NULL, 'Wireframes', 'Diagrams of structural layout of the website', 5, 2, 1, NULL, 1),
(NULL, 'Brand Identity Document', 'Document detailing all aspects of coporate branding - Colours, Logos, Fonts', 8, 2, 1, 1, 1),
(NULL, 'Produce Visual Templated', 'Designs for different pages within the website', 13, 2, 1, NULL, 1),
(NULL, 'Competitor Critique', 'Comapare different websites that do the same thing and see how we can go one better', 3, 2, 1, NULL, 1);

INSERT INTO Priority_ID
VALUES
(NULL, 'High'),
(NULL, 'Medium'),
(NUll, 'Low');

INSERT INTO States
VALUES
(NULL, 'New', 'PBI'),
(NULL, 'In Progress', 'PBI'),
(NULL, 'Done', 'PBI'),
(NULL, 'Closed', 'PBI'),
(NULL, 'New', 'Task'),
(NULL, 'In Progress', 'Task'),
(NULL, 'Done', 'Task'),
(NULL, 'Closed', 'Task');