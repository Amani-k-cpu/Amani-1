BEGIN
 DECLARE @FirstName nVARCHAR(10);
 DECLARE @LastName nVARCHAR(20);
 
 SELECT @FirstName = FirstName, @LastName = LastName FROM Employees WHERE EmployeeID = 2;

 PRINT 'Customer with id 4' + @FirstName + ' ' + @LastName;

end
----------------------------------------
BEGIN
  DECLARE @price NUMERIC(12, 2);
  SELECT  @price = UnitPrice FROM Products WHERE ProductID = 38;
  IF  @price >= 100
      PRINT 'EXPENSIVE';

  ELSE
    PRINT 'NOT EXPENSIVE';  END
----------------------------------------
BEGIN
  DECLARE @priceUnite NUMERIC(12, 2) = 70;
  
   IF  @priceUnite >= 50
   SELECT * FROM Products WHERE UnitPrice >= 50;
   ELSE
   SELECT * FROM Products WHERE UnitPrice < 50;  END

SELECT CompanyName, Country =
     case Country
	   when 'UK' THEN 'United kindom'
       when 'USA' THEN 'United state'
	   else Country
	end
from Suppliers;
----------------------------------------
select * from Suppliers;

select Country, Fax =
  case 
  when Fax IS NULL then 'notfound'
  else Fax
  end
from Suppliers;

select * from Products;
----------------------------------------
select Discontinued, ProductName =
  case Discontinued
     when 0 then 'no'
	 when 1 then 'yes'
     
  end
from Products;
----------------------------------------
BEGIN
   DECLARE @price1 NUMERIC(12, 2);
   DECLARE @id INT = 30;
   WHILE @id <= 40
    BEGIN
	  SELECT @price1 = UnitPrice FROM Products
	  WHERE ProductID = @id;
	  IF @price1 >= 100
	     PRINT 'expensive';
	  ELSE
	     PRINT'not expensive';
	  SET @id = @id + 1;
	END
end
----------------------------------------
DECLARE @counter INT = 1;
DECLARE @MaxCount INT = 10;
WHILE @counter <= @MaxCount
BEGIN 

PRINT 'COUNTER: ' + CAST (@counter AS VARCHAR);
SET @counter = @counter + 1;
IF @counter > 5
BREAK
END
----------------------------------------
DECLARE @NUM INT = 1;
DECLARE @MaxCount1 INT = 10;
WHILE @NUM <= @MaxCount1
BEGIN 
IF @NUM %3 = 0
BEGIN
SET @NUM = @NUM + 1;
CONTINUE;
END
PRINT 'COUNTER: ' + CAST (@NUM AS VARCHAR);
SET @NUM = @NUM + 1;
END
----------------------------------------
BEGIN TRY
    SELECT 1/0
END TRY
BEGIN CATCH 
    SELECT
     @@ERROR AS ERROR,
     ERROR_MESSAGE()AS ErrorMessage;
END CATCH
----------------------------------------
DECLARE @customerId NVARCHAR(5);
DECLARE @fname NVARCHAR(40);
DECLARE @city NVARCHAR(15);

DECLARE v_customer_cursor CURSOR FOR
  SELECT CustomerID, CompanyName, City from Customers where Country = 'uk';
  open v_customer_cursor;
  fetch next from v_customer_cursor into @customerId, @fname, @city;
  while @@FETCH_STATUS = 0
  begin
  print 'customer: ' + CAST(@customerId AS VARCHAR) + '=> '+ @fname + 'FROM' + @city;
  FETCH NEXT FROM v_customer_cursor INTO @customerId, @fname , @city;
  END;
  CLOSE v_customer_cursor ;
  DEALLOCATE v_customer_cursor ;

----------------------------------------
DECLARE @SupplierId INT;
DECLARE @CompanyName NVARCHAR(40);
DECLARE @UnitPrice  INT;
DECLARE @Discontinued INT;
DECLARE Company_cursor CURSOR FOR
SELECT  CompanyName, Discontinued, UnitPrice FROM Products, Suppliers where Discontinued = 1 
AND Products.SupplierID = Suppliers.SupplierID;
open Company_cursor;
fetch next from Company_cursor INTO  @CompanyName, @UnitPrice, @Discontinued;
while @@FETCH_STATUS = 0
begin
print @CompanyName + 'Discontinued ' + CAST(@Discontinued  AS NVARCHAR) +'UnitPrice' + CAST(@UnitPrice AS NVARCHAR);
FETCH NEXT FROM Company_cursor INTO @CompanyName, @Discontinued, @UnitPrice;
END;
  CLOSE Company_cursor ;
  DEALLOCATE Company_cursor ;
----------------------------------------
