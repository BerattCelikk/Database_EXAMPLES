--Aþaðýdaki ismi kullanarak bir veri tabaný oluþtur:
--Veritabaný ismi: UniCourseDB

create database UniCourseDB;
use UniCourseDB;

--Þimdi 3 tablo oluþturalým: Students, Courses, ve Enrollments.

--Ýlk olarak Students tablosunu oluþturalým. Aþaðýdaki sütunlarý içermeli:
--StudentID – INTEGER, otomatik artan, PRIMARY KEY
--FirstName – VARCHAR(50)
--LastName – VARCHAR(50)
--BirthDate – DATE

create table Students(
	StudentID int primary key identity(1,1),
	FirstName varchar(50),
	LastName varchar(50),
	BirthDate date
);

--Þimdi Courses tablosunu oluþtur. Þu sütunlar olmalý:
--CourseID – INT, otomatik artan, PRIMARY KEY
--CourseName – VARCHAR(100)
--Credit – INT

create table Courses(
	CourseID int primary key identity(1,1),
	CourseName varchar(100),
	Credit int
);

--Þimdi Enrollments (Kayýtlar) tablosunu oluþturalým. Bu tablo, öðrencilerin hangi derslere kayýt olduðunu gösterecek.
--Aþaðýdaki sütunlarý içermeli:
--EnrollmentID – INT, otomatik artan, PRIMARY KEY
--StudentID – INT, FOREIGN KEY olacak (Students.StudentID’ye baðlý)
--CourseID – INT, FOREIGN KEY olacak (Courses.CourseID’ye baðlý)
--EnrollmentDate – DATE

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

--Students tablosuna 3 öðrenci ekle. Aþaðýda bilgileri veriyorum, sen uygun INSERT INTO komutlarýný yaz:
INSERT INTO Students (FirstName, LastName, BirthDate)
VALUES
('Ali', 'Yýlmaz', '2000-05-12'),
('Ayþe', 'Demir', '2001-09-23'),
('Mehmet', 'Kaya', '1999-12-04');

--Þimdi Courses tablosuna birkaç ders ekleyelim.
INSERT INTO Courses (CourseName, Credit)
VALUES
('Matematik', 4),
('Fizik', 3),
('Kimya', 3);

--Þimdi Enrollments tablosuna birkaç kayýt ekleyelim.
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, '2025-04-05'),
(2, 2, '2025-04-06'),
(3, 3, '2025-04-07');

--Students, Courses ve Enrollments tablolarýný birleþtirip, her öðrenci için hangi derslere kayýtlý olduklarýný gösterelim. Hangi öðrencinin hangi derse kaydolduðunu içeren bir sorgu yaz.
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
