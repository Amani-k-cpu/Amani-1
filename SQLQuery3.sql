/*Table of northwind*/ 
CREATE OR ALTER PROCEDURE read_products_procedure @pCity AS NVARCHAR (40) AS BEGIN DECLARE @city_name NVARCHAR(40) = @pCity;
SELECT * FROM Suppliers WHERE City = @city_name;
END
EXEC read_products_procedure 'New Orleans';
-----------------------------------------------------------------------------------------------------------------
/*Table of northwind*/ 
CREATE OR ALTER PROCEDURE product_details @Id INT, @productName NVARCHAR(40) OUTPUT, @Price NUMERIC(12, 2) OUTPUT
AS
BEGIN 
SELECT @productName = ProductName,@price = UnitPrice FROM Products WHERE ProductID = @Id;
END


BEGIN 
DECLARE @name NVARCHAR(40);
DECLARE @price NUMERIC(12, 2);
EXEC product_details 11, @name OUTPUT, @price OUTPUT;
PRINT @name;
PRINT @price;
END
-----------------------------------------------------------------------------------------------------------------
/*Table of sales*/ 
CREATE OR ALTER PROCEDURE product_customer @Id INT = 11, @FirstName NVARCHAR(40) OUTPUT, @LastName NVARCHAR(40) OUTPUT, @phone NVARCHAR(20) OUTPUT, @city NVARCHAR(40) OUTPUT
AS
BEGIN 
SELECT @FirstName = FirstName, @LastName = LastName, @phone = Phone, @city = City FROM Customer WHERE Id = @Id;
END


BEGIN 
DECLARE @FirstName NVARCHAR(40);
DECLARE @LastName NVARCHAR(40);
DECLARE @phone NVARCHAR(20);
DECLARE @city NVARCHAR(40);
EXEC product_customer default, @FirstName OUTPUT,  @LastName OUTPUT, @phone Output, @city Output ;
PRINT @FirstName;
PRINT @LastName;
PRINT @phone;
PRINT @city;
END
----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE even_or_odd @num1 NUMERIC(5), @num2 NUMERIC (5), @result NUMERIC(5) OUTPUT 
AS
BEGIN
END


BEGIN
DECLARE @num1 NUMERIC(5);
DECLARE @num2 NUMERIC(5);
DECLARE @result NUMERIC(5);
n1 NUMBER := @result;

IF MOD(n1,2) = 0 THEN
DBMS_OUTPUT.PUT_LINE ('The number. '||n1||' is even number');
ELSE
DBMS_OUTPUT.PUT_LINE ('The number '||n1||' is odd number.');
END IF;
DBMS_OUTPUT.PUT_LINE ('Done Successfully');
------------------------------------------------------------------------------------------------------------------
/*creating function*/
select pi();
CREATE OR ALTER FUNCTION circle_area (@p_radius NUMERIC (10, 2))
RETURNS NUMERIC(8, 2)
AS
BEGIN
DECLARE @v_pi NUMERIC(8, 2) = PI();
DECLARE @v_area NUMERIC(8, 2);
SET @v_area = @v_pi * POWER(@p_radius, 2);
RETURN @v_area;
END;
SELECT DBO.circle_area(4) AS area;
-------------------------------------------------------------------------------------------------------------------
/*fullname_function*/
CREATE OR ALTER FUNCTION first_last_name (@Id INT)
RETURNS NVARCHAR(40)
AS
BEGIN
DECLARE @firstname NVARCHAR(40);
DECLARE @lastname NVARCHAR(40);
DECLARE @fullname NVARCHAR(40);

SELECT @firstname = FirstName, @lastname = LastName FROM Customer WHERE Id = @Id;
SET @fullname = @firstname + @lastname
RETURN @fullname ;
END;

select dbo.first_last_name (10) as fullname;
-------------------------------------------------------------------------------------------------------------------
/*information of city*/
CREATE OR ALTER FUNCTION info_city(@country NVARCHAR(50))
RETURNS TABLE
AS
RETURN
SELECT Id, FirstName, LastName, City  FROM Customer WHERE Country = @country;
Select * FROM dbo.info_city('USA');
-------------------------------------------------------------------------------------------------------------------
/*product of company*/
CREATE OR ALTER FUNCTION info_product_companyname (@id_COM INT)
RETURNS TABLE
AS
RETURN
SELECT Product.Id , ProductName, CompanyName FROM Supplier, Product where Product.SupplierId = Supplier.Id and Supplier.Id = @id_COM;
Select * FROM dbo.info_product_companyname(2);
-------------------------------------------------------------------------------------------------------------------
/*totalSales*/
CREATE OR ALTER FUNCTION total_sales (@year datetime)
RETURNS TABLE
AS
RETURN
SELECT year(OrderDate) as year, Customer.Id, FirstName, LastName, sum(TotalAmount) as total FROM Customer, "Order" 
WHERE "Order".CustomerId = Customer.Id and year(OrderDate) = @year 
group by Customer.Id, FirstName, LastName, year(OrderDate) ;
Select * FROM dbo.total_sales(2013);
-------------------------------------------------------------------------------------------------------------------