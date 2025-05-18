# 🚀 Index Optimization and Query Performance

This document outlines the creation of indexes to improve query performance on high-usage columns in the **User**, **Booking**, and **Property** tables of the **ALX Airbnb database**.

---

## 🎯 Objective

- Identify frequently accessed columns used in `WHERE`, `JOIN`, and `ORDER BY` clauses.
- Create indexes to speed up read/query operations.
- Measure query performance **before and after** indexing using `EXPLAIN` or `ANALYZE`.

---

## 🔍 High-Usage Columns Identified

| Table     | Column Name     | Usage Pattern                    |
|-----------|------------------|----------------------------------|
| `User`    | `email`          | `WHERE`, `JOIN`                  |
| `Booking` | `user_id`        | `JOIN`, `WHERE`                  |
| `Booking` | `property_id`    | `JOIN`                           |
| `Property`| `host_id`        | `JOIN`, `WHERE`                  |
| `Property`| `location`       | `WHERE`, `ORDER BY`              |

---

## 🛠️ Index Creation

SQL commands saved in: `database_index.sql`

```sql
-- User Table Indexes
CREATE INDEX idx_user_email ON User(email);

-- Booking Table Indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Property Table Indexes
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
