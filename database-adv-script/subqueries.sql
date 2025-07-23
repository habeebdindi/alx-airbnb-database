-- A query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT *
FROM "Property" p
JOIN (SELECT AVG(rating) AS "avg_rating", "property_id" FROM "Review" GROUP BY "property_id") r
ON p.property_id = r.property_id
WHERE r.avg_rating > 4.0

-- A correlated subquery to find users who have made more than 3 bookings.
SELECT u.user_id, u.first_name
FROM "User" u
WHERE (SELECT COUNT(*) FROM "Booking" b WHERE b.user_id = u.user_id) > 3;
