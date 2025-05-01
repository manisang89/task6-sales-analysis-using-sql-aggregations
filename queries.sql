-- 1) What is the total revenue generated across all sales?
select sum(total_revenue) as Total_revenue_generated from sales_data


-- 2)What is the average number of units sold per transaction?
select sum(units_sold)/count(transaction_id) 
as avg_units_sold_per_transaction 
from sales_data;

-- 3)What is the maximum and minimum unit price in the dataset?
select min(unit_price)as min_price,
max(unit_price)as max_price
from sales_data;


-- 4)How many transactions occurred in each region?
select region,count(transaction_id) as transaction_count
from sales_data
group by(region);

-- 5)What is the total revenue by product category?
select product_category,sum(total_revenue) as revenue_by_category
from sales_data
group by(product_category)
order by revenue_by_category desc;

-- 6)Which payment method generated the most total revenue?
select payment_method,max(total_revenue) as maximum_revenue
from sales_data
group by(payment_method) 
order by maximum_revenue desc;

-- 7)List the top 10 products by total revenue
select product_name,sum(total_revenue)as top_revenue
from sales_data
group by(product_name)
order by (top_revenue) desc
limit 10;

-- 8)What is the most popular product category in each region (by number of transactions)?
select region,product_category,count(transaction_id) as highest_transaction_count 
from sales_data
group by(region ,product_category)
order by(region);

-- 9)Display the total revenue and number of transactions (order volume) for each month.
select to_char(date_trunc('month',date),'Month yyyy')as month,
sum(total_revenue) as revenue_per_month,count(transaction_id) as order_volume
from sales_data
group by(date_trunc('month',date))
order by(date_trunc('month',date));

-- 10)For each product category, what is the minimum and maximum unit price?
select product_category,min(unit_price)as minimum_value,
max(unit_price)as maximum_value
from sales_data
group by(product_category)
order by(product_category) desc;



