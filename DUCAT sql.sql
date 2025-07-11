-- 01/07/2025 (Tusesday)

-- All ways end the command with ; it is like a full stop for sql you can write like this to explain your command to other coder by adding this (--) before the line 
-- You can select the code and then click ctrl+b to make it look more beautiful or you can say more organise and by select the code and clicking on ctrl+enter to run the code

-- Firstly we are going to create a database to store all table 
CREATE DATABASE Homerevison;

-- So we have created the database we are telling computer to use it 
USE Homerevison;

-- Now we are going to make table for the database to store data INT means number, VARCHAR mean to write some word, CHAR means also are for words and
-- NOT NULL mean that you can not leave this place empty 
CREATE TABLE student(
id INT NOT NULL,
name VARCHAR(30),
gender CHAR(10)
);

-- DESC is used to describe the table use to see table 
DESC student;

-- To INSERT the data in the table 
INSERT INTO student(id,name,gender) values
(1,"Mayank Bhatt","Male"),
(2, "Dexant Bhatt", "Male"),
(3, "Sonali Bhatt", "Female");

-- To see table (*) mean all 
SELECT * FROM student;

-- 02/07/2025 (Wednesday) 

-- UNIQUE mean only one, PRIMARY KEY mean it is like a mix of UNIQUE and NOT NULL 
CREATE TABLE department (
Did INT PRIMARY KEY,
Dname VARCHAR(30) UNIQUE,
Dlocation VARCHAR(30) NOT NULL
);

-- To INSERT the data in the table 
INSERT INTO department(Did,Dname,Dlocation) values
(1, "Mayank Bhatt", "Delhi"),
(2, "Dexant Bhatt","Delhi"),
(3, "Sonali Bhatt", "UP");

-- 03/07/2025 (Thursday) 

-- To delete the table we use DROP TABLE and we can drop the database also by DROP DATABASE
DROP TABLE Department;

-- Create table to link other table you can say there are two type of table parent table and child table here we are linking Department to employee meaning 
-- we will be useing departmnet column in employee table 
CREATE TABLE Department(
 D_id INT PRIMARY KEY, 
 D_name VARCHAR(25) UNIQUE
 );

-- CREATE TABLE IF NOT EXISTS is a good practice to use it is used to check if that table exist if not make it 
-- FLOAT allows decimal numbers, CONSTRAINT keyword in SQL is used to set rules on columns in a table (this is not that important)  
-- FOREIGN KEY creates a relationship It links D_id in the employee table to D_id in the Department table.
-- REFERENCES is like telling that this column is telling about this columns.
CREATE TABLE IF NOT EXISTS employee(
e_id INT PRIMARY KEY,
e_name VARCHAR(40),
salary FLOAT,
D_id INT,
CONSTRAINT FOREIGN KEY(D_id) REFERENCES Department (D_id)
);

-- INSERT data in department 
INSERT INTO department (D_id,D_name) VALUES
(101,"HR"),
(102, "Admin"),
(103, "Devloper");

-- INSERT data in employee
INSERT INTO employee(e_id,e_name,salary,D_id) VALUES
(1001, "Mayank","45000","101");

-- CHECK is like to put some condition before INSERT data will CREATEing table 
CREATE TABLE emp(
e_id INT PRIMARY KEY,
E_name VARCHAR(30),
age INT CHECK(Age>=18),
address VARCHAR(50)
);

-- INSERT data in emp
INSERT INTO emp(e_id,Age) VALUES
(1, 20);

-- to see the table 
SELECT * FROM emp;

-- INSERT data but it will not take it because age is not 18+ will creating table we used check to see age must be +18
INSERT INTO emp(e_id,Age) VALUE
(1, 15); 

-- DEFAULT is like haveing default value if you not put anything  
CREATE TABLE emp1(
e_id INT PRIMARY KEY,
E_name VARCHAR(30) DEFAULT("New Joiner"),
age INT CHECK(Age>=18),
address VARCHAR(50)
);

-- INSERT data in emp1
INSERT INTO emp1(e_id,Age) VALUES
(1, 20); 

-- see the table but you can see E_name New Joiner because will creating table we put default value in emp1 
SELECT * FROM emp1;

-- 9/7/2025 (Monday)

-- reviseing 
DROP DATABASE Company;

CREATE DATABASE company;

USE company;

CREATE TABLE Branch(
Branch_id INT PRIMARY KEY,
B_name VARCHAR(20),
Location VARCHAR(50)
);

DESC Branch;

CREATE TABLE Department(
Dep_id INT PRIMARY KEY,
Dep_name VARCHAR(20),
Branch_id INT,
CONSTRAINT FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id)
);

CREATE TABLE employee(
e_id INT PRIMARY KEY,
e_name VARCHAR(40),
salary FLOAT,
D_id INT,
CONSTRAINT FOREIGN KEY(D_id) REFERENCES Department (Dep_id)
);

CREATE TABLE Product(
P_id INT PRIMARY KEY,
P_name VARCHAR(30)
);


-- we created this table so we can make a relation between many to many 
CREATE TABLE Product_emp_Branch(
id INT PRIMARY KEY,
Branch_id INT,
e_id INT,
CONSTRAINT FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id),
CONSTRAINT FOREIGN KEY(e_id) REFERENCES employee(e_id)
);

-- 10/7/2025 (Wednesday)

-- Revison of inserting data 
INSERT INTO Branch VALUES
(01,"Management Branch","Delhi"),
(02, "Head", "Delhi"),
(03, "Mumbai","uk"),
(04, "Mayank", "UP"),
(05, "Bhatt", "Patna");

SELECT * FROM Branch;

INSERT INTO Department VALUES 
(101,"HR",01),
(102,"MB",02),
(103,"DA",03),
(104,"DS",01),
(105,"ba",02),
(106,"VLB",04),
(107,"SB",05),
(108,"PB",04),
(109,"DB",02),
(110,"DB",04);
SELECT * FROM Department;

Insert INTO employee VALUES
(1001,"Mayank",28000,103),
(1002,"Satyam",25000,106),
(1003,"Dexant",30000,108),
(1004,"Gopal", 20000,102),
(1005,"Uday", 32000,101);
SELECT * FROM employee;

Insert INTO product VALUES
(1,"asd",02),
(2,"ZXC",01),
(3,"QWE",03),
(4,"POI",05),
(5,"LKJ",04);
SELECT * FROM product;

 Insert INTO Product_emp VALUES
('2022-04-02',1,1001),
('2022-04-03',4,1004),
('2022-04-04',3,1002),
('2022-04-05',2,1005),
('2022-04-06',5,1003);
SELECT * FROM Product_emp;

-- 11/7/2025 (Friday)

-- Useing database that you prefer
USE College;

-- Createing wrong table to learning who to rewrite it without droping it
CREATE TABLE Parson(
Id INT,
NAME CHAR(10),
Address VARCHAR(50)
);

-- This is who to add one rows in the table
ALTER TABLE Parson ADD Contact INT UNIQUE;

-- This is who to add multiple rows in the table
ALTER TABLE Parson ADD (Gender CHAR(6),Email VARCHAR(50), Age INT CHECK(age>=18));

-- To see if every thing is good
SELECT * FROM Parson;

-- Inserting data
INSERT INTO parson VALUES 
(01,"Mayank","abcd",4667775,"Male","asf@gmail.com",35),
(02,"Dexant","efgh",9455445,"Woman","acf@gmail.com",34),
(03,"Satyam","ijkl",9344245,"Transwoman","vsf@gmail.com",65);

-- To drop a row of a table without droping the whole table
ALTER TABLE Parson DROP COLUMN Gender;

-- To modify meaning to rewrite the charteristic of row header which we did wrong above
ALTER TABLE Parson MODIFY Contact BIGINT;
ALTER TABLE Mayank MODIFY Name VARCHAR(30);

-- To renameing the database 
ALTER TABLE Parson RENAME Mayank;

-- To see every thing is good 
SELECT * FROM Mayank;
