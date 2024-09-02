select * from pizza_sales ;

-- Queries For KPI Requirement

-- KPI 1

select sum(total_price) as Total_Revenue from pizza_sales 

-- KPI 2

select sum(total_price)/ count(distinct order_id) as Avg_Order_Value  from pizza_sales

-- KPI 3

select sum(quantity) as Total_Pizza_Sold from pizza_sales

-- KPI 4

select count(distinct order_id) as Total_Orders from pizza_sales

-- KPI 5

select cast (cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_Order from pizza_sales
 
-- Queries For Charts Requirement

-- Q1

select datename(dw, order_date) as Order_day, count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(dw, order_date)

-- Q2
 
select datename(month,order_date) as Month_Name , count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(month,order_date) 
order by Total_Orders desc

-- Q3

select pizza_category, sum(total_price) as Total_Sales , sum(total_price)*100/ (select sum(total_price) from pizza_sales ) as PCT
from pizza_sales
group by pizza_category

-- Q4

select pizza_size, sum(total_price) as Total_Sales , cast(sum(total_price)*100/ (select sum(total_price) from pizza_sales ) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size 
order by PCT desc 

-- Q5

select pizza_name, sum(total_price) as Total_Price
from pizza_sales
group by pizza_name
order by Total_Price  desc 

-- Q6

select Top 5 pizza_name, sum(total_revenue) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue desc

-- Q7

select Top 5 pizza_name, sum(total_revenue) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue asc

-- Q8

select Top 5 pizza_name, count(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold  desc 

-- Q9

select Top 5 pizza_name, count(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold  asc

-- Q10

select Top 5 pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders desc

-- Q11

select Top 5 pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders asc










