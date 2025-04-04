--Bir Þirket Yönetim Sistemi

--Soru 1: CREATE DATABASE
--Þirketin yönetimi için bir veritabaný oluþtur. Veritabanýnýn adý company_management olsun.

create database company_management;
use company_management;

--Soru 2: CREATE TABLE – employees
--Þirketin çalýþanlarýný tutacak bir tablo oluþturun. Bu tablonun þu sütunlarý olsun:

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
--Þimdi Alice Green'in maaþýný 65000 olarak güncellemek istiyoruz.

UPDATE employees
SET salary = 65000
WHERE first_name='Alice' and last_name = 'Green';

--Soru 4: SELECT – Veri Listeleme
--Þirketin tüm çalýþanlarýný employee_id, first_name, last_name, department ve salary 
--bilgileriyle listele. Bu iþlemi yapmak için doðru SELECT sorgusunu yaz!

select e.employee_id,e.first_name,e.last_name,e.department,e.salary
from employees e

--Soru 5: SELECT – Belirli Þartlarla Veri Çekme
--Þimdi, Marketing departmanýndaki tüm çalýþanlarý listelemek istiyoruz. Yani sadece Alice Green'i görmek istiyoruz.
SELECT e.employee_id, e.first_name, e.last_name, e.department, e.salary
FROM employees e
WHERE e.department = 'Marketing';

--Soru 6: COUNT – Çalýþan Sayýsý
--Þirketin toplam çalýþan sayýsýný öðrenmek istiyoruz. Yani employees tablosundaki toplam kayýt sayýsýný sorgulayan bir COUNT sorgusu yaz!

select count(*) as total_employees
from employees;

--Soru 7: AVG – Ortalama Maaþ Hesaplama
--Þirketin ortalama maaþýný hesaplamak istiyoruz. Yani salary sütununun ortalamasýný hesaplayan bir AVG sorgusu yaz!
select avg(salary) as avg_salary
from employees;

-- Soru 8: ORDER BY – Maaþa Göre Sýralama
--Þimdi, þirketin çalýþanlarýný maaþlarýna göre azalan sýrayla (en yüksek maaþlýdan en düþük maaþlýya) sýralamak istiyoruz.
select * from employees
order by salary DESC;

--Soru 9: JOIN – Çalýþanlar ve Departmanlar
--Þimdi, baþka bir tablo eklememiz gerekebilir. Bu durumda, bir departments tablosu oluþturalým ve employees tablosuyla JOIN iþlemi yapalým.

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

--Soru 10: JOIN – Çalýþanlar ve Departmanlar
--Þimdi, employees tablosu ile departments tablosunu JOIN iþlemiyle birleþtirerek,
--her çalýþanýn department_name bilgisini de göstermek istiyoruz.

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;


--Soru 11: GROUP BY ve HAVING – Departman Bazýnda Ortalama Maaþ
--Þirketin her departmaný için ortalama maaþlarý hesaplamak istiyoruz. 
--Ancak, sadece ortalama maaþý 50,000'den yüksek olan departmanlarý listelemek istiyoruz.
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 50000;
