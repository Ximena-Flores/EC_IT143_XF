/*
    EC_IT143_6.3_fwt_s1_xf.sql
    Author: Ximena Flores
    Date: 2026-10-07

    Question:
    How can I automatically track when a record was last modified?
*/

ALTER TABLE dbo.t_hello_world
ADD last_modified_date DATETIME DEFAULT GETDATE ();

--Q2: How to keep track of when a record was last modified?

