## SQL Join Queries

### 1. INNER JOIN: Bookings with Users
Retrieves all bookings along with the users who made them.

### 2. LEFT JOIN: Properties with Reviews
Retrieves all properties and their associated reviews, including properties with no reviews.

### 3. FULL OUTER JOIN: Users and Bookings
Retrieves all users and all bookings, including users with no bookings and bookings without a linked user (using UNION to simulate FULL OUTER JOIN).

## 🧠 SQL Subqueries – Advanced Queries

This file contains SQL queries demonstrating both **non-correlated** and **correlated subqueries** using the schema from the **ALX Airbnb Database** project.

---

## 🔹 1. Non-Correlated Subquery

### 🎯 Objective:
Find all properties where the **average rating is greater than 4.0**.

### 🧾 Description:
This query uses a non-correlated subquery that computes the average rating for each property and selects only those with an average above 4.0.

## 🔹 1. Aggregation Queries

### 🎯 Objective:
Use standard SQL aggregation functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) to extract insights from data.

### 💻 Examples:

#### 🏘️ Count total number of properties per host:
```sql
SELECT 
    host_id,
    COUNT(*) AS total_properties
FROM 
    Property
GROUP BY 
    host_id;