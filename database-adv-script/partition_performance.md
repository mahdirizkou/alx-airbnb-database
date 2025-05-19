# 📊 Table Partitioning Performance Analysis

This report analyzes the performance impact of implementing **RANGE partitioning** on the `booking` table in the **ALX-AirBnB** database. As the `booking` table grows in size, query performance—particularly for date-range operations—can degrade due to full table scans and high I/O costs.

---

## 🔍 Problem Overview

The `booking` table is central to the application, and many operations rely on filtering bookings based on `start_date`, such as:

- Searching for available properties within a specific timeframe
- Generating reports grouped by time periods (e.g., quarters, years)
- Calculating booking trends for business insights

Without partitioning, these operations rely on scanning the entire table, resulting in slow performance, especially on large datasets.

---

## 🛠️ Solution: RANGE Partitioning by Date

To improve performance, the `booking` table was redesigned using **RANGE partitioning** based on `start_date`. Partitions were defined quarterly using the expression:

```sql
YEAR(start_date) * 100 + MONTH(start_date)
