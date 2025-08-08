use intern_task4; 
SELECT * from df;
SELECT count(*) from df; # 22542

-- Max Sales
SELECT max(Sales) from df; #250

-- No. of Males and Females
SELECT sum(case when Gender = "Female" then 1 else 0 end) as Female_count,
		sum(case when Gender = "Male" then 1 else 0 end) as Male_count from df; # Male are more
        
-- Top 10 most expensive Orders
Select Order_Date, Customer_id, Customer_Login_Type, Product_Category, Product , Sales, Profit, Payment_method
From df
order by Sales DESC limit 10;
	
-- Top 10 Profit
SELECT Order_Date,Customer_id, Customer_Login_Type, Product_Category, Product , Sales, Profit, Payment_method
FROM df
ORDER BY Profit DESC limit 10;

-- Total Sales per Product Category
SELECT Product_Category, SUM(Sales) AS Total_Sales
FROM df
GROUP BY Product_Category
ORDER BY Total_Sales DESC;

-- Average discount by Payment Method
SELECT Payment_method, AVG(Discount) * 100 AS Avg_Discount
FROM df
GROUP BY Payment_method;

-- Products with sales above average sales
SELECT distinct Product, Sales
FROM df
WHERE Sales > (
    SELECT AVG(Sales) FROM df
);

-- Customers with total sales > 200
SELECT distinct Customer_Id, SUM(Sales) AS Total_Sales
FROM df
GROUP BY Customer_Id
HAVING SUM(Sales) > 200;

-- Top 5 profitable products
SELECT Product, SUM(Profit) AS Total_Profit
FROM df
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 5;

-- Sales by Order Priority (replace NULL with 'Low')
SELECT 
    COALESCE(Order_Priority, 'Low') AS Order_Priority,
    COUNT(*) AS Orders,
    SUM(Sales) AS Total_Sales
FROM df
GROUP BY COALESCE(Order_Priority, 'Low');

-- Most popular product per category
SELECT Product_Category, Product, COUNT(*) AS Orders
FROM df
GROUP BY Product_Category, Product
ORDER BY Product_Category, Orders DESC limit 10;

-- Customers who contribute to the top 10% of total sales
WITH customer_sales AS (
    SELECT Customer_Id,
           SUM(Sales) AS Total_Sales,
           SUM(Profit) AS Total_Profit,
           COUNT(*) AS Order_Count
    FROM df
    GROUP BY Customer_Id
),
ranked AS (
    SELECT *,
           PERCENT_RANK() OVER (ORDER BY Total_Sales) AS pr
    FROM customer_sales
)
SELECT Customer_Id, Total_Sales, Total_Profit, Order_Count
FROM ranked
WHERE pr >= 0.90
ORDER BY Total_Sales DESC limit 10;

-- Monthly sales trend to plan stock and marketing
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
       SUM(Sales) AS Total_Sales,
       SUM(Quantity) AS Total_Quantity
FROM df
GROUP BY Month
ORDER BY Month limit 10;

-- Products ranked by profit margin
SELECT Product,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percent
FROM df
GROUP BY Product
ORDER BY Profit_Margin_Percent DESC
LIMIT 10;



