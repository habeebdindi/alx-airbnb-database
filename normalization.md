## Overview
The schema design is already in 3NF. However one potential issue could be that the price_per_night of the Booking table depends on the `start_date` and `end_date` but dynamically calculating it like this `price_per_night * number_of_nights`.

## Conclusion

### For all tables:
- 1NF: All attributes are atomic. review_id is the primary key.
- 2NF: Single-column primary key, no partial dependencies.
- 3NF: Non-key attributes depend on their respective primary keys. No transitive dependencies.