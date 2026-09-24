/******************************************************************************
Author: Ximena
C**rse: IT143
Assignment: W4.2 Final**roject
******************************************************************************/

ALTER TABLE dbo.t_education_level_count
ALTER COLUMN education_level NVARCHAR(50) NOT NULL;
GO

ALTER TABLE dbo.t_education_level_count
ADD CONSTRAINT PK_t_education_level_count
PRIMARY KEY (education_level);
GO