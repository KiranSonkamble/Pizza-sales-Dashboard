
use [Pizza DB];

--select * from pizza_sales;

-- total revenue

select round(sum(total_price),3) as total_revenue from pizza_sales;

-- Average order value

select sum(total_price) /count(distinct(order_id)) as avg_order_value from pizza_sales;

-- Total Pizza sold

select sum(quantity) as total_pizza_sold from pizza_sales;

-- total order placed
select count(distinct(order_id)) as total_order_placed from pizza_sales;

-- in decimal
select cast (count(distinct order_id) as decimal(10,2)) as total_order_placed from pizza_sales;


 -- avg pizzzas per order 

 select cast((sum(quantity) /count(distinct(order_id))) as numeric(10,1)) as average_pizza_per_order from pizza_sales;

