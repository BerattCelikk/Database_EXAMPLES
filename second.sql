--Library Management System
--Books Table
/*
CREATE TABLE books(
	book_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	title VARCHAR(255) NOT NULL,
  	author_id INT,
  	published_year INT,
  	available BOOLEAN DEFAULT TRUE,
  	FOREIGN KEY(author_id) REFERENCES authors(author_id)
);


--Authors Table
CREATE TABLE authors(
	author_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	name VARCHAR(100) NOT NULL,
  	country VARCHAR(100)
);



--Borrowers Table
create TABLE borrowers(
	borrower_id INTEGER PRIMARY KEY AUTOINCREMENT,
  	name VARCHAR(100) NOT NULL,
  	book_id INT,
  	borrowed_date DATE,
  	return_date DATE,
  	FOREIGN KEY (book_id) REFERENCES books(book_id)
)


INSERT INTO authors(name,country) 
VALUES 
('J.K. Rowling', 'UK'),
('George Orwell', 'UK'),
('F. Scott Fitzgerald', 'USA');

--SELECT * from authors;

INSERT INTO books(title,author_id,published_year,available)
VALUES
('Harry Potter', 1, 1997, TRUE),
('1984', 2, 1949, TRUE),
('The Great Gatsby', 3, 1925, FALSE);


INSERT INTO borrowers (name,book_id,borrowed_date,return_date)
VALUES
('Ali Yılmaz', 3, '2024-03-25', '2024-04-05'),
('Ayşe Demir', 1, '2024-03-28', '2024-04-10');



--SELECT * FROM books;

--Bring Borrowed Books
SELECT borrowers.name AS borrower,books.title,borrowers.borrowed_date,borrowers.return_date
FROM borrowers
JOIN books ON borrowers.book_id = books.book_id;


SELECT authors.name , COUNT(books.book_id) AS total_books
FROM authors
LEFT JOIN books ON authors.author_id = books.author_id
GROUP BY authors.name;

--Get Current (Not on Loan) Books
SELECT title from books WHERE available = TRUE;


--Find Oldest Book (MIN)
select * from books WHERE published_year = (SELECT MIN(published_year) FROM books);
*/
