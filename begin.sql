BEGIN
  DECLARE @name VARCHAR(20);
  DECLARE @sal NUMERIC(8, 2);
  Declare @var1 NUMERIC(5);
  SET @name = 'ALI';
  SET @sal = 700;
  SET @var1 = 5;
  
  print @var1;
  print @name + CAST(@sal AS NVARCHAR);
  END
BEGIN
DECLARE @width NUMERIC(5);
DECLARE @hight NUMERIC(5);

SET @width = 4 ;
SET @hight = 4 ;
PRINT @width *  @hight;

END