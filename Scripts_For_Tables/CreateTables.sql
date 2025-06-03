--Create Tables For Case Study
CREATE TABLE DannysDiner.Sales (
  CustomerId VARCHAR(1),
  OrderDate DATE,
  ProductId INT
);

INSERT INTO DannysDiner.Sales
  (CustomerId, OrderDate, ProductId)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE DannysDiner.Menu (
  ProductId INT,
  ProductName VARCHAR(5),
  Price INT
);

INSERT INTO DannysDiner.Menu
  (ProductId, ProductName, Price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE DannysDiner.Members (
  CustomerId VARCHAR(1),
  JoinDate DATE
);

INSERT INTO DannysDiner.Members
  (CustomerId, JoinDate)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');