-- SHOW GLOBAL VARIABLES LIKE 'local_infile';
-- SET GLOBAL local_infile = 1;
-- SELECT @@autocommit;
-- Drop DATABASE onlinebookstore;
-- CREATE DATABASE onlinebookstore ;
-- USE onlinebookstore ;


CREATE TABLE Books (
	Book_ID INT Auto_increment PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10,2),
    Stock INT);

-- DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);


-- DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

LOAD DATA LOCAL INFILE ''
INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock);
    
select * from books;
select * from customers;
select * from orders;



-- 1) Retrive all books in the "Fiction" genre;
SELECT * FROM books 
WHERE Genre = "Fiction";

-- #1) Count no of total_fiction_books ;
Select Count(*) AS total_fiction_books FROM books 
WHERE Genre = "Fiction";

-- 2) Find books published after the year 1950;
select * from books 
where published_year > 1950;

-- #2) Find count no of total_books published after 1950;
select count(*) from books 
where published_year > 1950;

-- 3) List all customers from the canada;
select * from customers
where country = "canada";

-- 4) Show order placed in november 2023;
select * from orders
where order_date between '2023-11-01' AND '2023-11-30';

-- #4) Show order_by ASC order placed in november 2023;
select * from orders
where order_date between '2023-11-01' AND '2023-11-30' order by order_date ASC;

-- 5) Retrieve the total stock of books available ;
SELECT sum(stock) AS total_stocks from books;

-- 6) Find the details of most expensive books;
select * from books order by price desc limit 1;

-- 7) show all customers who ordered more than 1 quantity of book
select e.customer_id,e.name, e.Email, o.customer_id, o.quantity from customers e
left join 
orders o
on e.customer_id = o.customer_id
where quantity > 1;

-- 8) Retrive all orders where the total amount exceed $20;
select * from orders 
where Total_amount > 20;

-- 9)  List all genres available in the books table;
select Distinct(genre) from  books;

-- 10) find the book with lowest stock 
select * from books order by stock ASC limit 10;

-- 11) Calculate the total revenue generated from all orders;
Select sum(total_amount) from orders;

-- 12) Retrieve the total number of books sold for each genre;
select b.Genre, sum(o.quantity) AS total_quantity from books b
join 
orders o
on b.book_id = o.book_id 
group by b.Genre ;


-- 12) Find the averge price of books in the fantasy genre;
select Avg(price) AS Average_Price from books
where genre = "fantasy";

-- 13) List customer who have placed at least 2 orders;

SELECT c.customer_id,
       c.name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;


-- 14) Find the most frequently ordered book;

SELECT b.book_id,
       b.title,
       b.genre,
       COUNT(o.order_id) AS order_count
FROM books b
JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.genre
ORDER BY order_count DESC
LIMIT 1;


-- 15) show the details of top 3 most expensive books;
select * from books 
where genre = "fantasy"
order by price desc limit 3;

-- 16)Retrive the total quantity of books sold by each author ;

select b.author, sum(o.quantity) As total_quantity from books b
join orders o
on b.book_id = o.book_id
group by b.author;

-- 17) List the cities where customers who spent over $30 are located ;
SELECT c.city
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.city
HAVING SUM(o.total_amount) > 30;

SELECT c.city
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
where o.total_amount > 30;

-- 18) find the customer who spent the most on orders
select c.name, sum(o.total_amount) as total_spent
from orders o 
join customers c
on o.customer_id = c.customer_id
group by c.customer_id, c.name 
order by total_spent desc limit 1;

-- 19)calculate the stocks remainig after fulfilling all orders;
select * from orders;
select * from customers;
select * from books;

SELECT b.book_id,
       b.title,
       b.stock,
       COALESCE(SUM(o.quantity), 0) AS sold_quantity,
       b.stock - COALESCE(SUM(o.quantity), 0) AS remaining_stock
FROM books b
LEFT JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock
order by b.book_id;


