# Optimization Report

## Initial Query
Retrieved all bookings with user, property, and payment details using multiple JOINs.

## Performance Analysis (EXPLAIN)
- Full table scans were identified on Booking and Payment tables.
- No indexes were present on foreign key columns, causing slow joins.
- All columns were selected, even unnecessary ones.

## Refactoring Steps
- Added indexes to Booking.user_id, Booking.property_id, and Payment.booking_id
- Reduced selected columns to only required fields
- Re-tested with EXPLAIN: joins now use indexed lookups and performance improved significantly.

## Recommendation
Continue indexing frequently used JOIN and WHERE columns and avoid SELECT * in production queries.