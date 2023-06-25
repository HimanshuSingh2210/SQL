--JOINS 
--in other BI they called as MERGE

select * from emp
select * from dept
-----------------------------------------------------------------------------------------------------------------

--INNER JOIN

--it will reflect only matched data from both table

select et.ENAME,et.SAL,et.deptno,dt.DNAME,dt.loc from emp as et join DEPT as dt on et.DEPTNO=dt.DEPTNO

--OR WE CAN WRITE IN THIS WAY AS WELL WITHOUT WRITING AS --------

select et.ENAME,et.SAL,et.deptno,dt.DNAME,dt.loc from emp  et join DEPT  dt on et.DEPTNO=dt.DEPTNO


select et.ENAME,et.SAL,dt.deptno,dt.DNAME,dt.loc from emp  et join DEPT  dt on et.DEPTNO=dt.DEPTNO


------------------------------------------------------------------------------------------------------------------

update EMP set DEPTNO=50 where EMPNO=7900
-----------------------------------------------------------------------------------------------------------

--LEFT JOIN OR LEFT OUTER JOIN

--matched column fom both table and unmatched column from left hand side table
--inner join+unmached data/record from left hand side table

select EMP.EMPNO,EMP.SAL,EMP.DEPTNO,DEPT.DNAME,DEPT.DNAME,DEPT.LOC from EMP left join dept
on EMP.DEPTNO=DEPT.DEPTNO

--for getting in systmactic way

select EMP.EMPNO,EMP.SAL,EMP.DEPTNO,DEPT.DNAME,DEPT.DNAME,DEPT.LOC from EMP left join dept
on EMP.DEPTNO=DEPT.DEPTNO order by EMP.DEPTNO 

--for getting in decending order

select EMP.EMPNO,EMP.SAL,EMP.DEPTNO,DEPT.DNAME,DEPT.DNAME,DEPT.LOC from EMP left join dept
on EMP.DEPTNO=DEPT.DEPTNO order by EMP.DEPTNO desc

-----------------------------------------------------------------------------------------------------------

--RIGHT JOIN OR RIGHT OUTER JOIN

--matched column fom both table and unmatched column from right hand side table
--inner join+unmached data/record from right hand side table

select et.ENAME,et.SAL,et.DEPTNO,dt.DEPTNO,dt.DNAME,dt.LOC from EMP et right join DEPT dt
on et.DEPTNO=dt.DEPTNO

-----------------------------------------------------------------------------------------------------------------

--FULL OUTER JOIN

--combination of left and right outer join
--matched column fom both table and unmatched column from right and left hand side table
--inner join+unmached data/record from right and left hand side table

select et.ENAME,et.SAL,dt.deptno,dt.LOC from EMP et full outer join DEPT dt
on et.DEPTNO=dt.DEPTNO

--in systmatic way
select et.ENAME,et.SAL,dt.deptno,dt.LOC from EMP et full outer join DEPT dt
on et.DEPTNO=dt.DEPTNO order by et.DEPTNO 

-----------------------------------------------------------------------------------------------------------------

--SELF JOIN

--it will join in own table

select e1.EMPNO,e1.ENAME,e1.SAL,e2.ENAME from emp e1 inner join emp e2
on e1.empno =e2.mgr


select e1.EMPNO,e1.ENAME,e1.SAL,e2.ENAME from emp e1 inner join emp e2
on e2.empno =e1.mgr

----------------------------------------------------------------------------------------------------------------------

--if we dont have have common column in both table then we can directly write this

select * from EMP,DEPT

-----------------------------------------------------------------------------------------------------------------------

select oo.orderid,ood.quantity,pp.productname,pp.unit,pp.price,
c.categoryname,c.description,ct.customername,ct.city,
ep.lastname, ep.firstname,s.shippername,s.phone,
spp.suppliername,spp.country from orders oo 
inner join orderdetails ood on oo.orderid=ood.orderid 
inner join products pp on pp.productid=ood.productid
inner join categories c on c.categoryid=pp.categoryid
inner join customers ct on ct.customerid=oo.customerid
inner join employees ep on ep.employeeid=oo.employeeid
inner join shippers s on s.shipperid=oo.shipperid
inner join suppliers spp on spp.supplierid=pp.supplierid

-----------------------------------------------------------------------------------------------------------
--FUNCTION

--aggregate function
--SUM,AVG,MAX,MIN,COUNT

select max(sal) 'max sal',MIN(sal) 'min sal',AVG(sal) 'avg sal',COUNT(sal)
'no of record',sum(sal) 'total sal'from EMP

----------------------------------------------------------------------------------------------------------------------- 
 --DATE FUNCTION

 select * from emp

 select YEAR(hiredate),MONTH(hiredate),DAY(hiredate) from emp