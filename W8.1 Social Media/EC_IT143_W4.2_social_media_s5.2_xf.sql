--Refine your table (Primary Key)
ALTER TABLE dbo.t_social_media_platform_count
ALTER COLUMN Primary_Platform NVARCHAR(50) NOT NULL;
GO

ALTER TABLE dbo.t_social_media_platform_count
ADD CONSTRAINT PK_t_social_media_platform_count
PRIMARY KEY (Primary_Platform);
GO