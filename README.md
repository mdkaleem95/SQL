# SQL Practice Queries – 89 Hands-on Problems

## About the Project

This repository contains 89 SQL practice questions and their solutions based on three relational database tables:

- `SALESPEOPLE`
- `CUST`
- `ORDERS`

The purpose of this project is to improve SQL query-writing skills through practical examples, covering basic SQL operations to advanced querying techniques.

These queries are useful for Data Engineers, SQL Developers, and anyone preparing for technical interviews.

## Repository Structure

```text
sql-practice-queries/
│
├── sql_practice_queries.sql
│
└── README.md
```

## Database Tables

### 1. SALESPEOPLE

| Column | Description |
|---|---|
| SNUM | Salesperson Number |
| SNAME | Salesperson Name |
| CITY | Salesperson City |
| COMM | Commission Rate |

### 2. CUST

| Column | Description |
|---|---|
| CNUM | Customer Number |
| CNAME | Customer Name |
| CITY | Customer City |
| RATING | Customer Rating |
| SNUM | Assigned Salesperson Number |

### 3. ORDERS

| Column | Description |
|---|---|
| ONUM | Order Number |
| AMT | Order Amount |
| ODATE | Order Date |
| CNUM | Customer Number |
| SNUM | Salesperson Number |

## SQL Concepts Covered

The 89 queries cover the following topics:

### SQL Fundamentals
- SELECT and FROM
- WHERE conditions
- DISTINCT
- Comparison operators
- AND, OR, NOT

### Filtering and Sorting
- IN and NOT IN
- BETWEEN
- LIKE and wildcards
- NULL handling
- Date filtering

### Aggregate Functions
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING

### Joins
- INNER JOIN
- LEFT OUTER JOIN
- Self JOIN
- Multiple-table joins

### Subqueries
- Single-row subqueries
- Multiple-row subqueries
- Correlated subqueries
- EXISTS and NOT EXISTS
- ANY and ALL

### Set Operations
- UNION
- UNION ALL

### Advanced SQL
- Conditional filtering
- Customer and salesperson relationships
- Order analysis
- Group-based comparisons
- Identifying unmatched records

## How to Run

1. Install or access SQL Server.
2. Open SQL Server Management Studio (SSMS).
3. Create a database for SQL practice.
4. Create the three tables: SALESPEOPLE, CUST, and ORDERS.
5. Insert the sample records from the original practice document.
6. Open `sql_practice_queries.sql`.
7. Execute the queries individually.

**Note:** Some syntax, especially pattern matching and date handling, may need adjustment when using MySQL, PostgreSQL, or Oracle.

## Learning Objectives

- Understand SQL query execution.
- Improve data filtering and transformation skills.
- Work with relational database tables.
- Understand joins and relationships.
- Write subqueries and correlated subqueries.
- Solve real-world SQL interview problems.
- Build a strong SQL foundation for Data Engineering.

## Progress Tracker

- [x] Questions 1–5: SELECT, DISTINCT, WHERE
- [x] Questions 6–10: AND, OR, Comparison Operators
- [x] Questions 11–15: IN, BETWEEN, NULL, JOIN
- [x] Questions 16–20: LIKE, COUNT, GROUP BY, MAX
- [ ] Questions 21–25
- [ ] Questions 26–30
- [ ] Questions 31–35
- [ ] Questions 36–40
- [ ] Questions 41–45
- [ ] Questions 46–50
- [ ] Questions 51–55
- [ ] Questions 56–60
- [ ] Questions 61–65
- [ ] Questions 66–70
- [ ] Questions 71–75
- [ ] Questions 76–80
- [ ] Questions 81–85
- [ ] Questions 86–89

## Technology

- SQL
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Relational Database Concepts

## Author

**Mohd Kaleem**

Azure Data Engineer | Azure DevOps Engineer

This repository is part of my continuous learning journey and preparation for Data Engineering interviews.
