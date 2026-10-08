/*
    --Q2: How to keep track of when a record was last modified?
A2: Maybe using an after update trigger


    Q3: Did it work?
    A3: Let's test the trigger and verify the results.
*/

-- View current data
SELECT *
FROM dbo.t_hello_world;

-- Update a record
UPDATE dbo.t_hello_world
SET current_date_time = GETDATE()
WHERE my_message = 'Hello World';

-- Verify trigger results
SELECT *
FROM dbo.t_hello_world;


/*
    Results:

    The trigger executed successfully.

    The last_modified_date column was updated
    with the current date and time.

    The last_modified_by column was updated
    with the current SQL Server user.

    Results were as expected.
*/