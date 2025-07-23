create database task1;

-- List all sales with product names and sale amounts.
select p.product , sum(s.amount) Total_Sales
from sales s
join products p
on s.productid = p.productid
group by p.product
order by Total_Sales desc

-- Show all unique customers who made purchases in January 2019.
select count(distinct(c.id)) #customer 
from customer c
join sales s
on c.id = s.id
where s.date >= '2019-01-01' AND s.date < '2019-02-01';

-- Get the number of products sold per store.
select count(s.productid) #products, s.storeid store
from sales s
group by s.storeid

-- Retrieve a list of products with prices greater than $70.
select product , price
from products
where price > 70

-- Count how many customers belong to each age group.
select count(distinct(id)) #customers , age age_group
from customer
group by age
order by #customers desc

-- Calculate the total revenue per product category.
select category , sum(amount) total_revenue
from products p
join sales s
on p.productid = s.productid
group by category

-- Find the top 5 products by number of units sold.
select top 5 product , sum(unit) number_of_units_sold
from products p
join sales s
on p.productid = s.productid
group by product
order by number_of_units_sold desc

-- Show the average sales amount per store.
select store , avg(amount)  average_sales_amount
from stores st
join sales sa
on st.storeid = sa.storeid
group by store
order by average_sales_amount desc

-- Identify which stores have sold more than 500 units in total.
select store , sum(unit) #units
from stores st
join sales sa
on st.storeid = sa.storeid
group by store
having sum(unit) >500
order by #units desc

-- List customers who made more than one purchase.
select id , count((id)) #purchase
from sales 
group by id
having count((id)) >1

-- Find stores that failed to meet their net sales goals.
select s.storeid , sum(s.amount) as total_sales ,g.[Store - Goals(Net Sales Goal)] as Net_Sales_Goal
from sales s
join store_goals g
on s.storeid = g.[Store - Goals(Store ID)]
group by s.storeid , g.[Store - Goals(Net Sales Goal)]
having sum(s.amount) < (g.[Store - Goals(Net Sales Goal)])
order by s.storeid

-- Identify the age groups that generated the highest total revenue.
select age age_group, sum(amount) Total_revenue
from customer c , sales s
where c.id = s.id
group by age
order by Total_revenue desc

-- Show product segments with average prices above the overall average.
select segment , avg(try_cast (price as float)) as average_price
from products 
group by segment
having avg(try_cast (price as float))  > (select avg(try_cast (price as float))  from products)

-- Find customers who bought products from at least 3 different categories.
select s.id , count(distinct(p.categoryid)) as #categories
from sales s 
join products p
on s.productid = p.productid
group by s.id
having count(distinct(p.categoryid)) >= 3


-- Calculate the sales achievement % per store region.
select g.[Store - Goals(Store Region)] as Region ,round( (sum(s.amount) * 100.0 / sum(g.[Store - Goals(Net Sales Goal)])),2) as sales_achievement_percent
from sales s
join store_goals g
on s.storeid = g.[Store - Goals(Store ID)]
group by g.[Store - Goals(Store Region)]
order by sales_achievement_percent desc

-- Identify stores with declining weekly sales trends.
with WeeklySales as (
select storeid , DATEPART(week ,[date]) as sales_week , year([date]) as sales_year , sum(amount) weekly_sales
from sales 
group by storeid , year([date]) , DATEPART(week ,[date])
),
WithTrends AS (
    SELECT 
        storeid,
        sales_year,
        sales_week,
        weekly_sales,
        LAG(weekly_sales) OVER (
            PARTITION BY storeid, sales_year
            ORDER BY sales_week
        ) AS previous_week_sales
    FROM 
        WeeklySales
)

SELECT 
    storeid
FROM 
    WithTrends
WHERE 
    previous_week_sales IS NOT NULL
    AND weekly_sales < previous_week_sales
GROUP BY 
    storeid
HAVING 
    COUNT(*) >= 2

-- Determine which product segment contributes the most to total sales revenue.
select segment , sum(amount) Total_sales
from products p
join sales s 
on p.productid = s.productid
group by segment
order by sum(amount) desc

-- List the top 3 performing stores in each region based on revenue.
select  top 3  g.[Store - Goals(Store Region)] Region , s.storeid ,sum(s.amount) as Revenue
from sales s 
join store_goals g
on s.StoreID = g.[Store - Goals(Store ID)]
group by g.[Store - Goals(Store Region)] , s.StoreID
order by Revenue desc

-- Find the number of unique customers served per store.
select count(distinct(id)) as number_of_unique_customers , storeid
from sales
group by storeid
order by storeid

-- Retrieve sales data where the product belongs to a category starting with 'Office'.
select * from sales s
join products p
on s.productid = p.ProductID
where p.category like 'office%'
