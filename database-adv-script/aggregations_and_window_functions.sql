-- A query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT COUNT(*), user_id
FROM "Booking" b
GROUP BY b.user_id;

-- Using a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT p.property_id, p.name, COUNT(b.booking_id) AS "booking_count", ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number
FROM "Property" p LEFT JOIN "Booking" b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
