-- Retrieve all bookings along with the respective users who made those bookings
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;

-- Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.user_id
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id;

-- FULL OUTER JOIN (Emulated with UNION in MySQL) - Retrieve all users and bookings
SELECT u.user_id, u.first_name, u.last_name, u.email, u.role,
       b.booking_id, b.property_id, b.start_date, b.end_date, b.status
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id

UNION

SELECT u.user_id, u.first_name, u.last_name, u.email, u.role,
       b.booking_id, b.property_id, b.start_date, b.end_date, b.status
FROM booking b
LEFT JOIN user u ON b.user_id = u.user_id
WHERE u.user_id IS NULL
ORDER BY user_id, booking_id;