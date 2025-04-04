create database okul;

create table students(
	id int primary key,
	firstname varchar(50),
	lastname varchar(50),
	birth_date date,
	gender char(1),
	grade int
);

create table grades(
	grade_id int primary key,
	student_id int,
	subject varchar(50),
	score int check(score between 0 and 100),
	foreign key (student_id) references students(id)
);

create view senior_students as
select * from students
where grade >=11;



insert into students 
values
(1, 'Ali', 'Yýlmaz', '2006-05-10', 'M', 12),
(2, 'Ayþe', 'Demir', '2007-08-21', 'F', 11),
(3, 'Mehmet', 'Kara', '2008-03-03', 'M', 10),
(4, 'Zeynep', 'Þahin', '2006-11-17', 'F', 12);

select * from senior_students;

insert into grades 
values
(1, 1, 'Math', 85),
(2, 1, 'Physics', 90),
(3, 2, 'Math', 78),
(4, 3, 'Math', 65),
(5, 4, 'Biology', 92);

CREATE VIEW student_grades AS
SELECT 
    s.id AS student_id,
    s.firstname,
    s.lastname,
    g.subject,
    g.score
FROM students s
JOIN grades g ON s.id = g.student_id;

select * from student_grades;

create view high_scores as 
select 
	s.Firstname,
	s.lastname,
	g.subject,
	g.score
from students s 
join grades g on s.id = g.student_id
where g.score >= 90;

select * from high_scores;

create view student_average_scores as 
select 
	s.id as student_id,
	s.firstname,
	s.lastname,
	AVG(g.score) as average_score
from students s
join grades g on s.id =g.student_id
group by s.id,s.firstname,s.lastname;

select * from student_average_scores;