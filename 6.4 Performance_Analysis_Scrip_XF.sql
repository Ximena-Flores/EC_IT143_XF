---------Performance Analysis-----
------------------------------------

--Q1:
USE AdventureWorks2022;
GO

SELECT *
FROM Person.Address
WHERE City = 'London';

--Est. Subtree cost 0.27745
/*
Faltan detalles del índice de SQLQuery1.sql - localhost.AdventureWorks2022 (XIMENADNL\xime4 (75))
El procesador de consultas estima que la implementación del siguiente índice podría mejorar el costo de la consulta en un 93.2298%.
*/

/*
USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Person].[Address] ([City])

GO
*/


--To avoid errors
DROP INDEX IX_Address_City
ON Person.Address;
GO
------------------------------------
USE [AdventureWorks2022]
GO
 CREATE NONCLUSTERED INDEX INX_Address_City
ON Person.Address (City);
GO

--Est. Subtree cost

--	Q2:
SELECT *
FROM Person.Person
WHERE FirstName = 'John';

--Est.Subtree cost 0.31319
--Missing Index impact (impacto 91.6702): 
/*
Faltan detalles del índice de SQLQuery1.sql - localhost.AdventureWorks2022 (XIMENADNL\xime4 (86))
El procesador de consultas estima que la implementación del siguiente índice podría mejorar el costo de la consulta en un 91.6702%.
*/

/*
USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Person].[Person] ([FirstName])

GO
*/

USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX IX_Person_FirstName
ON [Person].[Person] ([FirstName])