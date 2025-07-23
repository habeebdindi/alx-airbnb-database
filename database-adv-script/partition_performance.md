# Partition Performance
Overall it increased the read speed.

```
alx_db=# EXPLAIN ANALYZE SELECT * FROM "Booking_old";
                                               QUERY PLAN                                               
--------------------------------------------------------------------------------------------------------
 Seq Scan on "Booking_old"  (cost=0.00..1.02 rows=2 width=73) (actual time=0.007..0.008 rows=2 loops=1)
 Planning Time: 0.056 ms
 Execution Time: 0.017 ms
(3 rows)


alx_db=# EXPLAIN ANALYZE SELECT * FROM "Booking";
                                                           QUERY PLAN                                                           
--------------------------------------------------------------------------------------------------------------------------------
 Append  (cost=0.00..58.35 rows=1890 width=100) (actual time=0.010..0.013 rows=2 loops=1)
   ->  Seq Scan on booking_2025_q1 "Booking_1"  (cost=0.00..16.30 rows=630 width=100) (actual time=0.003..0.003 rows=0 loops=1)
   ->  Seq Scan on booking_2025_q3 "Booking_2"  (cost=0.00..16.30 rows=630 width=100) (actual time=0.006..0.006 rows=2 loops=1)
   ->  Seq Scan on booking_2025_q4 "Booking_3"  (cost=0.00..16.30 rows=630 width=100) (actual time=0.002..0.002 rows=0 loops=1)
 Planning Time: 0.082 ms
 Execution Time: 0.028 ms
(6 rows)


alx_db=# EXPLAIN ANALYZE SELECT * FROM "booking_2025_q3";
                                                  QUERY PLAN                                                  
--------------------------------------------------------------------------------------------------------------
 Seq Scan on booking_2025_q3  (cost=0.00..16.30 rows=630 width=100) (actual time=0.008..0.009 rows=2 loops=1)
 Planning Time: 0.088 ms
 Execution Time: 0.018 ms
(3 rows)

alx_db=# EXPLAIN ANALYZE SELECT * FROM "booking_2025_q3";
                                                  QUERY PLAN                                                  
--------------------------------------------------------------------------------------------------------------
 Seq Scan on booking_2025_q3  (cost=0.00..16.30 rows=630 width=100) (actual time=0.007..0.008 rows=2 loops=1)
 Planning Time: 0.037 ms
 Execution Time: 0.017 ms
(3 rows)
```