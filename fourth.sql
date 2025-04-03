CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Members(
	MemberID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	JoinDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Books(
	BookID INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(100) NOT NULL,
	Author VARCHAR(100) NOT NULL,
	PublishedYear INT NOT NULL,
	AvailableCopies INT NOT NULL
);
CREATE TABLE BorrowedBooks(
	BorrowID INT PRIMARY KEY IDENTITY(1,1),
	MemberID INT NOT NULL,
	BookID INT NOT NULL,
	BorrowDate DATETIME DEFAULT GETDATE(),
	ReturnDate DATETIME NULL,
	FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
	FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert members
INSERT INTO Members(FirstName,LastName,Email)
VALUES
('John', 'Doe', 'john.doe@email.com'),
('Emily', 'Smith', 'emily.smith@email.com'),
('Michael', 'Brown', 'michael.brown@email.com');

-- Insert books
INSERT INTO Books(Title,Author,PublishedYear,AvailableCopies)
VALUES
('1984', 'George Orwell', 1949, 5),
('War and Peace', 'Leo Tolstoy', 1869, 3),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 4);

-- Insert borrowed books
INSERT INTO BorrowedBooks(MemberID,BookID,BorrowDate,ReturnDate)
VALUES
(1, 1, '2025-04-01', NULL),  
(2, 2, '2025-03-20', '2025-03-30'), 
(3, 3, '2025-03-25', NULL); 

--List of Members and Their Borrowed Books
SELECT M.FirstName,M.LastName,B.Title,BB.BorrowDate,BB.ReturnDate
FROM Members M
INNER JOIN BorrowedBooks BB ON M.MemberID = BB.MemberID
INNER JOIN Books B ON BB.BookID = B.BookID;

--Books That Are Currently Borrowed (Not Returned Yet)
SELECT M.FirstName , M.LastName,B.Title,BB.BorrowDate
FROM Members M
INNER JOIN BorrowedBooks BB ON M.MemberID = BB.MemberID
INNER JOIN Books B ON BB.BookID = B.BookID
WHERE BB.ReturnDate IS NULL;

--Total Number of Books Borrowed Per Member
SELECT M.FirstName , M.LastName,COUNT(BB.BorrowID) AS TotalBorrowed
FROM Members M
LEFT JOIN BorrowedBooks BB ON M.MemberID = BB.MemberID
GROUP BY M.FirstName , M.LastName;

--Most Borrowed Books
SELECT B.Title , COUNT(BB.BorrowID) AS BorrowCount
FROM Books B
LEFT JOIN BorrowedBooks BB ON B.BookID = BB.BookID
GROUP BY B.Title
ORDER BY BorrowCount DESC;

--Members Who Haven't Borrowed Any Books
SELECT M.FirstName,M.LastName
FROM Members M
LEFT JOIN BorrowedBooks BB ON M.MemberID = BB.MemberID
WHERE BB.BorrowID IS NULL;
