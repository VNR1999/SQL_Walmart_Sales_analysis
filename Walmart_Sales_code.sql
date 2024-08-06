--- Create Data base

Create database Walmart_sales

--- create walmart sales table(table name taken 'sales')

     Create table Sales (
     invoice_id varchar(30) Not Null primary key,
     branch varchar(5) Not Null,
     city varchar(30) Not Null,
     gender varchar(10) Not Null,
     product_line varchar(100) Not Null,
     unit_price float Not Null,
     quantity int Not Null,
     tax float Not Null,
     total float Not Null,
     sales_date Date Not Null,
     sales_time Time Not Null,
     payment varchar(20) Not Null,
     cogs float Not Null,
     gross_margin_pct float,
     gross_income float,
     rating float
     ); 

use walmartsales;

select * from sales;

select * from sales where invoice_id is null;

## add the time_of_day column ##
alter table sales
add column time_of_day varchar(20);

## update_time_of_day in the sales table ##
update sales set time_of_day =(
case 
when sales_time between "00:00:00" and "12:00:00" then "Morning"
when sales_time between "12:01:00" and "16:00:00" then "Afternoon"
else "evening"
end 
);

## add day_name column in sales table from sales_date column ##
alter table sales 
add column Day_name varchar(10);
update sales set Day_name = dayname(sales_date);

## add Month_name column in sales table from sales_date column ##
alter table sales 
add column Month_name varchar(10);

update sales set Month_name = monthname(sales_date);

## 1Q) how many unique cities are there in sales table ? ##
select count(distinct city)as unique_city_count from sales;

## 2Q) in which city each branch ##
select distinct city,branch from sales;

## How many unique product lines are there in sales table ?
select count(distinct product_line) as unique_productline from sales;

## count each unique product line ##
select distinct product_line,count(*) as count_product_line from sales 
group by product_line;

## what is the most commn payment method ? ##
select payment,count(*) as most_payment_method from sales
group by payment
order by most_payment_method desc;

## what is the most selling product line in sales table ? ##
select  distinct product_line, sum(quantity) as qty from sales
group by product_line
order by qty desc;

## what is the total revenue by month ? ##
select month_name as month ,round(sum(total))as total_revenue from sales 
group by month_name 
order by total_revenue;

## how many months are there in sales table and month names ? ##
select distinct month_name from sales;
select count(distinct month_name) as unique_Month from sales;

## which month had largest COGS ? ##
select month_name as month,round(sum(cogs)) as cogs from sales
group by month
order by cogs desc;
## OR ##
select month_name as month, round(sum(cogs)) as cogs  from sales 
group by month_name 
order by cogs desc limit 1;

## which product line have largest revenue ? ##
select product_line,round(sum(total)) as total_revenue from sales
group by product_line 
order by total_revenue desc;

## which city with branch have largest revenue generated ? ##
select city,branch, round(sum(total)) as revenue from sales 
group by city,branch
order by revenue desc;

## which product line had highest avg tax ? ##
select product_line, round(avg(tax)) as tax from sales 
group by product_line 
order by tax desc limit 1;

## if avg product line quantity >6 then "good" else "bad" product line review based on avg quantity? ##
select product_line,
case 
  when avg(quantity)>6 then "Good"
  else "bad"
  end as remark
  from sales 
  group by product_line;

## which branch sold more products than average product sold ? ##
select branch, sum(quantity) as qty from sales 
group by branch 
having sum(quantity) > (select avg(quantity) from sales);

## what is the most common product line by gender ? ##
select product_line,gender,count(gender) as count_gender from sales 
group by product_line,gender
order by count_gender desc;

## what is the average rating of each  product line ? ##
select product_line, round(avg(rating),2) as avg_rating  from sales 
group by product_line 
order by avg_rating desc;

## analysis based on customers##
## how many unique customer type have in sales table ? ##
select count(distinct customer_type ) as unique_customer from sales;
select distinct customer_type, count(distinct customer_type) as unique_customer from sales
group by customer_type;

## which customer type have max of purchases ? ##
select customer_type, sum(quantity) as total_qty from sales 
group by customer_type
order by total_qty desc;

## what is the most common customer type? ##
select customer_type, count(*) as count from sales 
group by customer_type 
order by count desc;

## which customer type busy the most ? ##
select customer_type, count(*) from sales
group by customer_type;

## which day &  which time have highest revenue generated ? ##
select day_name,time_of_day,round(sum(total))as revenue from sales 
group by day_name,time_of_day
order by revenue desc;
## which day & which time which type of customers are generated more revenue ? ##
select customer_type,day_name,time_of_day,round(sum(total)) as revenue from sales 
group by customer_type,day_name,time_of_day
order by revenue desc;
## which day & which time which type of customers are generated less revenue ? ##
select customer_type,day_name,time_of_day,round(sum(total)) as revenue from sales 
group by customer_type,day_name,time_of_day
order by revenue asc;
 
##  what is the gender most of the customers ? ##
select gender, count(*) as gender_cnt from sales
group by gender
order by gender_cnt desc; 
---  Branch wise (A,B,c) and gender vs customer type check revenue ##
select customer_type,gender,branch,round(sum(total))as revenue from sales
where branch in ("a","b","c")
group by customer_type,gender,branch
order by branch asc;

## which type of gender which day and which time more generated revenue ##
select gender,day_name,time_of_day, round(sum(total)) as revenue from sales
group by gender,day_name,time_of_day 
order by revenue desc;
select gender,day_name,time_of_day,round(sum(total)) as revenue from sales
where day_name = "Saturday" 
group by gender,time_of_day
order by revenue desc;

## which city has pay largest tax percent? ##
select city,round(avg(tax),2) as avg_tax from sales
group by city
order by avg_tax desc;
