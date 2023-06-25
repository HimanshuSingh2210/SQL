--OPERATORS
--operators are going to use when we want to append the query

--1.UNION
--2.UNION ALL
--3.INTERSECT
--4.EXCEPT



---------------------------------------------------------
--UNION
--will remove duplicate after appending

select * from EMP where DEPTNO=10
union
select * from EMP where JOB like 'clerk'

-----------------------------------------------------

--UNION ALL
--do not remove duplicates
--just append two query

select * from EMP where DEPTNO=10
union all
select * from EMP where JOB like 'clerk'

-------------------------------------------------------

--INTERSECT
--common record which is present in both the queries will reflect

select * from EMP where DEPTNO=10
intersect
select * from EMP where JOB like 'clerk'

---------------------------------------------------------------

--EXPECT
--records present in first query
--if record in first query is repeated in 2nd then it will not reflect

select * from EMP where DEPTNO=10
except
select * from EMP where JOB like 'clerk'

----------------------------------------------------------------

--TOP
--it is not highest it is the top 3 record from the table

select top 3 sal from EMP order by SAL desc
-----------------------------------------------------------------------

--4th highest sal
--for assining value we use with
--and with can use with select only

--WITH clause

with show_4th as (select *,DENSE_RANK() over (order by sal desc)as 'rank'from emp)
select * from show_4th where rank=3

------------------------------------------------------------------------------------

