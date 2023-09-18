-- use pizza database

use [Pizza DB];

-- show the tables 
select table_name 
from INFORMATION_SCHEMA.tables;

-- show top 7 rows only
select top 7 
* from pizza_sales;

------ daily trend for total orders test

 select order_date as dte, sum(total_price), count(order_id), count(distinct (order_id))
 from pizza_sales
 group by order_date;



 select DATENAME(DW,order_date) day_of_week,cast(order_date as date)as dte, cast(sum(total_price)as decimal(10,2)) as total, count(order_id), count(distinct (order_id))
 from pizza_sales
 group by order_date;

 
 select DATENAME(DW,order_date) day_of_week,cast(sum(total_price)as decimal(10,2)) as total, count(distinct (order_id))
 from pizza_sales
 group by order_date



--! 1 !---- daily trend for total orders 
 select datename(dw, order_date) as day, count(order_date) total_count ,count(order_id) to_count ,count(distinct order_id) _count, sum(total_price) total_rev from pizza_sales
 group by datename(dw,order_date);


 --- ! 2 ! ---- Monthly trend for total orders
 select DAteNAME(MONTH,order_date) as order_month, count(distinct order_id) total_orders, sum(total_price) rev from pizza_sales
 group by DATENAME(month,order_date);


 -- ! 3 ! ----- Percentage of sales by pizza category
 select 
 pizza_category as pizza_cat,
 cast(sum(total_price) as decimal(10,2)) as total_sale, 
 cast((sum(total_price)/(select sum(total_price) from pizza_sales)* 100) as decimal(10,2)) as percentage_sale
 from pizza_sales
 group by pizza_category;


 -- practice-- Filter it for only month July
 select 
 pizza_category as pizza_cat,
 cast(sum(total_price) as decimal(10,2)) as total_sale, 
 cast((sum(total_price)/(select 
								sum(total_price) 
								from pizza_sales 
								where month(order_date)=7
						)* 100) as decimal(10,2)) as percentage_sale
 
 -- filter subselect query for month July alone
 from pizza_sales

 where MONTH(order_date)= 7

 group by pizza_category;

 
 -- practice-- Filter it for 2nd quarter 
 select 
 pizza_category as pizza_cat,
 cast(sum(total_price) as decimal(10,2)) as total_sale, 
 cast((sum(total_price)/(select sum(total_price) from pizza_sales where DATEPART(Q,order_date)=2)* 100) as decimal(10,2)) as percentage_sale
 from pizza_sales

 where DATEPART(Q,order_date)=2

 group by pizza_category;
 


--! 4 !--------------------- percentage of sales by pizza size

select pizza_size, 
count(pizza_size) size_count, 
cast(sum(total_price)as decimal(10,2)) total_sale,
cast ((sum(total_price)/(select sum(total_price) from pizza_sales)*100)as decimal(10,2)) as "%_pizza size" 
from pizza_sales
group by pizza_size;

-- ! 5 !------------ total pizza sold by pizza category

select pizza_category,cast(sum(total_price)as decimal(10,2) )total_pizza_sold_cat
from pizza_sales
group by pizza_category;

--! 6 !----------- top 5 best sellers by total revenue, quantity, orders

select * from pizza_sales;

select top 5
pizza_name, 
cast(sum(total_price) as decimal(10,2)) as top_5_rev_pizza
from pizza_sales
group by pizza_name
order by top_5_rev_pizza desc;

select top 5
pizza_name, 
sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc;


select top 5
pizza_name,
count(distinct order_id) as unique_orders
from pizza_sales
group by pizza_name


--! 7 !------------ bottom 5 pizzas sellers by total revenue, quantity, orders

select top 5
pizza_name,
cast(sum(total_price) as decimal(10,2))total_rev
from pizza_sales
group by pizza_name
order by total_rev ;

select top 5
pizza_name,
sum(quantity) total_qunt
from pizza_sales
group by pizza_name
order by total_qunt ;

select top 5
pizza_name,
count( distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders ;
