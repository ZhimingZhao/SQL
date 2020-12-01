use stuinfo

--add column into table
alter table stu add qq varchar(20)

--find info in table, * means all
select * from stu

--alter table
alter table stu drop column qq

--drop table
create table t (
	tt int
)
select * from t
drop table t

--insert
select * from major 
insert into major(mno, mname) values(1, 'Computer Science')
insert into major(mno, mname) values(2, 'Software Engineering')
insert into stu values(1, 'Jerry', 20, 0, 2, 1727968924) --student number, name, age, sex, major number, qq
--delete 
delete from major where mno=3
select * from major

--delete something that has reference from others
--example, delete major SE which Student Jerry studies at, which can't be done without changing major
update stu set mno=null where mno=2 --set the students studying at SE to null
delete from major where mno=2 --now we can delete the major

--update
update stu set sname='JerryZ' where sno=1 
select * from stu


