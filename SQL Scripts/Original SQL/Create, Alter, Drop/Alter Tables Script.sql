ALTER TABLE Backlog_Items
ADD FOREIGN KEY (Priority_ID) REFERENCES Priority (Priority_ID),
ADD FOREIGN KEY (State_ID) REFERENCES States (State_ID),
ADD FOREIGN KEY (Iteration_ID) REFERENCES Iteration (Iteration_ID),
ADD FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID);

ALTER TABLE Users
ADD FOREIGN KEY (User_Role_ID) REFERENCES User_Roles (User_Role_ID);

ALTER TABLE Project_Note
ADD FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID);

ALTER TABLE Release_Note
ADD FOREIGN KEY (Release_ID) REFERENCES Releases (Release_ID);

ALTER TABLE Task_Note
ADD FOREIGN KEY (Task_ID) REFERENCES Task (Task_ID);

ALTER TABLE Iteration
ADD FOREIGN KEY  (Release_ID) REFERENCES Releases (Release_ID);

ALTER TABLE Releases
ADD FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID);

ALTER TABLE Task
ADD FOREIGN KEY  (Assignee) REFERENCES Users (User_ID),
ADD FOREIGN KEY  (State_ID) REFERENCES States (State_ID),
ADD FOREIGN KEY  (Iteration_ID) REFERENCES Iteration (Iteration_ID),
ADD FOREIGN KEY  (PBI_ID) REFERENCES Backlog_Items (PBI_ID);

ALTER TABLE Backlog_Note
ADD FOREIGN KEY (PBI_ID) REFERENCES Backlog_Items (PBI_ID);