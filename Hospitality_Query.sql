create database projects;

-- Total revenue --  
select sum(revenue_generated) as Total_revenue
from fact_bookings;


-- Total revenue realized -- 
select sum(revenue_realized) as Total_Revenue_Realized
from fact_bookings;

-- cancellation rate -- 
select count(booking_id) / (select count(booking_id)
from fact_bookings) * 100 as Cancelaaion_rate
from fact_bookings where booking_status = "Cancelled";

-- Revenue by booking status 
select booking_status,
sum(revenue_realized) as revenue
from fact_bookings
group by booking_status;

-- Total sucesfull bookings --
select count(booking_id) as Total_bookings
from fact_bookings where booking_status = "Checked Out";


-- Count of booking by Status ( checked out.cancelled, No show)
select booking_status,
count(booking_id) as total_bookings
from fact_bookings 
group by booking_status;

 --  booking wise percentage --
 SELECT booking_status, 
       COUNT(booking_id) * 100.0 / (SELECT COUNT(booking_id) FROM fact_bookings) AS percentage_bookings
FROM fact_bookings
GROUP BY booking_status;


 --  occupancy rate - 

 select sum(successful_bookings)/sum(capacity) * 100 as occupancy_rate
 from fact_aggregated_bookings;

select booking_status,
count(booking_id) as totalbookingg from fact_bookings 
group by booking_status;

 

 

 -- Revenue by state and hotel --
 select dh.city,
 dh.property_name,
 sum(fb.revenue_realized) as revenue
 from fact_bookings fb 
 join dim_hotels dh on fb.property_id = dh.property_id
 group by dh.city,dh.property_name;
 
 
 select d.week_no,
 sum(fa.successfulbookings)/
 sum(fa.capacity)* 100 as occuapancy_rate
 from fact_aggregated_bookings fa
 join dim_date d on fa.check_in_date = d.day_type
 group by d.week_no;
 
