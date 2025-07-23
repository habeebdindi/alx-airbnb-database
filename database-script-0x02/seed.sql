-- Users
INSERT INTO "User" (user_id, first_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Alice', 'alice.smith@example.com', 'hashedpass1', '+1234567890', 'host', '2025-07-01 10:00:00'),
('550e8400-e29b-41d4-a716-446655440001', 'Bob', 'bob.johnson@example.com', 'hashedpass2', '+0987654321', 'guest', '2025-07-02 14:30:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Charlie', 'charlie.brown@example.com', 'hashedpass3', '+1112223333', 'admin', '2025-07-03 09:15:00');

-- Properties
INSERT INTO "Property" (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440000', 'Cozy Cottage', 'A charming cottage with a garden.', 'Cape Town, South Africa', 150.00, '2025-07-05 12:00:00', '2025-07-12 15:00:00'),
('550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440000', 'City Apartment', 'Modern apartment with city views.', 'Johannesburg, South Africa', 200.00, '2025-07-06 13:30:00', '2025-07-13 14:00:00');

-- Bookings
INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', '2025-07-15', '2025-07-17', 300.00, 'confirmed', '2025-07-10 16:00:00'),
('550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', '2025-07-20', '2025-07-22', 400.00, 'pending', '2025-07-12 09:30:00');

-- Payments
INSERT INTO "Payment" (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440005', 300.00, '2025-07-11 10:00:00', 'credit_card'),
('550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440006', 400.00, '2025-07-13 14:30:00', 'paypal');

-- Reviews
INSERT INTO "Review" (review_id, property_id, user_id, rating, comment, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', 4, 'Great stay, very cozy!', '2025-07-18 08:00:00'),
('550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', 5, 'Amazing view, highly recommend!', '2025-07-23 11:00:00');

-- Messages
INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440000', 'Can I check in early?', '2025-07-12 15:00:00'),
('550e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'Yes, 2 PM is fine.', '2025-07-12 16:00:00');
