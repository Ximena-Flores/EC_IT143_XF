--	Q4: How  to keep track of who last modified a record?
--A4: This works for server user and the initial INSERT...


ALTER TABLE dbo.t_hello_world
ADD last_modified_by VARCHAR (50) DEFAULT SUSER_NAME();
