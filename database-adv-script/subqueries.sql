-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

SELECT 
    property_id,
    name AS property_name,
    location
FROM 
    Property
WHERE 
    property_id IN (
        SELECT property_id
        FROM Review
        GROUP BY property_id
        HAVING AVG(rating) > 4.0
    );

-- Write a correlated subquery to find users who have made more than 3 bookings.

SELECT 
    u.user_id,
    u.first_name,
    u.last_name
FROM 
    User u
WHERE 
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) > 3;

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