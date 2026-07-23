create database flipkart;
show databases;
use flipkart;
select * from customer;
describe customer;
#top 10 most expensive products
select product_name,brand,retail_price
From customer
order by retail_price desc
limit 10;
#Which brands have the most products listed
select brand,count(*) as total_products
From customer
where brand !='no brand available'
group by brand
order by total_products desc
limit 10;
#Which products offer the highest discounts
select product_name,brand,retail_price,discounted_price,
(retail_price-discounted_price) as discount_amount
from customer
order by discount_amount desc
limit 10;
#What are the highest-rated products
SELECT product_name,
       brand,
       product_rating
FROM customer
WHERE product_rating <> 'No rating available' and brand <> 'no brand available'
ORDER BY product_rating DESC
LIMIT 10;
set sql_safe_updates=0;
update customer set product_rating=0 
where product_rating='no rating available';
alter table customer 
modify column product_rating Decimal(3,1);