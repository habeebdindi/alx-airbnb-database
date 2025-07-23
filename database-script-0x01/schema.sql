-- Create ENUM types first
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');

-- Create tables
CREATE TABLE "User" (
   user_id UUID PRIMARY KEY,
   first_name VARCHAR NOT NULL,
   email VARCHAR UNIQUE NOT NULL,
   password_hash VARCHAR,
   phone_number VARCHAR,
   role user_role NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "Property" (
   property_id UUID PRIMARY KEY,
   host_id UUID,
   name VARCHAR NOT NULL,
   description TEXT NOT NULL,
   location VARCHAR NOT NULL,
   price_per_night DECIMAL NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (host_id) REFERENCES "User"(user_id)
);

CREATE TABLE "Booking" (
   booking_id UUID PRIMARY KEY,
   property_id UUID,
   user_id UUID,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   total_price DECIMAL NOT NULL,
   status booking_status NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (property_id) REFERENCES "Property"(property_id),
   FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

CREATE TABLE "Payment" (
   payment_id UUID PRIMARY KEY,
   booking_id UUID,
   amount DECIMAL NOT NULL,
   payment_date DATE NOT NULL,
   payment_method payment_method NOT NULL,
   FOREIGN KEY (booking_id) REFERENCES "Booking"(booking_id)
);

CREATE TABLE "Review" (
   review_id UUID PRIMARY KEY,
   property_id UUID,
   user_id UUID,
   rating INTEGER NOT NULL CHECK (rating >=1 AND rating <=5),
   comment TEXT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (property_id) REFERENCES "Property"(property_id),
   FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

CREATE TABLE "Message" (
   message_id UUID PRIMARY KEY,
   sender_id UUID,
   recipient_id UUID,
   message_body TEXT NOT NULL,
   sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (sender_id) REFERENCES "User"(user_id),
   FOREIGN KEY (recipient_id) REFERENCES "User"(user_id)
);

-- Create indexes separately
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);
CREATE INDEX idx_payment_booking_id ON "Payment"(booking_id);
CREATE INDEX idx_review_property_id ON "Review"(property_id);
