DROP TABLE IF EXISTS feedback;
GO
DROP TABLE IF EXISTS education_program;
GO
DROP TABLE IF EXISTS job;
GO
DROP TABLE IF EXISTS organization_resource;
GO
DROP TABLE IF EXISTS equality_action;
GO
DROP TABLE IF EXISTS form;
GO
DROP TABLE IF EXISTS participant;
GO
DROP TABLE IF EXISTS organization;
GO


CREATE TABLE participant (
PartID INT NOT NULL,
Name VARCHAR(100) NOT NULL,
Age INT NOT NULL,
Email VARCHAR(100) NOT NULL,
Location VARCHAR(100) NOT NULL,
PRIMARY KEY (PartID)
);
GO
CREATE TABLE organization (
OrgID VARCHAR(4) NOT NULL,
Name VARCHAR(60) NOT NULL,
ContactInfo VARCHAR (100) NOT NULL,
Category VARCHAR (100) NOT NULL,
PRIMARY KEY (OrgID)
);
GO
CREATE TABLE job (
JobID INT NOT NULL,
Title VARCHAR(100) NOT NULL,
Salary NUMERIC(6,2) NOT NULL,
OrgID VARCHAR(4) NOT NULL,
PRIMARY KEY (JobID),
FOREIGN KEY (OrgID) REFERENCES organization(OrgID)
);
GO
CREATE TABLE form (
FormID VARCHAR(3) NOT NULL,
Date DATE NOT NULL,
Status VARCHAR(30) NOT NULL,
JobID INT NOT NULL,
PartID INT NOT NULL,
PRIMARY KEY (FormID),
FOREIGN KEY (JobID) REFERENCES Job (JobID),
FOREIGN KEY (PartID) REFERENCES participant (PartID)
);
GO
CREATE TABLE organization_resource (
OrgResID INT NOT NULL,
Type VARCHAR(50) NOT NULL,
Description TEXT NOT NULL,
Availability NUMERIC(1) NOT NULL,
OrgID VARCHAR(4) NOT NULL,
PRIMARY KEY (OrgResID),
FOREIGN KEY (OrgID) REFERENCES Organization (OrgID)
);
GO
CREATE TABLE equality_action (
EqualityID INT NOT NULL,
Date DATE NOT NULL,
Status VARCHAR (30) NOT NULL,
PartID INT NOT NULL,
OrgResID INT NOT NULL,
PRIMARY KEY (EqualityID),
FOREIGN KEY (PartID) REFERENCES participant (PartID),
FOREIGN KEY (OrgResID) REFERENCES organization_resource (OrgResID)
);
GO
CREATE TABLE education_program (
ProgramID INT NOT NULL,
Name VARCHAR(100) NOT NULL,
Description TEXT NOT NULL,
OrgID VARCHAR(4) NOT NULL,
PRIMARY KEY (ProgramID),
FOREIGN KEY (OrgID) REFERENCES Organization (OrgID)
);
GO
CREATE TABLE feedback (
FeedbackID INT NOT NULL, Comments TEXT NOT NULL,
Rating TINYINT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
OrgID VARCHAR(4) NOT NULL,
PartID INT NOT NULL,
PRIMARY KEY (FeedbackID),
FOREIGN KEY (PartID) REFERENCES participant (PartID),
FOREIGN KEY (OrgID) REFERENCES Organization (OrgID)
);
GO
