create database OkulYonetimi
use OkulYonetimi;

create table Students(
	StudentID int primary key identity(1,1),
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	Email varchar(100) not null,
	EnrollmentDate datetime default GETDATE()
);

create table Courses(
	CourseID int primary key identity(1,1),
	CourseName varchar(100) not null,
	Credits int not null
);

create table Grades(
	GradeID int identity(1,1) primary key,
	StudentID int not null,
	CourseID int not null,
	Grade decimal(5,2),
	GradeDate datetime default GETDATE(),
	foreign key (StudentID) references Students(StudentID),
	foreign key (CourseID) references Courses(CourseID)
);

--DML

insert into Students(FirstName,LastName,Email)
values
('Ahmet', 'Yýlmaz', 'ahmet.yilmaz@email.com'),
('Zeynep', 'Kara', 'zeynep.kara@email.com'),
('Murat', 'Demir', 'murat.demir@email.com');

insert into Grades(StudentID,CourseID,Grade)
values
(1, 1, 85),
(1, 2, 90),
(2, 1, 75),
(2, 3, 80),
(3, 2, 88);

select * from Courses;

insert into Courses(CourseName, Credits)
values 
('Matematik', 3),
('Fizik', 4),
('Kimya', 3);

insert into Grades(StudentID, CourseID, Grade)
values
(1, 1, 85),
(1, 2, 90),
(2, 1, 75),
(2, 3, 80),
(3, 2, 88);

--Information about Students and Their Courses
select S.FirstName, S.LastName , C.CourseName, G.Grade
from Students S
inner join Grades G on S.StudentID = G.StudentID
inner join Courses C on G.CourseID = C.CourseID;

--Average Grade of Each Student
select S.FirstName , S.LastName, avg(G.Grade) as AverageGrade
from Students S
inner join Grades G on S.StudentID = G.StudentID
group by S.FirstName , S.LastName;

--Students Scoring 80 and Above
select S.FirstName , S.LastName ,C.CourseName , G.Grade
from Students S
inner join Grades G on S.StudentID = G.StudentID
inner join Courses C on G.CourseID = C.CourseID
where G.Grade >=80;

--Students Taking Only One Course
select S.FirstName, S.LastName
from Students S
inner join Grades G on S.StudentID = G.StudentID
group by S.StudentID
having count(G.CourseID) =1;

--Students with the Highest Scores
select S.FirstName,S.LastName,C.CourseName,G.Grade
from Students S
inner join Grades G on S.StudentID = G.StudentID
inner join Courses C on G.CourseID = C.CourseID
where G.Grade = (select max(Grade) from Grades);

--Number of Students with Courses
select C.CourseName,count(G.StudentID) as StudentCount
from Courses C
left join Grades G on C.CourseID = G.CourseID
group by C.CourseName;