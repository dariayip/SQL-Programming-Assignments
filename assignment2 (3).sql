'Question 1'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
CREATE DATABASE `Hollywood`;
USE `Hollywood`;

CREATE TABLE Movie (
mID integer AUTO_INCREMENT primary key, title text, year int, check (year < 2016), director text);

CREATE TABLE Reviewer (
rID integer auto_increment primary key, name text);

CREATE TABLE Rating (
rID Integer, mID Integer, stars Integer, ratingDate timestamp default now());

ALTER TABLE Rating ADD CONSTRAINT fk_mID FOREIGN KEY (mID) REFERENCES Movie(mID);
ALTER TABLE Rating ADD CONSTRAINT fk_rID FOREIGN KEY (rID) REFERENCES Reviewer(rID);

Describe Movie;
Describe Reviewer;
Describe Rating;

'Question2'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
DROP DATABASE IF EXISTS cind110A2Script1;
CREATE DATABASE cind110A2Script1; 
USE cind110A2Script1;

CREATE TABLE hiking (trail CHAR (50),
area CHAR(50), 
distance FLOAT, 
est_time FLOAT
);

SHOW TABLES;
SHOW COLUMNS FROM hiking;

INSERT INTO hiking VALUES
('Cedar Creek Falls', 'Upper San Diego', 4.5, 2.5);

INSERT INTO hiking(trail, area) VALUES ( 'East Mesa Loop', 'Cuyamaca Mountains');

SELECT * FROM hiking;
SET SQL_SAFE_UPDATES = 0;

UPDATE hiking
SET distance = 5.5, est_time = 5.5
WHERE trail = 'East Mesa Loop'; 

USE cind110A2Script1;

DELETE FROM hiking WHERE trail = 'Cedar Creek Falls';
SELECT * FROM hiking;

UPDATE hiking
SET distance = 10.50, est_time = 10.50
WHERE trail = 'East Mesa Loop'; 

SELECT * from hiking;
INSERT INTO hiking(trail, distance) VALUES ('Oak Canyon', 3.00);

UPDATE hiking
SET area = 'Mission Trails Regional Park', est_time = 2
WHERE trail = 'Oak Canyon';

DELETE FROM hiking WHERE distance > 5;

CREATE TABLE rating(trail varchar(50), difficulty int);

ALTER TABLE hiking ADD COLUMN trailID decimal(10, 5) primary key;
ALTER TABLE rating ADD COLUMN trailID decimal(10, 5);
ALTER TABLE rating ADD CONSTRAINT fk_trailID FOREIGN KEY (trailID) REFERENCES hiking(trailID);

'Command to delete the rating table is: 
DROP TABLE rating;
'

'Question 3'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Customer, Salesman, Order Tables'

CREATE DATABASE Question3;
USE Question3;

CREATE TABLE Salesman(salesman_id int primary key, name varchar(50), city varchar(30), commission decimal(3, 2));

CREATE TABLE Customer(customer_id int primary key, cust_name varchar(50), city varchar(30), grade int, salesman_id int)
ALTER TABLE Customer ADD CONSTRAINT fk_salesman_id FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id);

CREATE TABLE OrderTable(Order_No int primary key, Purch_Amt decimal(6,2), Ord_Date date, customer_id int, salesman_id int);
ALTER TABLE OrderTable ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);
ALTER TABLE OrderTable ADD CONSTRAINT fk_salesman_id2 FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id);

SELECT Salesman.name, Customer.cust_name, Customer.city from Customer inner join Salesman on Customer.city = Salesman.city;
SELECT OrderTable.Order_No, OrderTable.Purch_Amt, Customer.cust_name, Customer.city from Customer inner join OrderTable WHERE OrderTable.Purch_Amt between 500 and 2000;
SELECT Salesman.name, Customer.cust_name from Customer inner join Salesman on Customer.salesman_id = Salesman.salesman_id;
'SELECT Salesman.name, Customer.cust_name, FROM Customer, Salesman where Salesman.salesman_id = Customer.salesman_id;' 'alternative'

SELECT Customer.cust_name, Salesman.name, Customer.city, Salesman.city, Salesman.commission from Salesman, Customer WHERE Salesman.commission > 0.12;
SELECT Customer.cust_name, Salesman.name, Customer.city, Salesman.city, Salesman.commission from Salesman, Customer WHERE Salesman.commission > 0.12 And 
NOT Customer.city = Salesman.city;

SELECT OrderTable.Order_No, OrderTable.Ord_Date, OrderTable.Purch_Amt, Customer.cust_name, Salesman.name, Salesman.commission 
from ((OrderTable inner join Customer ON Customer.customer_id = OrderTable.customer_id) INNER JOIN Salesman ON Salesman.salesman_id = OrderTable.salesman_id);

SELECT * FROM OrderTable natural join Customer natural join Salesman; 

INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3002', 'Nick Rimando', 'New York', '100', '5001');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3005', 'Graham Zusi', 'California', '200', '5002');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `salesman_id`) VALUES ('3001', 'Brad Guzan', 'London', '5005');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3004', 'Fabian Johns', 'Paris', '300', '5006');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3007', 'Brad Davis', 'New York', '200', '5001');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3009', 'Geoff Camero', 'Berlin', '100', '5003');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3008', 'Julian Green', 'London', '300', '5002');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3003', 'Jozy Altidor', 'Moscow', '200', '5007');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3002', 'Nick Rimando', 'New York', '100', '5001');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3005', 'Graham Zusi', 'California', '200', '5002');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3001', 'Brad Guzan', 'London', 'NULL', '5005');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3004', 'Fabian Johns', 'Paris', '300', '5006');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3007', 'Brad Davis', 'New York', '200', '5001');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3009', 'Geoff Camero', 'Berlin', '100', '5003');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3008', 'Julian Green', 'London', '300', '5002');
INSERT INTO `Question3`.`Customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3003', 'Jozy Altidor', 'Moscow', '200', '5007');

INSERT INTO `Question3`.`Salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES ('5001', 'James Hoog', 'New York', '0.15');
INSERT INTO `Question3`.`Salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES ('5002', 'Nail Knite', 'Paris', '0.13');
INSERT INTO `Question3`.`Salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES ('5005', 'Pit Alex', 'London', '0.11');
INSERT INTO `Question3`.`Salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES ('5006', 'Mc Lyon', 'Paris', '0.14');
INSERT INTO `Question3`.`Salesman` (`salesman_id`, `name`, `commission`) VALUES ('5003', 'Lauson Hen', '0.12');
INSERT INTO `Question3`.`Salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES ('5007', 'Paul Adam', 'Rome', '0.13');

INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70001', '150.5', '2012-10-05', '3005', '5002');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70009', '270.65', '2012-09-10', '3001', '5005');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70004', '110.5', '2012-08-17', '3009', '5003');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70002', '65.26', '2012-10-05', '3002', '5001');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70007', '948.5', '2012-09-10', '3005', '5002');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70008', '5760', '2012-09-10', '3002', '5001');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70010', '1983.43', '2012-10-10', '3004', '5006');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70003', '2480.4', '2012-10-10', '3009', '5003');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70012', '250.45', '2012-06-27', '3008', '5002');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70011', '75.29', '2012-08-17', '3003', '5007');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70013', '3045.6', '2012-04-25', '3002', '5001');
INSERT INTO `Question3`.`OrderTable` (`Order_No`, `Purch_Amt`, `Ord_Date`, `customer_id`, `salesman_id`) VALUES ('70005', '2400.6', '2012-07-27', '3007', '5001');

SELECT * FROM Salesman;
SELECT * FROM Customer;
SELECT * FROM OrderTable;

'Question 4'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'
FINAL ANSWER:
STUDENT: SSN is the PK
COURSE: N/A
ENROLL: SSN is a FK that references STUDENT.SSN PK, COURSE# is a FK that references Course.Course# PK.
BOOK ADOPTION: COURSE# is a FK that references Course.Course# PK, Book ISBN is a FK that references Text.Book ISBN PK
TEXT: N/A

'
