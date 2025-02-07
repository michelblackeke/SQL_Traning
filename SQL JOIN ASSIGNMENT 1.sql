--SQL Join Assignment:
--table.

--—BEST_CUSTOMERS TABLE

--1:Creating a BEST_BUY CUSTOMERS  table
CREATE TABLE BEST_BUY_CUSTOMERS
( 
  CUSTOMER_ID INT NOT NULL,
 FIRST_NAME VARCHAR(50) NULL,
 LAST_NAME VARCHAR(50) NULL,
 AGE INT NOT NULL,
COUNTRY VARCHAR(50) NULL
);


--2:LOAD DATA TO THE BEST_BUY_CUSTOMERS TABLE
INSERT INTO BEST_BUY_CUSTOMERS
(CUSTOMER_ID, FIRST_NAME, LAST_NAME, AGE, COUNTRY)
VALUES (1, 'John', 'Doe', 31, 'USA'),
(2, 'Robert', 'Luna', 22, 'USA'),
(3, 'David', 'Robinson', 22, 'UK'),
(4, 'John', 'Reinhardt', 25, 'UK'),
(5, 'Betty', 'Doe', 28, 'UAE')

 
--2:Creating an ORDER table

CREATE TABLE BEST_BUY_ORDERS
(
   ORDER_ID INT NOT NULL,
   ITEM VARCHAR(50) NULL,
   AMOUNT MONEY,
   CUSTOMER_ID INT NOT NULL
);


--2:LOAD DATA TO THE ( 1, 'Keyboard', 400,4), TABLE
INSERT INTO BEST_BUY_ORDERS
(ORDER_ID, ITEM, AMOUNT, CUSTOMER_ID)
VALUES ( 1, 'Keyboard', 400,4),
( 2, 'Mouse', 300,4),
( 3, 'Monitor', 12000,3),
( 4, 'Keyboard', 400,1),
( 5, 'Mousepad', 250,2)


--2:Creating a BEST_BUY_PRODUCTS table

CREATE TABLE BEST_BUY_PRODUCTS
(
   PRODUCT_ID INT NOT NULL,
   PRODUCT_NUMBER VARCHAR(50) NULL,
   AMOUNT MONEY,
   CUSTOMER_ID INT NOT NULL
);


--2:LOAD DATA TO THE ( 1, 'Keyboard', 400,4), TABLE
INSERT INTO BEST_BUY_PRODUCTS
(PRODUCT_ID, PRODUCT_NUMBER, AMOUNT, CUSTOMER_ID)
VALUES ( 1, 'Keyboard', 400,5),
( 2, 'Headphone', 300,4),
( 3, 'Laptop', 12000,3),
( 4, 'Pen', 400,1),
( 5, 'Mousepad', 250,2)

--Please produce report by answering the questions below:


--1: Write a query that shows customer who bought item Mouse

Select c.*, 
       o.ITem 
From Tech53Training.dbo.BEST_BUY_CUSTOMERS c
       Left join Tech53Training.dbo.BEST_BUY_ORDERS o
       on c.CUSTOMER_ID = o.CUSTOMER_ID
Where o.ITEM = 'Mouse'

--2: SHOW ME THE CUSTOMER INFO AND THE ITEM THAT THEY ORDER, THE PRODUCT BUT ONLY SHOW THE PRODUCT FOR PEN
Select c.*,
       o.ITEM,
	   p.PRODUCT_NUMBER
From Tech53Training.dbo.BEST_BUY_CUSTOMERS c
	   Inner Join Tech53Training.dbo.BEST_BUY_ORDERS o
	   On c.CUSTOMER_ID = o.CUSTOMER_ID
	   Inner join Tech53Training.dbo.BEST_BUY_PRODUCTS p
	   On p.CUSTOMER_ID = c.CUSTOMER_ID
Where p.PRODUCT_NUMBER = 'pen'