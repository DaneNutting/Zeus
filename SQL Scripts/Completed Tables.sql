DROP TABLE Backlog_Items;
DROP TABLE Project;
DROP TABLE Users;
DROP TABLE Project_Note;
DROP TABLE Release_Note;
DROP TABLE Task_Note;
DROP TABLE Priority;
DROP TABLE Iteration;
DROP TABLE Releases;
DROP TABLE Task;
DROP TABLE States;
DROP TABLE User_Roles;
DROP TABLE Backlog_Note;
DROP TABLE Iteration_Note;

CREATE TABLE IF NOT EXISTS Backlog_Items (
PBI_ID					INT UNSIGNED  NOT NULL AUTO_INCREMENT,
PBI_Title				VARCHAR(100),
PBI_Description			VARCHAR(300),
PBI_Effort				INT UNSIGNED,
Priority_ID				INT UNSIGNED,
State_ID				INT UNSIGNED,
Iteration_ID			INT UNSIGNED,
Project_ID				INT UNSIGNED,
FOREIGN KEY (Priority_ID) REFERENCES Priority (Priority_ID),
FOREIGN KEY (State_ID) REFERENCES States (State_ID),
FOREIGN KEY (Iteration_ID) REFERENCES Iteration (Iteration_ID),
FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID),
PRIMARY KEY  (PBI_ID)
);

CREATE TABLE IF NOT EXISTS Project (
Project_ID				INT UNSIGNED NOT NULL AUTO_INCREMENT,
Project_Name			VARCHAR(100),
Project_Description		VARCHAR(200),
Project_Deadline		DATE,
Project_Start_Date		DATE,
PRIMARY KEY (Project_ID)
);

CREATE TABLE IF NOT EXISTS Users (
User_ID					INT UNSIGNED NOT NULL AUTO_INCREMENT,
User_Forename			VARCHAR(20),
User_Surname			VARCHAR(20),
User_Email				VARCHAR(50),
User_Password			VARCHAR(20),
User_Photo				LONGBLOB,
User_Role_ID			INT UNSIGNED,
FOREIGN KEY (User_Role_ID) REFERENCES User_Roles (User_Role_ID),
PRIMARY KEY (User_ID)
);

CREATE TABLE IF NOT EXISTS Project_Note (
Project_Note_ID			INT UNSIGNED NOT NULL AUTO_INCREMENT,
Project_ID				INT UNSIGNED,
Note					VARCHAR(500),
FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID),
PRIMARY KEY (Project_Note_ID)
);

CREATE TABLE IF NOT EXISTS Release_Note (
Release_Note_ID			INT UNSIGNED NOT NULL AUTO_INCREMENT,
Release_ID				INT UNSIGNED,
Note					VARCHAR(500),
FOREIGN KEY (Release_ID) REFERENCES Releases (Release_ID),
PRIMARY KEY (Release_Note_ID)
);

CREATE TABLE IF NOT EXISTS Task_Note (
Task_Note_ID			INT UNSIGNED NOT NULL AUTO_INCREMENT,
Task_ID					INT UNSIGNED,
Note					VARCHAR(500),
FOREIGN KEY (Task_ID) REFERENCES Task (Task_ID),
PRIMARY KEY (Task_Note_ID)
);

CREATE TABLE IF NOT EXISTS Priority (
Priority_ID				INT UNSIGNED  NOT NULL AUTO_INCREMENT,
Priority_Description	VARCHAR(15),
PRIMARY KEY	 (Priority_ID)
);

CREATE TABLE IF NOT EXISTS Iteration (
Iteration_ID			INT UNSIGNED  NOT NULL AUTO_INCREMENT,
Iteration_Name			VARCHAR(100),
Iteration_Start_Date	DATE,
Iteration_End_Date		DATE,
Release_ID				INT UNSIGNED,
FOREIGN KEY  (Release_ID) REFERENCES Releases (Release_ID),
PRIMARY KEY (Iteration_ID)
);
 
CREATE TABLE IF NOT EXISTS Releases (
Release_ID				INT UNSIGNED  NOT NULL AUTO_INCREMENT,
Release_Name			VARCHAR(50),
Release_Start_Date		DATE,
Release_End_Date		DATE,
Project_ID				INT UNSIGNED
FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID),
PRIMARY KEY (Release_ID)
);

CREATE TABLE IF NOT EXISTS Task (
Task_ID					INT UNSIGNED  NOT NULL AUTO_INCREMENT,
Task_Title				VARCHAR(200),
Task_Description		VARCHAR(500),
Task_Estimated_Duration	FLOAT,
Task_Hours_Done			FLOAT,
Assignee				INT UNSIGNED,
State_ID				INT UNSIGNED,
Iteration_ID			INT UNSIGNED,
PBI_ID					INT UNSIGNED,
FOREIGN KEY  (Assignee) 	REFERENCES Users 	     (User_ID),
FOREIGN KEY  (State_ID) 	REFERENCES States     	 (State_ID),
FOREIGN KEY  (Iteration_ID) REFERENCES Iteration 	 (Iteration_ID),
FOREIGN KEY  (PBI_ID) 		REFERENCES Backlog_Items (PBI_ID),
PRIMARY KEY  (Task_ID)
);

CREATE TABLE IF NOT EXISTS States (
State_ID				INT UNSIGNED  NOT NULL AUTO_INCREMENT,
State_Name				VARCHAR(50),
State_Type				VARCHAR(50),
PRIMARY KEY	  (State_ID)
);

CREATE TABLE IF NOT EXISTS User_Roles (
User_Role_ID			INT UNSIGNED  NOT NULL AUTO_INCREMENT,
User_Role_Description	VARCHAR(50),
PRIMARY KEY	  (User_Role_ID)
);

CREATE TABLE IF NOT EXISTS Backlog_Note (
Backlog_Note_ID			INT UNSIGNED  NOT NULL AUTO_INCREMENT,
PBI_ID			        INT UNSIGNED,
Note					VARCHAR(500),
FOREIGN KEY    (PBI_ID)		REFERENCES Backlog_Items (PBI_ID),
PRIMARY KEY	   (Backlog_Note_ID)
);

CREATE TABLE IF NOT EXISTS Iteration_Note (
Iteration_Note_ID		INT UNSIGNED  NOT NULL AUTO_INCREMENT,
Iteration_ID	        INT UNSIGNED,
Note					VARCHAR(500),
PRIMARY KEY		(Iteration_Note_ID)
);