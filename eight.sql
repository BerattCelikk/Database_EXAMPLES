--A�a��daki ismi kullanarak bir veri taban� olu�tur:
--Veritaban� ismi: UniCourseDB

create database UniCourseDB;
use UniCourseDB;

--�imdi 3 tablo olu�tural�m: Students, Courses, ve Enrollments.

--�lk olarak Students tablosunu olu�tural�m. A�a��daki s�tunlar� i�ermeli:
--StudentID � INTEGER, otomatik artan, PRIMARY KEY
--FirstName � VARCHAR(50)
--LastName � VARCHAR(50)
--BirthDate � DATE

create table Students(
	StudentID int primary key identity(1,1),
	FirstName varchar(50),
	LastName varchar(50),
	BirthDate date
);

--�imdi Courses tablosunu olu�tur. �u s�tunlar olmal�:
--CourseID � INT, otomatik artan, PRIMARY KEY
--CourseName � VARCHAR(100)
--Credit � INT

create table Courses(
	CourseID int primary key identity(1,1),
	CourseName varchar(100),
	Credit int
);

--�imdi Enrollments (Kay�tlar) tablosunu olu�tural�m. Bu tablo, ��rencilerin hangi derslere kay�t oldu�unu g�sterecek.
--A�a��daki s�tunlar� i�ermeli:
--EnrollmentID � INT, otomatik artan, PRIMARY KEY
--StudentID � INT, FOREIGN KEY olacak (Students.StudentID�ye ba�l�)
--CourseID � INT, FOREIGN KEY olacak (Courses.CourseID�ye ba�l�)
--EnrollmentDate � DATE

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

--Students tablosuna 3 ��renci ekle. A�a��da bilgileri veriyorum, sen uygun INSERT INTO komutlar�n� yaz:
INSERT INTO Students (FirstName, LastName, BirthDate)
VALUES
('Ali', 'Y�lmaz', '2000-05-12'),
('Ay�e', 'Demir', '2001-09-23'),
('Mehmet', 'Kaya', '1999-12-04');

--�imdi Courses tablosuna birka� ders ekleyelim.
INSERT INTO Courses (CourseName, Credit)
VALUES
('Matematik', 4),
('Fizik', 3),
('Kimya', 3);

--�imdi Enrollments tablosuna birka� kay�t ekleyelim.
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, '2025-04-05'),
(2, 2, '2025-04-06'),
(3, 3, '2025-04-07');

--Students, Courses ve Enrollments tablolar�n� birle�tirip, her ��renci i�in hangi derslere kay�tl� olduklar�n� g�sterelim. Hangi ��rencinin hangi derse kaydoldu�unu i�eren bir sorgu yaz.
SELECT 
    s.FirstName, 
    s.LastName, 
    c.CourseName, 
    e.EnrollmentDate
FROM 
    Enrollments e
JOIN 
    Students s ON e.StudentID = s.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID;
