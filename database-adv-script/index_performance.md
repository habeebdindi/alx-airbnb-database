## Before INDEXING
```
alx_db=# EXPLAIN SELECT p.property_id, p.name, COUNT(b.booking_id) AS "booking_count", ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number FROM "Property" p LEFT JOIN "Booking" b ON p.property_id = b.property_id GROUP BY p.property_id, p.name;
                                          QUERY PLAN                                          
----------------------------------------------------------------------------------------------
 WindowAgg  (cost=61.41..68.41 rows=400 width=64)
   ->  Sort  (cost=61.41..62.41 rows=400 width=56)
         Sort Key: (count(b.booking_id)) DESC
         ->  HashAggregate  (cost=40.13..44.13 rows=400 width=56)
               Group Key: p.property_id
               ->  Hash Right Join  (cost=19.00..36.98 rows=630 width=64)
                     Hash Cond: (b.property_id = p.property_id)
                     ->  Seq Scan on "Booking" b  (cost=0.00..16.30 rows=630 width=32)
                     ->  Hash  (cost=14.00..14.00 rows=400 width=48)
                           ->  Seq Scan on "Property" p  (cost=0.00..14.00 rows=400 width=48)
(10 rows)
```

## After INDEXING
```
alx_db=# CREATE INDEX idx_property_id ON "Property"(property_id);
CREATE INDEX
alx_db=# EXPLAIN ANALYZE SELECT p.property_id, p.name, COUNT(b.booking_id) AS "booking_count", ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number FROM "Property" p LEFT JOIN "Booking" b ON p.property_id = b.property_id GROUP BY p.property_id, p.name;
                                                             QUERY PLAN                                                              
-------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=22.21..22.25 rows=2 width=64) (actual time=0.050..0.053 rows=2 loops=1)
   ->  Sort  (cost=22.21..22.22 rows=2 width=56) (actual time=0.044..0.045 rows=2 loops=1)
         Sort Key: (count(b.booking_id)) DESC
         Sort Method: quicksort  Memory: 25kB
         ->  HashAggregate  (cost=22.18..22.20 rows=2 width=56) (actual time=0.038..0.040 rows=2 loops=1)
               Group Key: p.property_id
               Batches: 1  Memory Usage: 24kB
               ->  Hash Right Join  (cost=1.04..19.03 rows=630 width=64) (actual time=0.029..0.034 rows=2 loops=1)
                     Hash Cond: (b.property_id = p.property_id)
                     ->  Seq Scan on "Booking" b  (cost=0.00..16.30 rows=630 width=32) (actual time=0.004..0.004 rows=2 loops=1)
                     ->  Hash  (cost=1.02..1.02 rows=2 width=48) (actual time=0.017..0.018 rows=2 loops=1)
                           Buckets: 1024  Batches: 1  Memory Usage: 9kB
                           ->  Seq Scan on "Property" p  (cost=0.00..1.02 rows=2 width=48) (actual time=0.013..0.014 rows=2 loops=1)
 Planning Time: 6.595 ms
 Execution Time: 0.161 ms
(15 rows)
```