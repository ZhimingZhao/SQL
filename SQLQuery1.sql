create database stuinfo
use stuinfo
--major
--mno mname
create table major (
	mno int,
	mname varchar(20),
	primary key(mno)
)

select * from major

--student
--sno sname age sex mno
create table stu (
	sno int,
	sname varchar(30),
	age smallint,
	sex bit, --0 and 1 for male and female
	mno int,
	primary key(sno),
	foreign key(mno) references major(mno)
)
select * from stu

--course
--cno cname ctime ccredit
create table cou(
	cno int,
	cname varchar(30),
	ctime smallint,
	ccredit decimal(4,2),
	primary key(cno)
)

select * from cou

--sc
--sno cno grade
create table sc(
	sno int,
	cno int,
	grade decimal(5,2),
	primary key(sno, cno),
	foreign key(sno) references stu(sno),
	--foreign key(cno) references cou(cno)
)
--add a foreign key for table sc
alter table sc add constraint fk_sc foreign key(cno) references cou(cno)

select * from sc