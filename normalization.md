# Database Normalization to 3NF

## Normalization Principles

### First Normal Form (1NF)
- All table columns must contain atomic (indivisible) values.
- Each record must be unique.

### Second Normal Form (2NF)
- Must be in 1NF.
- All non-key attributes must be fully functionally dependent on the entire primary key.

### Third Normal Form (3NF)
- Must be in 2NF.
- There should be no transitive dependency (non-key attributes depending on other non-key attributes).

---

## Schema Review

### ✅ User Table

**Primary Key**: `user_id`

- Atomic values ✔️
- No partial dependencies ✔️
- No transitive dependencies ✔️

**Conclusion**: In 3NF

---

### ✅ Property Table

**Primary Key**: `property_id`  
**Foreign Key**: `host_id → User(user_id)`

- Atomic values ✔️
- All attributes depend only on the primary key ✔️

**Conclusion**: In 3NF

---

### ✅ Booking Table

**Primary Key**: `booking_id`  
**Foreign Keys**: 
- `property_id → Property(property_id)`
- `user_id → User(user_id)`

**Note**:
- `total_price` is a derived field (`pricepernight * number_of_nights`)
- Including it is justified for performance and historical accuracy

**Conclusion**: In 3NF

---

### ✅ Payment Table

**Primary Key**: `payment_id`  
**Foreign Key**: `booking_id → Booking(booking_id)`

- All fields depend directly on the primary key ✔️