# Airbnb Clone Database Schema

## Directory: `database-script-0x01`

This directory contains the SQL script used to create the initial schema for the Airbnb clone project.

---

## 📁 Files

### `schema.sql`
Defines the following database tables and their constraints:

- **User**: Stores user information including roles and contact info.
- **Property**: Stores property listings linked to hosts.
- **Booking**: Manages user bookings for properties.
- **Payment**: Tracks payments for bookings.
- **Review**: Stores user reviews for properties.
- **Message**: Stores messages exchanged between users.

All tables are normalized to **Third Normal Form (3NF)**. Foreign key relationships are properly defined, and indexing is applied to commonly queried fields.

---

### `README.md`
Provides documentation and context for the database schema setup.

---

## 🧩 Technologies

- SQL (ANSI-compliant; tested with PostgreSQL & MySQL)
- UUIDs for primary keys
- ENUMs for controlled attribute values
- Foreign key constraints
- Indexing for performance optimization

---

## 📌 Usage

To create the database schema:

```bash
psql -d your_database_name -f schema.sql
