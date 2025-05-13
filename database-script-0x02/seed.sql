-- Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest'),
  ('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '2345678901', 'host'),
  ('33333333-3333-3333-3333-333333333333', 'Carol', 'Lee', 'carol@example.com', 'hashed_pw3', NULL, 'admin');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Cottage', 'A small cozy cottage in the woods.', 'Vermont, USA', 150.00),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Downtown Loft', 'Modern apartment in the city center.', 'New York, USA', 250.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('b1b1b1b1-b1b1-b1b1-b1b1-b1b1b1b1b1b1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-06-01', '2025-06-05', 600.00, 'confirmed'),
  ('b2b2b2b2-b2b2-b2b2-b2b2-b2b2b2b2b2b2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-07-10', '2025-07-12', 500.00, 'pending');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
  ('c1c1c1c1-c1c1-c1c1-c1c1-c1c1c1c1c1c1', 'b1b1b1b1-b1b1-b1b1-b1b1-b1b1b1b1b1b1', 600.00, 'credit_card');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
  ('r1r1r1r1-r1r1-r1r1-r1r1-r1r1r1r1r1r1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Wonderful stay! Very clean and cozy.'),
  ('r2r2r2r2-r2r2-r2r2-r2r2-r2r2r2r2r2r2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 4, 'Great location, a bit noisy at night.');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
  ('m1m1m1m1-m1m1-m1m1-m1m1-m1m1m1m1m1m1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, is the cottage available for next week?'),
  ('m2m2m2m2-m2m2-m2m2-m2m2-m2m2m2m2m2m2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, yes it’s available!');
