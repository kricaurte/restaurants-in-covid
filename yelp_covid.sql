use yelp_covid;


create view closed_restaurant as
select * 
from business_data
where is_closed = 1;


-- Average review rating for restaurants that closed was lower than the ones open

select avg(star_rating)
from restaurant
where num_reviews >= 100;

select avg(star_rating)
from closed_restaurant
where num_reviews >= 100;

-- determine type of cuisine in closed
select cuisine, count(cuisine)
from closed_restaurant
group by cuisine;

-- 27 total "american" cuisine restaurants closed 
select count(*)
from closed_restaurant
where cuisine like '%, american%' or cuisine like 'american%';

-- How many closed restaurants are in the same zip codes as colleges/universities 

select * from closed_restaurant;
select * from zip_codes;

select zip_code 
from closed_restaurant;
-- where zip_code in (
-- 	select Zipcode
--     from colleges_and_universities);

select address
from colleges_and_universities
where address like ', street,  %0%';

-- average rating per cuisine 

-- what percentage of each cuisine was closed post-covid 
-- which cuisine type had the highest percentage of closed restaurants
-- average rent price for zipcodes with highest closed restaurants rate 
-- which zip code had the highest number of restaurants closed (number of closed restauraunts per zip code)
-- 


