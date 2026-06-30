# sql-online-bookstore-analysis
A comprehensive SQL portfolio project demonstrating database design, data analysis, business reporting, customer segmentation, revenue analysis, and inventory tracking using MySQL, JOINs, GROUP BY, HAVING, aggregate functions, and subqueries.

# 📚 SQL Online Bookstore Data Analytics Project
## 📖 Project Overview

This project demonstrates how SQL can be used to solve real-world business problems in an Online Bookstore Management System.

The project was built using **MySQL** and includes database design, CSV data import, relational tables, and analytical SQL queries to generate business insights.

It is designed as a portfolio project for Data Analyst and Business Analyst roles.
---

# 🎯 Objectives

- Design a relational database using MySQL
- Import real-world data from CSV files
- Perform business analysis using SQL
- Practice Joins, Aggregations, and Filtering
- Generate insights from bookstore sales data

---

# 🛠 Tech Stack

- MySQL
- MySQL Workbench
- SQL
- CSV Dataset
- GitHub

---

# 🗄 Database Schema

## Tables

### Books
- Book_ID (Primary Key)
- Title
- Author
- Genre
- Published_Year
- Price
- Stock

### Customers
- Customer_ID (Primary Key)
- Name
- Email
- Phone
- City
- Country

### Orders
- Order_ID (Primary Key)
- Customer_ID (Foreign Key)
- Book_ID (Foreign Key)
- Order_Date
- Quantity
- Total_Amount

---

# 📂 Dataset

The project uses three CSV files.

```
Books.csv
Customers.csv
Orders.csv
```

---

# 📥 Importing CSV Files

The dataset was imported using:

```sql
LOAD DATA LOCAL INFILE
```

Example

```sql
LOAD DATA LOCAL INFILE 'Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

---

# ⚠ Common CSV Import Problems

## Problem 1

```
Loading local data is disabled
```

### Solution

Enable LOCAL INFILE

```sql
SET GLOBAL local_infile = 1;
```

Restart MySQL.

---

## Problem 2

```
Error Code 2068
```

### Solution

Use

```
Table Data Import Wizard
```

inside MySQL Workbench.

---

## Problem 3

```
Incorrect File Path
```

### Solution

Use the complete file path.

Example

```
C:/Users/HP/Documents/Books.csv
```

---

## Problem 4

CSV not importing correctly

### Check

- Delimiter
- Encoding (UTF-8)
- Ignore Header Row
- Column Mapping

---

# 📊 SQL Concepts Covered

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- DISTINCT
- LIMIT
- COUNT
- SUM
- AVG
- INNER JOIN
- LEFT JOIN
- COALESCE

---

# 📈 Business Problems Solved

✔ Retrieve Fiction books

✔ Books published after 1950

✔ Customers from Canada

✔ Orders in November 2023

✔ Total inventory

✔ Most expensive book

✔ High-value orders

✔ Genre analysis

✔ Revenue analysis

✔ Average Fantasy book price

✔ Repeat customers

✔ Most frequently ordered book

✔ Author-wise sales

✔ Highest spending customer

✔ Remaining inventory

…and more (20 business questions).

---

# 📁 Repository Structure

```
sql-online-bookstore-analysis
│
├── README.md
├── schema.sql
├── queries.sql
├── Books.csv
├── Customers.csv
├── Orders.csv
│
├── docs
│   └── SQL_Portfolio_Report.pdf
│
└── screenshots
```

---

# 💡 Key Insights

- Calculated total revenue
- Identified highest spending customer
- Found best-selling books
- Analyzed inventory levels
- Measured genre-wise sales
- Generated customer purchase insights

---

# 🚀 Future Improvements

- Add stored procedures
- Create SQL Views
- Add Triggers
- Optimize queries using Indexes
- Build an interactive Power BI Dashboard
- Connect the database with Python

---

# 👨‍💻 Author

**Govind Singh Chouhan**

- LinkedIn: https://www.linkedin.com/in/govind-singh-chouhan/
- GitHub: *(...)*

---

## ⭐ If you found this project useful, consider giving it a Star!
