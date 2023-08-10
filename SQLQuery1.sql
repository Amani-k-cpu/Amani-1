CREATE TABLE Student(
StudentId INT NOT NULL PRIMARY KEY,
Name NVARCHAR(50) NOT NULL ,
Location NVARCHAR(50) NOT NULL,
Email NVARCHAR(50)) NOT NULL);

INSERT INTO Student VALUES (3, 'amani', 'muscat', 'a@gmail.com');
select * from Student;
EXEC sp_help 'Student'
ALTER DATABASE makeenDB MODIFY NAME = SQL_DB;
exec sp_rename Student, Sid;
exec sp_renamedb SQL_DB, SQL;
alter table Sid ADD number numeric(4);
alter table Sid alter column Location NVARCHAR (60);
alter table Sid alter column StudentId INT NOT NULL;
alter table Sid add constraint CON_NAME PRIMARY KEY (StudentId);

CREATE TABLE Course1(
c_Id char(4) CONSTRAINT course_id PRIMARY KEY,
Name NVARCHAR(50) NOT NULL);


ALTER TABLE Course1 ADD CONSTRAINT student_c FOREIGN KEY (c_Id) REFERENCES Course(c_Id);
SELECT TABLE_NAME,
       CONSTRAINT_TYPE,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='Sid'


ALTER TABLE Sid DROP CONSTRAINT PK__Student__32C52B994E6D9988;

SELECT SYSDATETIME() AS today_s;
SELECT CONVERT (date, SYSDATETIME() );

CREATE TABLE Employee(
e_Id INT NOT NULL PRIMARY KEY,
e_Name NVARCHAR(50) NOT NULL) ;

 create table company(
 id INT NOT NULL PRIMARY KEY,
 p_name NVARCHAR (20) NOT NULL,
 countity NVARCHAR (20) NOT NULL,
 price NUMERIC NOT NULL);

 INSERT INTO company VALUES (1, 'water', 2, 200);
 select * from company;

 SELECT countity*price as totalprice from company where p_name= 'water';
 INSERT INTO company VALUES (2, 'juice', 3, 200);
 UPDATE company SET p_name= (
 SELECT p_name FROM company 
 WHERE id = 1) WHERE id = 2;
 BEGIN TRANSACTION;
UPDATE company SET price = 400 WHERE id = 1;
 
COMMIT;
ROLLBACK; 
SELECT SUM (countity) AS total_product FROM company;