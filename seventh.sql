--Bir �irket Y�netim Sistemi

--Soru 1: CREATE DATABASE
--�irketin y�netimi i�in bir veritaban� olu�tur. Veritaban�n�n ad� company_management olsun.

create database company_management;
use company_management;

--Soru 2: CREATE TABLE � employees
--�irketin �al��anlar�n� tutacak bir tablo olu�turun. Bu tablonun �u s�tunlar� olsun:

create table employees(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	department VARCHAR(50),
	hire_date DATE DEFAULT CONVERT(DATE,GETDATE()),
	salary DECIMAL(10,2)
);

insert into employees(employee_id,first_name,last_name,department,salary)
values
(4,'Alice','Green','Marketing',60000);


--Soru 3: UPDATE
--�imdi Alice Green'in maa��n� 65000 olarak g�ncellemek istiyoruz.

UPDATE employees
SET salary = 65000
WHERE first_name='Alice' and last_name = 'Green';

--Soru 4: SELECT � Veri Listeleme
--�irketin t�m �al��anlar�n� employee_id, first_name, last_name, department ve salary 
--bilgileriyle listele. Bu i�lemi yapmak i�in do�ru SELECT sorgusunu yaz!

select e.employee_id,e.first_name,e.last_name,e.department,e.salary
from employees e

--Soru 5: SELECT � Belirli �artlarla Veri �ekme
--�imdi, Marketing departman�ndaki t�m �al��anlar� listelemek istiyoruz. Yani sadece Alice Green'i g�rmek istiyoruz.
SELECT e.employee_id, e.first_name, e.last_name, e.department, e.salary
FROM employees e
WHERE e.department = 'Marketing';

--Soru 6: COUNT � �al��an Say�s�
--�irketin toplam �al��an say�s�n� ��renmek istiyoruz. Yani employees tablosundaki toplam kay�t say�s�n� sorgulayan bir COUNT sorgusu yaz!

select count(*) as total_employees
from employees;

--Soru 7: AVG � Ortalama Maa� Hesaplama
--�irketin ortalama maa��n� hesaplamak istiyoruz. Yani salary s�tununun ortalamas�n� hesaplayan bir AVG sorgusu yaz!
select avg(salary) as avg_salary
from employees;

-- Soru 8: ORDER BY � Maa�a G�re S�ralama
--�imdi, �irketin �al��anlar�n� maa�lar�na g�re azalan s�rayla (en y�ksek maa�l�dan en d���k maa�l�ya) s�ralamak istiyoruz.
select * from employees
order by salary DESC;

--Soru 9: JOIN � �al��anlar ve Departmanlar
--�imdi, ba�ka bir tablo eklememiz gerekebilir. Bu durumda, bir departments tablosu olu�tural�m ve employees tablosuyla JOIN i�lemi yapal�m.

create table departments(
	department_id int primary key,
	department_name varchar(50)
);




EXEC sp_rename 'employees.department', 'department_id', 'COLUMN';

UPDATE employees
SET department_id = 3
WHERE first_name = 'Alice' AND last_name = 'Green';


INSERT INTO departments (department_id, department_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Marketing'),
(4, 'Sales');

--Soru 10: JOIN � �al��anlar ve Departmanlar
--�imdi, employees tablosu ile departments tablosunu JOIN i�lemiyle birle�tirerek,
--her �al��an�n department_name bilgisini de g�stermek istiyoruz.

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;


--Soru 11: GROUP BY ve HAVING � Departman Baz�nda Ortalama Maa�
--�irketin her departman� i�in ortalama maa�lar� hesaplamak istiyoruz. 
--Ancak, sadece ortalama maa�� 50,000'den y�ksek olan departmanlar� listelemek istiyoruz.
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 50000;
