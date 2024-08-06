   # SQL_Walmart_Sales_Analysis_Project

                                    

   ## About
   

   This project aims to explore the Walmart sales data to understand top performing branches and products, sales trend of different products, customer behavior. 
   The aim to study how sales strategies can be improved and optimized. The dataset was obtained from the [Kaggle Walmart sales forecasting]
   (https://www.kaggle.com/c/Walmart-recruiting-store-sales-forecting).
 


   ## Purpose of project

   The major aim of the project is to gain insight into the sales data of Walmart to understand the different factors the affect sales of the different branches.


   ## About data
   
   The dataset was obtained from the (https://www.kaggle.com/c/walmart-recruiting-store-sales-forecting)This dataset contains sales transactions from a three different 
   branches of Walmart respectively located in Mandalay, Yangon, Naypyitaw. the data contains 17 columns and 1000 rows:

  
| Column_Name              | Description                            |Data Type     |                   
|------------------------- |----------------------------------------|--------------
|invoice_id                |Invoice of the made                     |varchar(30)   | 
|branch                    |Branch at which sales were made         |varchar(5)    |      
|city                      |The location of the branch              |varchar(30)   |
|customer_type             |The type of the customer                |varchar(30)   |     
|gender                    |Gender of the customer making purchase  |varchar(10)   |
|product_line             |product line of the product sold        |varchar(100)  |     
|Unit_price               |The price of each product               |float         |
|quantity                 |The amount of the product sold          |int           |
|vat(tax)                 |The amount of tax on the purchase       |float         |
|total                    |The total cost of the purchase          |float         |    
|Sales_date               |The date on which the purchase was made |Date          |
|Sales_time               |The time at which the purchase was made |time          |
|Payment(payment_method)  |payment method                          |varchar(20)   |
|cogs                     |cost of goods sold                      |float         |
|gross_margin_pct         |gross margin percentage                 |float         |
|gross_income             |Gross income                            |float         |
|rating                   |Rating                                  |float         |


  ## Analysis List

    1.Product Analysis :   
    
      Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved

 
    2.Sales Analysis  :

      This analysis aims to answer the question of the sales trend of product. The result of this can help use measure the effectiveness of each sales strategy
       the business applies and
      
    3.customer Analysis :
    
     This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.


   ## Approach Used 

    1.**Data Wrangling:** This is the first step where inspection of data is done to make sure **Null** values and missing values are detected and data replacement
      methods are usedto replace, missing or **Null** values.

    > 1.Build a database
    > 2.Create table and insert the data.
    > 3.select columns with null values in them. There are no null values in our database as in creating the tables, we set **Not Null** for each field, hence 
      null values are filtered out.


    2.**Feature Engineering:** This will help use generate some new columns from existing ones.
   
    > 1.Add a new column named 'time_of_day' to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day 
     most sales are made.
    
    > 2.Add a new column named 'day_name' that contains the extracted days of the week on which the given transaction took place(Mon,Tue,wed,Fri,sat,sun).This will help answer the
       question  on which week of the day each branch is busiest.

    > 3.Add a new column named 'Month_name' that contains the extracted months of the year on which the given transaction took place(Jan,Feb,Mar).Help determine which month of the year
     has the most sales and profit.

   ## Create Data base

     Create database Walmart_sales

   ## Create walmart sales table (table name taken 'sales')
     
     Create table Sales (
     invoice_id varchar(30) Not Null primary key,
     branch varchar(5) Not Null,
     city varchar(30) Not Null,
     gender varchar(10) Not Null,
     product_line varchar(100)Not Null,
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
    
         
    

     
