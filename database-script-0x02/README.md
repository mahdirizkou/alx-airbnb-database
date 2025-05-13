This directory contains SQL scripts to populate the Airbnb clone database with sample data.

---

## 📁 Files

### `seed.sql`
Provides sample `INSERT` statements for:

- **Users** (guests, hosts, admin)
- **Properties** listed by hosts
- **Bookings** made by users
- **Payments** linked to bookings
- **Reviews** written by guests
- **Messages** exchanged between users

---

## 📌 Usage

Make sure the database schema is already created using `schema.sql`, then:

```bash
psql -d your_database_name -f seed.sql
