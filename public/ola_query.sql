Create Database Ola_booking; 
Use Ola;

#1. Retrieve all successful bookings:
Create View Successfully_Bookings As 
SELECT * FROM bookings
WHERE Booking_Status = 'Success';
                 #or
SELECT * FROM successfully_bookings;    
             
#2. Find the average ride distance for each vehicle type:
Create View rides_distance_for_each_vehicle As 
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;             
             #or
SELECT * FROM rides_distance_for_each_vehicle;   

#3. Get the total number of cancelled rides by customers:
Create View Cancelled_rides_by_customer As 
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'cancelled by Customer';
			 #or     
SELECT * FROM Cancelled_rides_by_customer;    

#4. List the top 3 customers who booked the highest number of rides:
Create View Top_3_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 3;    
             #or
SELECT * FROM Top_3_Customers;   


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_Personal_or_Cr_Issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
             #or
SELECT * FROM Rides_cancelled_by_Drivers_Personal_or_Cr_Issues;    


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Mini_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';   
             #or
SELECT * FROM  Max_Mini_Driver_Rating;         


#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payments As 
SELECT * FROM bookings 
WHERE Payment_Method = 'UPI';
             #or
SELECT * FROM UPI_Payments;             


#8. Find the average customer rating per vehicle type:
Create View AVG_Custs_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;
             #or
SELECT * FROM  AVG_Custs_Rating;            


#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_rides_value As
SELECT SUM(Booking_Value) as total_successful_ride_value FROM bookings
WHERE Booking_Status = 'Success';
             #or
SELECT * FROM total_successful_rides_value;


#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As 
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings
WHERE Incomplete_Rides = 'Yes';   
             #or
SELECT * FROM Incomplete_Rides_Reason;              
             

     