--DML Data manipulation language


--TABLES

create table sample_001
(
eid int,
ename varchar(30)
)

insert into sample_001 values(1101,'ABCD')

select * from sample_001

--CREATE
create table sample_002
(
eid int unique,
ename varchar(30)
)
--INSERT
insert into sample_002 values(1101,'EFGH')
insert into sample_002 values(1102,'EFGhH')


insert into sample_002 (ename) values ('EFGgH')

--UPDATE
update sample_002 set eid=1103 where ename ='EFGgH'

--NOT NULL constraint

create table sample_003
(
eid int not null,
ename varchar(40),
emailid varchar(100),
)

insert into sample_003 values (null,'abcd','abcd@gmail.com')

insert into sample_003 values (null,'abcd','abcd@gmail.com')

select * from sample_003

--PRIMARY KEY constraint
-- it is a combination of not null and unique
--in a table we can only have 1 primary key

create table sample_004
(
idbo int primary key,
ename varchar(20),
)

insert into sample_004 values (1101,'abcd')
 
 insert into sample_004 values (null,'abcd')

 insert into sample_004 values (1102,'abcd')

 update sample_004 set ename ='EFGgH'where idbo=1102
 
 select idbo as idno from sample_004

 select * from sample_004


 --CHECK constraint
 create table sample_005
 (
 idno int,
 ename varchar(40),
 sal numeric(10,2),
 constraint pk_idno primary key(idno), -- syntax(constraint-constarint name-constraint type-column name
 constraint chk_sal check (sal>10000),
 )

 insert into sample_005 values (1101,'abcd',12000)
  insert into sample_005 values (1102,'efgh',11100)


 sp_help sample_005--stored procedure

 select * from sample_005



 --DEFAULT constraint
 create table sample_006(
 idno int,
 location varchar(21) default 'bangalore',
 )

 insert into sample_006 values (1101,'pune')

 insert into sample_006(idno) values(1102)

 select * from sample_006


 --FOREIGN KEY constraint
 --yeh refrence leta hai piche wale table se aur jo waha hai uska hi hoga baki ka nahi hoga

 create table sample_007
 (
 idno int,
 desig varchar(30),
 foreign key(idno) references sample_005(idno)
 )
 select * from sample_005

 insert into sample_007 values(1103,'manager')

  select * from sample_007

--------------example-------------------------------------------
  create table Membershipp
  (membershipidno int,
  membershiname varchar(40),
  constraint pk_mid primary key (membershipidno)
  )

  insert into Membershipp values (1103,'pqrs')
  select * from Membershipp
  create table rentdata
  (
  membershipidno int,
  typeofitem varchar(40),
  foreign key (membershipidno) references membershipp(membershipidno)
  )

  insert into rentdata values (1104,'asdf')

 insert into rentdata values (1103,'asdf')

    insert into rentdata values (1103,'movie')

	select * from rentdata

--__________________________________________________________________________________--


--Drop Table
--we cant rollback ek baar kia toh gaya
drop table sample_001--drop complete table itself

delete from sample_002--removes the rows and table willbe present(heading rahega baki sab jaega)

delete from emp where deptno=40--we can use where clause in delete command

select * from emp
-------------------------------------------------------------------
--ALTER Statement


sp_help sample_005 --sp=stored procedure

alter table sample_005 add email varchar(200)--to add column

select * from sample_005

alter table sample_005 add contactno numeric(10),city varchar(40)
--------------------------------------------------------------------
alter table sample_005 drop column ename--to remove column 

----------------------------------------------------------------------
--to modify

alter table sample_005 modify contactno numeric(12)
--this will not work

alter table sample_005 alter column contactno numeric(12) --syntax-alter table-table name-alter column-jo add karna hai wo
--this will work for modification

--------------------------------------------------------------------------
--UPDATE

select * from emp

update emp set sal=1000,comm=200 where empno=7369---yeh ek ko karega


update emp set comm=200 --yeh sabko karega

update emp set comm=200 where comm is null --yeh null wale ko update karega

update emp set sal=sal+sal*0.11 where deptno=10


--RENAME
--agar column name ko rename karna hai toh table pe right click karke design view mei jao
--ye bi hai ek option

exec sp_rename'emp.empn01','empno'

sp_help emp

-----------------------------------------------------------------------------------------------------
--COPY
--SELECT INTO

select * from emp

select * into emp01 from EMP
--it will copy whole table

select * from emp01

select * into emp02 from (select * from EMP where deptno=10) as T1
-- it will only copy the data from deptno=10

select * from emp03

select T1.comm,t1.sal,t1.empno into emp03 from (select * from EMP where DEPTNO=10) as T1
--kya kya dhekna/rakhna hai wo bi mention kar sakte hai with the help of alias name

----------------------------------------------------------------------------------------------------
--CREATE DATABASE

create database examplesql --syntax-create-database-databasename

-----------------------------------------------------------------------------------------------------
--USE DATABASE

USE examplesql
---------------------------------------------------------------------
--DROP DATABASE

drop database examplesql

 use SQL2

 ----------------------------------------------------------------------
 
 --DATA TYPES

 --1 int
 --2 bigint
 --smallint
 --text
 --date
 --time
 --year
 --char(5)--abc 5bytes--nchar
 --varchar(5)--abc 3 bytes-nvarchar