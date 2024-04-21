create database DOMINOS_Delhi;
use DOMINOS_Delhi;
select * from pizza_sales_excel_file;

/* 
Q1. To find total revenue.
Q2. To find average order value.
Q3. Find total pizzas sold.
Q4. Find all total orders.
Q5. Find average pizza per order.
Q6. Find daily trends for total orders.
Q7. Find monthly trends for total orders.
Q8. Find % of sales by pizza category.
Q9. Find % of sales by pizza sales.
Q10.Find total pizza sales by pizza category.
Q11.Find top 5 pizza best sellers by revenue, total quantity, total orders.
Q12.Find below 5 pizza best sellers by revenue, total quantity, total orders.
*/

-- Q1. To find total revenue.
select  sum(total_price) as total_revenue
from pizza_sales_excel_file;

-- Q2. To find average order value.

select sum(total_price)  / count(distinct order_id) as average_order_value
from pizza_sales_excel_file;

-- Q3. Find total pizzas sold.

select sum(quantity) as total_pizzas_sold
from pizza_sales_excel_file;

-- Q4. Find all total orders.

select count(distinct order_id) as total_orders
from pizza_sales_excel_file;

-- Q5. Find average pizza per order.

select sum(quantity)  / count(distinct order_id) as average_pizza_per_order
from pizza_sales_excel_file;

-- Q6. Find daily trends for total orders.

select dayname(order_date) as order_day , count(distinct order_id) as order_sell
from pizza_sales_excel_file
group by order_day;
commit;

-- Q7. Find monthly trends for total orders.

select monthname(order_date) as order_month , count(distinct order_id) as order_sell
from pizza_sales_excel_file
group by order_month;

-- Q8. Find % of sales by pizza category.

select pizza_category , round(sum(total_price),2) as total_revenue, round(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales_excel_file),2) as PCT_of_sales_by_pizza_category
from pizza_sales_excel_file
group by pizza_category
order by PCT_of_sales_by_pizza_category desc;

-- Q9. Find % of sales by pizza size.

select pizza_size , round(sum(total_price),2) as total_revenue, round(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales_excel_file),2) as PCT_of_sales_by_pizza_size
from pizza_sales_excel_file
group by pizza_size 
order by PCT_of_sales_by_pizza_size desc;

-- Q10.Find total pizza sales by pizza category.

select pizza_category , round(sum(total_price),2) as categorie_wise_total_sales
from pizza_sales_excel_file
group by pizza_category;

-- Q11.Find top 5 pizza best sellers by revenue, total quantity, total orders.

select pizza_name , sum(total_price) as total_revenue, sum(quantity) as total_quantity, sum(order_id) as total_orders
from pizza_sales_excel_file
group by pizza_name
order by total_revenue desc, total_quantity desc, total_orders desc
limit 5;

-- Q12.Find below 5 pizza best sellers by revenue, total quantity, total orders.

select pizza_name , sum(total_price) as total_revenue, sum(quantity) as total_quantity, sum(order_id) as total_orders
from pizza_sales_excel_file
group by pizza_name
order by total_revenue, total_quantity , total_orders 
limit 5;






