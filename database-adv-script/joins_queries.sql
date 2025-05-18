select * from User INNER JOIN Booking ON User.user_id = Booking.user_id;;
select * from Property LEFT JOIN Review ON Property.property_id = Review.property_id;
select * from User FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;