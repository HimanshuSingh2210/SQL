--PROGRAMS

--T-SQL
--tansact-sql

--generally their are two type of refrences
--1.PROCEDURE
--2.FUNCTION

--a program is needed to execute the number of sql statement in one go

--PROCEDURE	programing
--syntax-create-procedure-procedurename
--       as
--       begin
--
--
--
--	     end


--for execution 
--
--exec--prodecurename

--and keep in mind procedure name should not repeate

---------------------------------------------------------

--1
create procedure ABCDE
as
begin 
	select * from emp where deptno=10
end
---------------------------------------------------------
exec ABCDE
---------------------------------------------------------

--2

create procedure sp_example01
as
begin 
	select * from emp where deptno in(10,30)
end
------------------------------------------------------------
exec sp_example01
------------------------------------------------------------

--3

create procedure sp_eg02(@dept int)
or
create procedure sp_eg02(@x int)
as 
begin
select * from emp where deptno=@x
end

-------------------------------------------------------------
exec sp_eg02 10
exec sp_eg02 20
--------------------------------------------------------------

--4
create procedure sp_eg03 (@x varchar(40))
as begin 
select * from emp where job like @x
end

----------------------------------------------------------------
execute sp_eg03 clerk
execute sp_eg03 analyst
----------------------------------------------------------------

--5

create procedure sp_eg04 (@x int,@y varchar(40))
as begin
select* from emp where deptno=@x and job like @y
end

------------------------------------------------------------------
execute sp_eg04 10,clerk
execute sp_eg04 20,analyst
------------------------------------------------------------------

--6

create procedure sp_eg05(@x int)
as begin
if exists (select *from emp where deptno=10)
print 'records found'
else 
print 'records not found'
end

execute sp_eg05 10





