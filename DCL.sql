CREATE ROLE admin;
CREATE ROLE training_manager;
CREATE ROLE instructor;
CREATE ROLE student;

GRANT CONTROL ON SCHEMA::dbo TO training_manager;
GRANT CONTROL ON SCHEMA::dbo TO admin;

GRANT SELECT ON dbo.Intake TO instructor;
GRANT SELECT ON dbo.Branch TO instructor;
GRANT SELECT ON dbo.Student TO instructor;
GRANT SELECT ON dbo.Class To instructor;


GRANT INSERT , UPDATE, DELETE ON dbo.Intake to training_manager;

GRANT INSERT , UPDATE, DELETE ON dbo.Branch to training_manager;

GRANT INSERT , UPDATE, DELETE ON dbo.Student to training_manager;

GRANT INSERT , UPDATE, DELETE ON dbo.Class to training_manager;
