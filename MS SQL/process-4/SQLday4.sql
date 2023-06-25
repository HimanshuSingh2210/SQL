--DATE & TIME FUNCTION

select hiredate,YEAR(hiredate) year,MONTH(hiredate) month,DAY(hiredate) day from emp
---------------------------------------------------------------------------------------------------

--DATEPART
--o/p will be always numeric
--1 is sunday and 7 is saturday

select hiredate, datepart(weekday,hiredate) as weekday,
datepart(year,hiredate) year,
datepart(MONTH,hiredate) month, 
datepart(WEEK,hiredate) week
from emp

-----------------------------------------------------------------------

--DATENAME
--o/p will be in varchar/text

select hiredate, datename(weekday,hiredate) as weekday,
datename(year,hiredate) year,
datename(MONTH,hiredate) month, 
datename(WEEK,hiredate) week
from emp

------------------------------------------------------------------------

--DATEADD

select hiredate, dateadd(weekday,3,hiredate) as weekday,
dateadd(year,2,hiredate) year,
dateadd(MONTH,2,hiredate) month, 
dateadd(WEEK,3,hiredate) week
from emp

--------------------------------------------------------------------------

select GETDATE()--current date and time in local timezone
select SYSDATETIME()

---------------------------------------------------------------------------

--DATEDIFF

select hiredate,DATEDIFF(year,hiredate,getdate()) as 'year diff',
DATEDIFF(month,hiredate,getdate()) as 'month diff'
from emp

---------------------------------------------------------------------------
--EOMONTH
select hiredate,eomonth(hiredate,0)as 'added 0 month',
eomonth(hiredate,1)as 'added 1 month'
from emp

---------------------------------------------------------------------------

--SWITCHOFFSET
--for changing time zone

--TODATETIMEOFFSET

----------------------------------------------------------------------------
--DATEFROMPARTS--yeh sab alag alag hai isko yeh date mein convert karega
select DATEFROMPARTS(2022,11,09) as 'combine date'

--DATETIME2FROMPART--yeh sab alag alag hai isko yeh date aur time mein convert karega
select DATETIME2FROMPARTS(2022,11,09,21,20,20,0,2) as 'combine whole'

--TIMEFROMPARTS--yeh sab alag alag hai isko yeh time mein convert karega
select TIMEFROMPARTS(21,20,20,59,2) as 'combine time'

--------------------------------------------------------------------------------
--STRING FUNCTION
--it can be used only for column containing text

--CONCATINATING--jodega

select ename,job,ename+job 'concatinate' from emp

select ename,sal,job,ename+sal from EMP
--this will not work

select ename,sal,job,ename+ cast(sal as varchar) from EMP
--we can  use cast to change datatype
-------------------------------------------------------------------------------------
--LOWER--it will convert everthing in lowercase

select ename,LOWER(ename) as 'lowercase' from emp

--------------------------------------------------------------

 --UPPER-it will convert everthing in uppercase

select ename,UPPER(ename) as 'uppercase' FROM EMP

------------------------------------------------------------------

--REVERSE-it will show in reverse eg DHONI=INOHD

select ename,REVERSE(ename) as 'reverse'from emp

------------------------------------------------------------------

--LEFT--it will show ony 2 character from left side

select ename,LEFT(ENAME,2) AS 'LEFT' FROM EMP

----------------------------------------------------------------------

--RIGHT--it will show ony 2 character from right side

select ename,RIGHT(ENAME,2) AS 'RIGHT' FROM EMP

-----------------------------------------------------------------------


--SUBSTRING--it will start from 2 and end in 3

select ename,SUBSTRING(ENAME,2,3) AS 'SUBSTRING' FROM EMP

------------------------------------------------------------------------

--LTRIM--trim the left side extra space

select ename,LTRIM(ENAME) AS 'LTRIM' FROM EMP

------------------------------------------------------------------------

--RTRIM-trim the right side extra space

select ename,RTRIM(ENAME) AS 'RTRIM' FROM EMP

-------------------------------------------------------------------------

--TRIM--it is a combination of left and right trim

select LTRIM('         abcd     efgh     '),
RTRIM('         abcd     efgh     '),
TRIM('         abcd     efgh     ')

---------------------------------------------------------------------------

--LEN-show us the length

select ename,LEN(ENAME) AS 'LENGTH' FROM EMP

----------------------------------------------------------------------------
-----------------------------------------------------------------------------

--Pehla upper baki sab chota

select ename,UPPER(left(ename,1))+LOWER(right(ename,len(ename)-1)) from emp
----------------------------------------------------------------------
select ename,
LOWER(ename) as 'lowercase',
UPPER(ename) as 'uppercase',
REVERSE(ename) as 'reverse',
LEFT(ENAME,2) AS 'LEFT',
RIGHT(ENAME,2) AS 'RIGHT',
SUBSTRING(ENAME,2,3) AS 'SUBSTRING',
LTRIM(ENAME) AS 'LTRIM',
RTRIM(ENAME) AS 'RTRIM',
UPPER(left(ename,1))+LOWER(right(ename,len(ename)-1)),
len(ename) as  'length'
FROM EMP

-------------------------------------------------------------------------------


select sal+'$' from emp
--this will not work

--CAST--it will convert any datatype to anyother datatype

select CAST(sal as varchar)+'$' from emp
--this will work after changing datatype

select CAST(sal as varchar)+' SALARY' from emp

-------------------------------------------------------------------------
--CONVERT

select convert(varchar,sal)+' SALARY' from emp

------------------------------------------------------------------------

select CAST(hiredate as varchar) as 'cast hiredate',
convert(varchar,hiredate,101)as 'convert hiredate',
convert(varchar,hiredate,102)as 'convert hiredate'
from emp

--101 mm/dd/yyyy
--102 yyyy.mm.dd
--103 dd/mm/yyy
--106 dd mon yyyy
--107 mon dd,yy

--------------------------------------------------------------------------

--CHOOSE

select hiredate,
datepart(WEEKDAY,hiredate),
CHOOSE(datepart(weekday,hiredate),'sun','mon','tue','wed','thur','fri','sat') 
from emp

------------------------------------------------------------------------

--ISNULL

SELECT SAL,ISNULL(COMM,0) FROM EMP

-------------------------------------------------------------------------

--ISNUMERIC
--number raha toh 1 aaega
--number nahi raha toh 0 aaega

select ISNUMERIC(sal) from emp

select ISNUMERIC(comm) from emp

-------------------------------------------------------------------------

--ISDATE


select ISDATE(hiredate) from emp
--this will not work

sp_help emp

select ISDATE(cast(hiredate as datetime)) from emp
--this will work

---------------------------------------------------------------------------
 
 --IIF

 select deptno,
 IIF(deptno=10,'hr','others') from emp order by deptno

 --nested iif

 select deptno,
 IIF(deptno=10,'hr','others'),
 IIF(deptno=20,'analyst','others'),
 IIF(deptno=10,'hr',IIF(deptno=20,'analyst',IIF(deptno=30,'dev','others')))
 from emp order by deptno

 -------------------------------------------------------------------------------------

 --SYSTEM FUNCTION
 --
--TRY_CAST
--TRY_CONVERT

 select CAST(comm as int) from emp

 select CAST(ename as int) from EMP
 --it will not work and it will show error

 select try_CAST(ename as int) from EMP
 --but it will work and show as null

 select CONVERT(int,ENAME) from emp
 --it will not work and it will show error

 select TRY_CONVERT(int,ENAME) from emp
 --but it will work and show as null

 ----------------------------------------------------------------------

 --WINDOWS_FUNCTION
 --1.RANK
 --2.DENSE_RANK
 --3.FIRST_VALUE
 --4.LAST_VALUE
 --5.LEAD
 --6.LAG
 --7.ROW_NUMBER
 --8.NTILE
 --9.PERCENT_RANK

 ------------------------------------------------------------------------

 --RANK
 --it will apply only for numerical val

 select sal,RANK() over (order by sal) as 'salary ranking' from emp


 select sal,RANK() over (order by sal desc) as 'salary ranking' from emp

 ------------------------------------------------------------------------------
 --partition mein rank karega
 --it is just grouping and then ranking

select Deptno,sal, Rank() over (Partition by Deptno order by sal desc) from emp

select Job,sal, Rank() over (Partition by Job order by sal desc) from emp

--------------------------------------------------------------------------------

-- DENSE_RANK
--yeh ranking skip nahi karega agar 2 janke same rahe toh

select sal,DENSE_RANK() over (order by sal desc) as Dense_Rank_Fun,
Rank() Over (order by sal desc) as Rank_Fun from emp

select Deptno, Ename,DENSE_RANK() over (partition by deptno order by sal desc) as Dense_Rank_Fun,
Rank() Over (PARTITION by deptno order by sal desc) as Rank_Fun
from emp

-----------------------------------------------------------------------------------------------------------------


-- FIRST VALUE

select Job ,DEPTNO, Sal ,FIRST_VALUE(Job) over ( order by sal desc) from emp

select DEPTNO, Sal ,FIRST_VALUE(deptno) over ( order by sal desc) from emp


select Job ,DEPTNO, Sal ,FIRST_VALUE(Job) over(partition by Deptno order by sal desc) from emp 

select DEPTNO, Sal ,FIRST_VALUE(deptno) over(partition by Deptno order by sal desc) from emp 


----------------------------------------------------------------------------------------------------------------

--LAST_VALUE

select job, deptno, sal, LAST_value(job) over(partition by deptno order by sal desc) from emp
--it will not work

select Job ,DEPTNO, Sal ,LAST_VALUE(Job) over(partition by Deptno order by sal desc  
RANGE BETWEEN  UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING )
from emp 
--it is only for last_value we have to use this syntax
--by this we limit the values and let them use that only

-----------------------------------------------------------------------------------------

-- LEAD--jitna likha utne ke baad ka dikhega
--it will skip the offset value

select *, lead(sal,1) over (order by sal desc) from emp
--yaha 1 baad wala dikehega

select *, lead(sal,2) over (order by sal desc) from emp
--yaha 2 ke baad ka dikhega


------------------------------------------------------------------------------------
--- LAG--yaha jitna likha utna piiche ka dhekga
--it will lag the offset value

select *, lag(sal,1) over (order by sal desc) from emp

-------------------------------------------------------------------------------------

-- ROW_NUMBER --just numbering karega row ko
--it will provide serial number to the row


select *, ROW_NUMBER() over (order by sal desc) from EMP

select DEPTNO, ROW_NUMBER() over (partition by Deptno order by sal desc) from emp

select *, ROW_NUMBER() over (partition by Deptno order by sal desc) from emp

--------------------------------------------------------------------------------------

-- NTILE--dividing the data into group what we have mentioned it can be equal or unequal as well



select *, NTILE(3) over (order by sal desc) from emp
select *, NTILE(4) over (order by sal desc) from emp


select *, NTILE(4) over(partition by deptno order by sal desc) from emp

---------------------------------------------------------------------------------

-- PERCENT_RANK--it will do internal calculation and give rank

select  Sal,PERCENT_RANK() over ( order by sal desc) from emp

select Deptno ,Sal, PERCENT_RANK() over(partition by deptno order by sal asc) from emp
