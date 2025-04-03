CREATE DATABASE HotelDB;
USE HotelDB;

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	PhoneNumber VARCHAR(20) NOT NULL,
	RegistrationDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Rooms(
	RoomID INT PRIMARY KEY IDENTITY(1,1),
	RoomNumber VARCHAR(10) NOT NULL UNIQUE,
	RoomType VARCHAR(50) NOT NULL,
	PricePerNight DECIMAL(10,2) NOT NULL,
	IsAvailable BIT DEFAULT 1
);
CREATE TABLE Reservations(
	ReservationID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT NOT NULL,
	RoomID INT NOT NULL,
	CheckInDate DATE NOT NULL,
	CheckOutDate DATE NOT NULL,
	TotalPrice DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

-- Add customer
INSERT INTO Customers(FirstName,LastName,Email,PhoneNumber)
VALUES
('Ahmet', 'Yýlmaz', 'ahmet.yilmaz@email.com', '555-123-4567'),
('Zeynep', 'Kaya', 'zeynep.kaya@email.com', '555-987-6543'),
('Mehmet', 'Demir', 'mehmet.demir@email.com', '555-456-7890');

-- Add a room
INSERT INTO Rooms(RoomNumber,RoomType,PricePerNight,IsAvailable)
VALUES
('101', 'Standart', 100.00, 1),
('102', 'Standart', 100.00, 1),
('201', 'Deluxe', 200.00, 1),
('301', 'Suite', 500.00, 1);

-- Add a reservation
INSERT INTO Reservations(CustomerID,RoomID,CheckInDate,CheckOutDate,TotalPrice)
VALUES
(1, 2, '2025-04-05', '2025-04-10', 500.00), 
(2, 3, '2025-04-07', '2025-04-12', 1000.00), 
(3, 4, '2025-04-08', '2025-04-15', 3500.00);

--List All Reservations
select R.ReservationID , C.FirstName , C.LastName,RM.RoomNumber,RM.RoomType,R.CheckInDate,R.CheckOutDate
FROM Reservations R
inner join Customers C ON R.CustomerID = C.CustomerID
inner join Rooms RM ON R.RoomID = RM.RoomID;

--List Available Rooms
SELECT * FROM Rooms WHERE IsAvailable = 1;

--All Bookings for a Specific Customer
select R.ReservationID,RM.RoomNumber,RM.RoomType,R.CheckInDate,R.CheckOutDate,R.TotalPrice
from Reservations R
inner join Rooms RM on R.RoomID = RM.RoomID
where R.CustomerID = 1;

--Most Expensive Room Reservation
select TOP 1 C.FirstName , C.LastName,RM.RoomNumber,RM.RoomType,R.TotalPrice
from Reservations R
inner join Customers C on R.CustomerID = C.CustomerID
inner join Rooms RM on R.RoomID = RM.RoomID
ORDER BY R.TotalPrice DESC;

--Average Price for Each Room Type
SELECT RoomType, AVG(PricePerNight) AS AveragePrice
FROM Rooms
GROUP BY RoomType;

--Rooms Available on a Specific Date
SELECT * FROM Rooms 
WHERE RoomID NOT IN (
    SELECT RoomID FROM Reservations 
    WHERE '2025-04-06' BETWEEN CheckInDate AND CheckOutDate
);

--Total Revenue of Hotel
SELECT SUM(TotalPrice) AS TotalRevenue FROM Reservations;















