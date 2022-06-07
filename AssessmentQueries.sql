-- Ans Tool

select * from optionalcourses
select * from deptoptionalcourserelation
select * from department
select * from student
select * from optionalcourserelation

-- 1.
select s.student_id,s.student_name,d.department_name
from student s inner join department d on s.department_id=d.department_id
order by s.student_id

-- 2.
select d.department_name,count(s.department_id) Student_Count
from student s inner join department d on s.department_id=d.department_id
group by d.department_name

-- 3.
select d.department_name,d.department_intake-count(s.department_id) Pending_seats
from student s inner join department d on s.department_id=d.department_id
group by d.department_name,d.department_intake

-- 4.
select student_id,student_name,date_of_birth from student
where extract(year from(date_of_birth))=1997

-- 5.
select student_id,student_name from student
where student_name like 'R%'

-- 6.
select student_id,student_name from student
where student_name like 'R__i'

-- 7.
select * from student s inner join department d on s.department_id=d.department_id
where d.department_name like 'Electronics'

-- 8.
select s.student_name,s.student_id from
student s inner join optionalcourserelation oc on s.student_id=oc.student_id
group by s.student_id
order by s.student_id

-- 9.
select s.student_id,s.student_name from
student s left join optionalcourserelation oc on s.student_id=oc.student_id
where oc.course_id is null

-- 10.
select d.department_id,d.department_name from department d inner join deptoptionalcourserelation dc
on d.department_id=dc.department_id
group by d.department_name,d.department_id

-- 11.
select d.department_id,d.department_name from department d left join deptoptionalcourserelation dc
on d.department_id=dc.department_id
where dc.course_id is null

-- 12.

select oc.course_id,oc.course_name from optionalcourses oc
inner join deptoptionalcourserelation dcr on oc.course_id=dcr.course_id
group by oc.course_id
having String_agg(oc.course_name,',') like '%,%'

-- 13.
select oc.course_name,d.department_name from
optionalcourses oc inner join deptoptionalcourserelation dc on oc.course_id=dc.course_id
inner join department d on dc.department_id=d.department_id
-- where d.department_name <> 'General'

-- 14.
select d.department_name General_Studies,oc.course_name from
optionalcourses oc inner join deptoptionalcourserelation dc on oc.course_id=dc.course_id
inner join department d on dc.department_id=d.department_id
where d.department_name like 'General'

-- 15.
select * from student
where date_of_birth between '1996-12-01' and '1997-05-31'

-- 16.
select student_name,student_id from student where student_id in
(select ocr.student_id from optionalcourserelation ocr inner join
deptoptionalcourserelation dc on ocr.course_id=dc.course_id left join
student s on dc.department_id=s.department_id
group by ocr.student_id,dc.department_id,s.department_id
having dc.department_id=s.department_id)
       
-- -- 17.
select * from student where student_id not in
(select ocr.student_id from optionalcourserelation ocr inner join
deptoptionalcourserelation dc on ocr.course_id=dc.course_id left join
student s on dc.department_id=s.department_id
group by ocr.student_id,dc.department_id,s.department_id
having dc.department_id=s.department_id)
       
-- 18.

select count(s.student_id), oc.course_name from student s inner join optionalcourserelation ocr on s.student_id=ocr.student_id
inner join optionalcourses oc on oc.course_id=ocr.course_id where ocr.student_id=s.student_id 
group by oc.course_name

-- 19.
select department_name , department_intake from department 
where department_intake=(select max(department_intake)from department)

-- 20.
alter table deptoptionalcourserelation drop constraint deptoptionalcourserelation_department_id_fkey
ALTER TABLE deptoptionalcourserelation
ADD CONSTRAINT department_id
         FOREIGN KEY (department_id)
         REFERENCES department
         ON DELETE CASCADE
delete from department where department_name='Electrical'

--
       alter table deptoptionalcourserelation drop constraint deptoptionalcourserelation_department_id_fkey
       delete from department where department_name like 'Electrical'

-- 21.
update student set date_of_birth='1997-02-28'
where student_name like 'Ravi'

-- 22.
Begin
insert into optionalcourse values ('Tissue Culture'),('Vaccine Tech')
insert into deptoptionalcourserelation (10,9),(10,10)
insert into optionalcourserelation (6,9),(7,10)
end;










































































