ALTER TABLE Backlog_Items
ADD FOREIGN KEY (Priority_ID) REFERENCES Priority (Priority_ID),
ADD FOREIGN KEY (State_ID) REFERENCES States (State_ID),
ADD FOREIGN KEY (Iteration_ID) REFERENCES Iteration (Iteration_ID),
ADD FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID);

ALTER TABLE Users
FOREIGN KEY (User_Role_ID) REFERENCES User_Roles (User_Role_ID);

ALTER TABLE Project_Note
FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID);

ALTER TABLE Release_Note
FOREIGN KEY (Release_ID) REFERENCES Releases (Release_ID);

ALTER TABLE Task_Note
FOREIGN KEY (Task_ID) REFERENCES Task (Task_ID);

ALTER TABLE Iteration
FOREIGN KEY  (Release_ID) REFERENCES Releases (Release_ID);

ALTER TABLE Releases
FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID);

ALTER TABLE Task
FOREIGN KEY  (Assignee) REFERENCES Users (User_ID),
FOREIGN KEY  (State_ID) REFERENCES States (State_ID),
FOREIGN KEY  (Iteration_ID) REFERENCES Iteration (Iteration_ID),
FOREIGN KEY  (PBI_ID) REFERENCES Backlog_Items (PBI_ID);

ALTER TABLE Backlog_Note
FOREIGN KEY (PBI_ID) REFERENCES Backlog_Items (PBI_ID);