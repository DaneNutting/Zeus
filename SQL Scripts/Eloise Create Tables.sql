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

