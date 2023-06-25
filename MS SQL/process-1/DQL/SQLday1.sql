-- DQL data Query language
-- Select
-- is used to get from a table

select * from emp

select empno,ename from EMP

select empno,sal,ename,deptno from emp

select * from EMP
---------------------------------------------------------------------------------
-- Where Clause
 -- it is only to filter rows

Select * from EMP where DEPTNO=10 

Select * from EMP where DEPTNO=10 or DEPTNO=20

-- when we  are filtering apart from integer then we have to mention in '  '

Select * from EMP where JOB='analyst'

Select * from EMP where JOB='manager'

Select * from EMP where JOB='manager' and DEPTNO=10
-----------------------------------------------------------------------------------

-- In,Not in
select * from EMP where DEPTNO in(10,20,30,40)

select * from EMP where DEPTNO not in(10,20)

Select * from EMP where JOB in ('analyst','manager')

Select * from EMP where JOB not in ('analyst','manager')

------------------------------------------------------------------------------------
--Like, not like
-- we generally use this for text column

Select * from EMP where ENAME like 's%' 
--start with s


Select * from EMP where ENAME like '%t'
--end with t

Select * from EMP where ENAME like '%o%'
-- contains o anywhere


Select * from EMP where ENAME not like 's%'
--exclued the names which start with s

select * from EMP where ENAME '%o%'
-- name which excludes o

select * from EMP where ENAME like '____'
--name which have only 4 character

select * from EMP where ENAME like's%t'
-- name start with s and end with t

select * from EMP where MGR in ('7902','7698')
----------------------------------------------------------------------------
--between , not between
-- it is generally used for interger

select * from EMP where  SAL between 3000 and 5000

select * from EMP where  SAL between 1000 and 2000

select * from EMP where  SAL >=3000

select * from EMP where  SAL <=3000

select * from EMP where  HIREDATE <='01-jan-1981' -- yyyy-mm--dd

select * from EMP where  HIREDATE between '01-jan-1981' and '31-mar-1981'

-- is null ,is not null

sp_help emp -- it will give discription of the table

select * from EMP

select * from EMP where COMM is null

select * from EMP where COMM is not null
--------------------------------------------------------------------------------
--operators

--in,not in
--like,not like
--between,not between
--is null,is not null

---------------------------------------------------------------------------
--alias names


select ename as 'employee name',sal as salary from EMP --if their is gap between the name then use single cote ortherwise it will lwork
select sal as salary from EMP

--virtual column(adding temp coloumn)
select sal as salary,sal*12 as 'annual salary' from emp
select sal as salary,sal*12 as 'annual salary',SAL,COMM ,sal+comm as 'total sal' from emp

select sal as salary ,comm ,sal+ISNULL(comm,0) as total from emp
-- in comm where their is null which will be replaced by 0


select sal as salary ,comm ,sal+comm as total from emp
--in this case null will be present their

-----------------------------------------------------------------------------------
--Group by clause
--it is basically the summary of table

select deptno, SUM(sal) as 'total',COUNT(ename)as 'record count' from emp group by DEPTNO
--group by dept no

select job,SUM(sal) as 'total',AVG(sal) as 'avg sal' from EMP group by JOB
--group by job

select job,SUM(sal) as 'total',MAX(sal) as 'max sal',MIN(sal) as 'min sal' from EMP group by job


--sorting with the help of order by
select deptno ,job ,SUM(sal)as total,AVG(sal) as avg from EMP group by DEPTNO,JOB order by deptno

--ascending order(asc)
select deptno ,job ,SUM(sal)as total,AVG(sal) as avg from EMP group by DEPTNO,JOB order by deptno asc

--decending order(desc)
select deptno ,job ,SUM(sal)as total,AVG(sal) as avg from EMP group by DEPTNO,JOB order by deptno desc

---------------------------------------------------------------------

--order by

select * from emp order by DEPTNO 

-----------------------------------------------------------------------------
--distinct

select distinct deptno from EMP

select distinct job from emp


-----------------------------------------------------------------------------------
--create table
create table sample01(eid varchar(5),ename varchar(40))

sp_help sample01


create table sample02(EID VARCHAR(5),sal numeric(10,2),deptno int)

insert into sample02 values ('raj11',998877)

Select * from sample02







