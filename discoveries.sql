--create table test(
--a int,
--b varchar (50),
--c decimal (18,5),
--)



--insert into test values

--(1, 'one', 1.782),
--(2, 'two', 2.722),
--(3, 'three', 3.752)



--select round(c, -1) as ghd, * from test WHERE c BETWEEN 20.7 AND NULL

--SELECT OBJECTPROPERTY(Object_ID, 'IsUserTable') , * FROM SYS.OBJECTS WHERE is_ms_shipped<>1 ORDER BY OBJECT_ID 
--SELECT * FROM SYS.COLUMNS WHERE is_ms_shipped<>1

--BEGIN TRY
--BEGIN TRAN
--UPDATE test set a = 1 where b = 'one'
--PRINT 'hI1'
--begin transaction
--UPDATE TEST SET A = 3 WHERE B = 'THREE'
--PRINT 'hI2'
--begin transaction
--UPDATE TEST SET A = 2 WHERE B = 'TWO'
--PRINT 'hI3'
--PRINT @@TRANCOUNT
--COMMIT;
--PRINT 'hI3A'
----DECLARE @A  INT 
----SET @A  = CAST('DSF' AS INT)
--PRINT @@TRANCOUNT
--COMMIT;
--PRINT 'hI3B'
--PRINT @@TRANCOUNT
--if @@TRANCOUNT >0
--  rollback tran
----COMMIT 
--PRINT @@TRANCOUNT
--END TRY
--BEGIN CATCH
--PRINT 'ERROR:' + cast(@@eRROR AS VARCHAR(50))+ ' ERRORLINE:'+CAST(ERROR_LINE() AS VARCHAR(20))+' ERRORMESSAGE:'+ERROR_MESSAGE() +  ' TRANCOUNT:' + CAST(@@TRANCOUNT AS VARCHAR(50))

--IF @@ERROR >0
--  print error_MESSAGE()
----if @@TRANCOUNT >0
----  rollback tran

--END CATCH


--SELECT * FROM TEST



------------------------------------------------------

--CREATE TABLE PRODUCTS
--(MFR_ID CHAR(3),
--PRODUCT_ID CHAR(5),
--DESCRIPTION VARCHAR(20),
--PRICE MONEY,
--QTY_ON_HAND INTEGER)


--INSERT INTO PRODUCTS (MFR_ID, PRODUCT_ID, DESCRIPTION, PRICE, QTY_ON_HAND)
--VALUES ('ACI', '41007', 'Size 7 Widget', 225.00, 250)





--alter table test  alter column a int not null

--alter table test add  primary key (a)

--go
--CREATE table testchild
--(
--e int foreign key references test(a),
--F int
--)
--INSERT INTO testchild VALUES (NULL, 1)
--INSERT INTO testchild VALUES(7, 5)
--INSERT INTO testchild VALUES(9, 5)
--INSERT INTO testchild VALUES(9, 7)

--alter table test add constraint pknotnull check(a is not null)
--alter table test drop constraint pknotnull
--alter table test add d char(1) not null default 'd'
--alter table test alter column d char(1) null
--alter table test drop column d -- important it did not allow to drop when default constraint was active

--select * from sys.objects 
--where is_ms_shipped <> 1 
--and type_desc = 'default_constraint' and parent_object_id = (select object_id from sys.objects where name = 'test' and is_ms_shipped<>1)

--select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
--select * from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
--select * from INFORMATION_SCHEMA.DOMAIN_CONSTRAINTS
--select * from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
--select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS	
--select * from INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE
--select * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE


--SET ANSI_NULL ON
--SELECT * FROM testchild WHERE E = NULL


----HOW NULL CONSIDERED IN AGGREGATE
--SELECT COUNT(*) FROM testchild
--SELECT COUNT(E) FROM testchild
--SELECT AVG(E) FROM testchild
--SELECT SUM(E) FROM testchild
--SELECT MIN(E) FROM testchild
--SELECT MAX(E) FROM testchild
--SELECT * FROM TESTCHILD

--SELECT e, MAX(F) FROM testchild GROUP BY E
--SELECT MAX(e), F FROM testchild GROUP BY F
declare @str varchar(max)=  cast((select name + ',' from sys.objects
for xml path('')) as varchar(max))
