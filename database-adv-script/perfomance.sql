-- Initial complex query to retrieve all bookings with user, property, and payment details

SELECT
    Booking.booking_id,
    Booking.booking_date,
    Booking.check_in,
    Booking.check_out,
    
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    
    Payment.payment_id,
    Payment.amount,
    Payment.status,
    Payment.payment_date

FROM
    Booking

JOIN User ON Booking.user_id = User.user_id
JOIN Property ON Booking.property_id = Property.property_id
JOIN Payment ON Booking.booking_id = Payment.booking_id;

EXPLAIN SELECT
    Booking.booking_id,
    Booking.booking_date,
    Booking.check_in,
    Booking.check_out,
    
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    
    Payment.payment_id,
    Payment.amount,
    Payment.status,
    Payment.payment_date

FROM
    Booking

JOIN User ON Booking.user_id = User.user_id
JOIN Property ON Booking.property_id = Property.property_id
JOIN Payment ON Booking.booking_id = Payment.booking_id;

-- Optimized query - Final version
-- Using covering indexes and limiting columns to only what's necessary
-- Adding STRAIGHT_JOIN hint to enforce join order
EXPLAIN ANALYZE
SELECT STRAIGHT_JOIN
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM 
    booking b
    USE INDEX (idx_booking_status)
JOIN 
    user u ON b.user_id = u.user_id
JOIN 
    property p ON b.property_id = p.property_id
LEFT JOIN 
    payment pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed'
    AND b.start_date BETWEEN '2025-01-01' AND '2025-12-31'  -- Using BETWEEN for better index usage
ORDER BY 
    b.start_date DESC
LIMIT 100;