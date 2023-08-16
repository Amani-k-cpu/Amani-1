CREATE OR ALTER TRIGGER EmpSalCheck ON Employees FOR UPDATE 
AS
BEGIN
DECLARE @old_salary DECIMAL(18, 2);
DECLARE @new_salary DECIMAL(18, 2);

SELECT @old_salary = Salary FROM deleted;
SELECT @new_salary = Salary FROM inserted;
IF @old_salary > @new_salary
BEGIN
PRINT 'NEW SALARY CANNOT BE LESS THAN OLD SALARY';
ROLLBACK;
END;

END;
UPDATE Employees SET Salary = Salary - 500;
UPDATE Employees SET Salary = Salary + 500;