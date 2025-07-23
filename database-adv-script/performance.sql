alx_db=# EXPLAIN ANALYZE SELECT b.booking_id, u.first_name, u.email, u.phone_number, p.name, p.location, p.price_per_night, pay.payment_date, pay.payment_method FROM "Booking" b INNER JOIN "User" u ON (b.user_id = u.user_id) INNER JOIN "Property" p ON (b.property_id = p.property_id) INNER JOIN "Payment" pay ON (b.booking_id = pay.booking_id);
                                                          QUERY PLAN                                                          
------------------------------------------------------------------------------------------------------------------------------
 Nested Loop  (cost=0.00..4.27 rows=2 width=110) (actual time=0.028..0.035 rows=2 loops=1)
   Join Filter: (b.property_id = p.property_id)
   Rows Removed by Join Filter: 1
   ->  Nested Loop  (cost=0.00..3.20 rows=2 width=82) (actual time=0.023..0.028 rows=2 loops=1)
         Join Filter: (b.user_id = u.user_id)
         Rows Removed by Join Filter: 2
         ->  Nested Loop  (cost=0.00..2.09 rows=2 width=56) (actual time=0.015..0.019 rows=2 loops=1)
               Join Filter: (b.booking_id = pay.booking_id)
               Rows Removed by Join Filter: 1
               ->  Seq Scan on "Payment" pay  (cost=0.00..1.02 rows=2 width=24) (actual time=0.006..0.007 rows=2 loops=1)
               ->  Materialize  (cost=0.00..1.03 rows=2 width=48) (actual time=0.003..0.004 rows=2 loops=2)
                     ->  Seq Scan on "Booking" b  (cost=0.00..1.02 rows=2 width=48) (actual time=0.004..0.004 rows=2 loops=1)
         ->  Materialize  (cost=0.00..1.04 rows=3 width=58) (actual time=0.002..0.003 rows=2 loops=2)
               ->  Seq Scan on "User" u  (cost=0.00..1.03 rows=3 width=58) (actual time=0.003..0.003 rows=2 loops=1)
   ->  Materialize  (cost=0.00..1.03 rows=2 width=60) (actual time=0.002..0.002 rows=2 loops=2)
         ->  Seq Scan on "Property" p  (cost=0.00..1.02 rows=2 width=60) (actual time=0.003..0.003 rows=2 loops=1)
 Planning Time: 0.401 ms
 Execution Time: 0.061 ms
(18 rows)

alx_db=# EXPLAIN ANALYZE SELECT b.booking_id, u.first_name, u.email, u.phone_number,                                                   p.name, p.location, p.price_per_night, 
       pay.payment_date, pay.payment_method 
FROM "Payment" pay
JOIN "Booking" b ON pay.booking_id = b.booking_id
JOIN "User" u ON b.user_id = u.user_id
JOIN "Property" p ON b.property_id = p.property_id;


---INITIAL---

							QUERY PLAN                                                          
------------------------------------------------------------------------------------------------------------------------------
 Nested Loop  (cost=0.00..4.27 rows=2 width=110) (actual time=0.039..0.047 rows=2 loops=1)
   Join Filter: (b.property_id = p.property_id)
   Rows Removed by Join Filter: 1
   ->  Nested Loop  (cost=0.00..3.20 rows=2 width=82) (actual time=0.032..0.037 rows=2 loops=1)
         Join Filter: (b.user_id = u.user_id)
         Rows Removed by Join Filter: 2
         ->  Nested Loop  (cost=0.00..2.09 rows=2 width=56) (actual time=0.021..0.025 rows=2 loops=1)
               Join Filter: (pay.booking_id = b.booking_id)
               Rows Removed by Join Filter: 1
               ->  Seq Scan on "Payment" pay  (cost=0.00..1.02 rows=2 width=24) (actual time=0.007..0.008 rows=2 loops=1)
               ->  Materialize  (cost=0.00..1.03 rows=2 width=48) (actual time=0.006..0.006 rows=2 loops=2)
                     ->  Seq Scan on "Booking" b  (cost=0.00..1.02 rows=2 width=48) (actual time=0.004..0.005 rows=2 loops=1)
         ->  Materialize  (cost=0.00..1.04 rows=3 width=58) (actual time=0.004..0.004 rows=2 loops=2)
               ->  Seq Scan on "User" u  (cost=0.00..1.03 rows=3 width=58) (actual time=0.003..0.004 rows=2 loops=1)
   ->  Materialize  (cost=0.00..1.03 rows=2 width=60) (actual time=0.003..0.004 rows=2 loops=2)
         ->  Seq Scan on "Property" p  (cost=0.00..1.02 rows=2 width=60) (actual time=0.003..0.003 rows=2 loops=1)
 Planning Time: 0.618 ms
 Execution Time: 0.074 ms
(18 rows)
