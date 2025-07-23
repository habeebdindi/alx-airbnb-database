CREATE INDEX idx_user_email ON "User"(email);                 CREATE INDEX idx_booking_property_id ON "Booking"(property_id);     
CREATE INDEX idx_payment_booking_id ON "Payment"(booking_id); CREATE INDEX idx_review_property_id ON "Review"(property_id); CREATE INDEX idx_message_sender_id ON "Message"(sender_id)      
                                                                    
