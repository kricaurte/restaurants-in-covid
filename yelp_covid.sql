create schema yelp_covid;
use yelp_covid;


create view closed_restaurant as
select * 
from restaurant
where is_closed = 1;

select count(*) from closed_restaurant; -- 79 total closed restaurants
select count(*) from restaurant; -- 4353

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant; -- 1.81% of restaurants are closed (not as bad as I thought)

-- Average review rating for restaurants that closed was lower than the ones open

select avg(star_rating)
from restaurant
where num_reviews >= 100; -- 3.723

select avg(star_rating)
from closed_restaurant
where num_reviews >= 100; -- 3.595

-- determine type of cuisine in closed
select cuisine, count(cuisine)
from closed_restaurant
group by cuisine;

-- 27 total "american" cuisine restaurants closed 
select count(*)
from closed_restaurant
where cuisine like '%, american%' or cuisine like 'american%'; -- 27

select count(*)
from restaurant
where cuisine like '%, american%' or cuisine like 'american%'; -- 544

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant
where cuisine like '%, american%' or cuisine like 'american%'; -- 4.96

-- italian cuisine
select count(*)
from closed_restaurant
where cuisine like '%, italian%' or cuisine like 'italian%'; -- 8

select count(*)
from restaurant
where cuisine like '%, italian%' or cuisine like 'italian%'; -- 263

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant
where cuisine like '%, italian%' or cuisine like 'italian%'; -- 3.04

-- breakfast
select count(*)
from closed_restaurant
where cuisine like '%, breakfast%' or cuisine like 'breakfast%'; -- 14

select count(*)
from restaurant
where cuisine like '%, breakfast%' or cuisine like 'breakfast%'; -- 301

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant
where cuisine like '%, breakfast%' or cuisine like 'breakfast%'; -- 4.65

-- bars (any bars, not just sports bars or dive bars)
select count(*)
from closed_restaurant
where cuisine like '%, bars%' or cuisine like '% bars%' or cuisine like 'bars%'; -- 29

select count(*)
from restaurant
where cuisine like '%, bars%' or cuisine like '% bars%' or cuisine like 'bars%'; -- 750

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant
where cuisine like '%, bars%' or cuisine like '% bars%' or cuisine like 'bars%'; -- 3.87

-- mexican cuisine
select count(*)
from closed_restaurant
where cuisine like '%, mexican%' or cuisine like 'mexican%'; -- 1

select count(*)
from restaurant
where cuisine like '%, mexican%' or cuisine like 'mexican%'; -- 171

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant
where cuisine like '%, mexican%' or cuisine like 'mexican%'; -- .58

-- food trucks
select count(*)
from closed_restaurant
where cuisine like '%food trucks%'; -- 0

select count(*)
from restaurant
where cuisine like '%food trucks%'; -- 62

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant
where cuisine like '%food trucks%'; -- 0

-- coffee and tea
select count(*)
from closed_restaurant
where cuisine like '%coffee & tea%'; -- 8

select count(*)
from restaurant
where cuisine like '%coffee & tea%'; -- 632

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant
where cuisine like '%coffee & tea%'; -- 1.27

-- japanese
select count(*)
from closed_restaurant
where cuisine like '%japanese%'; -- 4

select count(*)
from restaurant
where cuisine like '%japanese%'; -- 108

select round((sum(is_closed) / count(*)) * 100, 2)
from restaurant
where cuisine like '%japanese%'; -- 3.70

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


