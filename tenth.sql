CREATE DATABASE MusicApp;
USE MusicApp;

create table Artists(
	ArtistID int primary key IDENTITY(1,1),
	Name varchar(50) not null,
	Genre varchar(50)
);

insert into Artists(Name,Genre)
values
('Taylor Swift','Pop'),
('Drake','Hip-Hop'),
('Adele','Pop');

select * from Artists
where Genre = 'Pop';

create table Albums(
	AlbumID int primary key identity(1,1),
	Title varchar(50) not null,
	ReleaseYear int,
	ArtistID int,
	FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);
INSERT INTO Albums (Title, ReleaseYear, ArtistID)
VALUES
('1989', 2014, 1),   -- Taylor Swift
('Scorpion', 2018, 2), -- Drake
('25', 2015, 3);     -- Adele

SELECT a.AlbumID, a.Title, a.ReleaseYear, ar.Name AS 'Artist Name'
FROM Albums a
JOIN Artists ar ON a.ArtistID = ar.ArtistID;

SELECT ar.Genre, COUNT(a.AlbumID) AS 'Number of Albums'
FROM Artists ar
JOIN Albums a ON ar.ArtistID = a.ArtistID
GROUP BY ar.Genre;

SELECT ar.ArtistID, ar.Name AS 'Artist Name', a.Title AS 'Album Title', a.ReleaseYear
FROM Albums a
JOIN Artists ar ON a.ArtistID = ar.ArtistID
WHERE a.ReleaseYear > 2015;
