--1. Database and Table Creation
--Create a database named StoreDB and a table called Products with the following columns:
--ProductID (integer, primary key)
--ProductName (text)
--Price (decimal)
--QuantityInStock (integer)

create database StoreDB;
use StoreDB;

create table Products(
	ProductID int primary key ,
	ProductName text,
	Price decimal,
	QuantityInStock int
);
--2. Inserting Data into the Table
--Now, insert the following sample data into the Products table:
--ProductID: 1, ProductName: "Laptop", Price: 1200.50, QuantityInStock: 15
--ProductID: 2, ProductName: "Smartphone", Price: 800.00, QuantityInStock: 30
--ProductID: 3, ProductName: "Headphones", Price: 150.25, QuantityInStock: 50
--Can you write the SQL code to insert these values into the Products table?

insert into Products(ProductID,ProductName,Price,QuantityInStock)
values
(1, 'Laptop', 1200.50, 15),
(2, 'Smartphone', 800.00, 30),
(3, 'Headphones', 150.25, 50);

--3. Query to Retrieve All Products
--Write an SQL query to retrieve all the products from the Products table, including 
--their ProductID, ProductName, Price, and QuantityInStock. What would the query look like?

select * from Products;

--4. Query with a Condition
--Write an SQL query to retrieve all products that have a QuantityInStock greater than 20.
--What would the query look like?
select * from Products
where QuantityInStock >20;

--5. Update a Product's Price
--Write an SQL query to update the price of the product with ProductID 2 (Smartphone) to
--750.00. What would the query look like?

update Products
set Price = 750.00
where ProductID = 2;

--6. Delete a Product
--Write an SQL query to delete the product with ProductID 3 (Headphones) from the 
--Products table. What would the query look like?
delete from Products
where ProductID = 3;

--7. Count the Number of Products
--Write an SQL query to count the total number of products in the Products table.
--What would the query look like?
SELECT COUNT(*) FROM Products;

--8. Query to Find Products Below a Certain Price
--Write an SQL query to find all products that have a price less than 800.00. 
--What would the query look like?

select * from Products
where Price < 800.00;

--9. Sorting Products by Price
--Write an SQL query to retrieve all products sorted by price in descending order. 
--What would the query look like?

select * from Products
order by Price desc;

--10. Retrieve Product Information with a Specific Range of Quantities
--Write an SQL query to retrieve products with a QuantityInStock between 10 and 40 
--(inclusive). What would the query look like?

select * from Products
where QuantityInStock between 10 and 40 ;

--11. Add a New Column
--Write an SQL statement to add a new column named Category (type: TEXT) to the Products
--table. What would the query look like?

alter table products
add category TEXT;
