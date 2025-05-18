-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM 
    Booking
GROUP BY 
    user_id;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM 
    Booking
GROUP BY 
    property_id
ORDER BY 
    booking_rank;
-- Query 2: Rank properties based on total number of bookings using ROW_NUMBER window function
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    COUNT(b.booking_id) AS booking_count,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    property p
LEFT JOIN 
    booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.location, p.price_per_night
ORDER BY 
    booking_count DESC, p.price_per_night DESC;

-- Query 3: Alternative ranking using RANK() to handle ties
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank,
    DENSE_RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS dense_booking_rank,
    AVG(COALESCE(r.rating, 0)) AS avg_rating
FROM 
    property p
LEFT JOIN 
    booking b ON p.property_id = b.property_id
LEFT JOIN 
    review r ON p.property_id = r.property_id
GROUP BY 
    p.property_id, p.name, p.location, p.price_per_night
ORDER BY 
    booking_count DESC, avg_rating DESC, p.price_per_night DESC;

-- Query 4: Window function to rank properties by region and booking count
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    COUNT(b.booking_id) AS booking_count,
    ROW_NUMBER() OVER (PARTITION BY p.location ORDER BY COUNT(b.booking_id) DESC) AS regional_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS overall_rank
FROM 
    property p
LEFT JOIN 
    booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.location
ORDER BY 
    p.location, regional_rank;
