CREATE OR ALTER TRIGGER EmpSalCheck ON Customer FOR UPDATE 
AS
BEGIN
DECLARE @newcity NVARCHAR(40);
DECLARE @oldcity NVARCHAR(40);

SELECT @newcity = City from inserted;
SELECT @oldcity = City from deleted;
IF @newcity != @oldcity
BEGIN
PRINT 'NO MATCH';
ROLLBACK;
END;

END;
UPDATE Customer set City = 'Berlin' where id = 1;
UPDATE Customer set City = 'Bern' where id = 13;
select * from Customer; 
-------------------------------------------------------------------
