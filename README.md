📊 E-Commerce Sales Analysis
📌 Project Overview

This project analyzes an E-Commerce dataset stored in MySQL. The goal is to extract business insights for decision-making using advanced SQL queries.
The analysis includes top-performing products, customer segmentation, sales trends, and profitability patterns.
🗂 Dataset Information

    Database Name: intern_task4

    Table Name: df

    Total Records: 22,542

    Key Columns:

        Order_Date – Date of purchase

        Customer_Id – Unique customer identifier

        Product_Category – Product category name

        Product – Product name

        Sales – Sales amount per order

        Profit – Profit amount per order

        Payment_Method – Payment method used

        Order_Priority – Priority of order delivery

        Quantity – Units purchased

        Discount – Discount applied

        Gender – Customer gender

🛠 SQL Analysis & Insights
1️⃣ Basic Insights

SELECT COUNT(*) FROM df; -- Total orders
SELECT MAX(Sales) FROM df; -- Highest sales value
SELECT SUM(CASE WHEN Gender = "Female" THEN 1 ELSE 0 END) AS Female_Count,
       SUM(CASE WHEN Gender = "Male" THEN 1 ELSE 0 END) AS Male_Count
FROM df;

Insight: Male customers dominate the dataset.
2️⃣ Top Performers

    Top 10 Most Expensive Orders

    Top 10 Orders by Profit

    Top 5 Most Profitable Products

3️⃣ Category & Payment Analysis

    Total Sales per Product Category

    Average Discount by Payment Method

4️⃣ Customer Segmentation

    Customers with Total Sales > 200

    Customers contributing to the Top 10% of Total Sales (using PERCENT_RANK() in MySQL 8.0+)

5️⃣ Product Insights

    Products with Sales Above Average

    Most Popular Product per Category

    Products Ranked by Profit Margin

6️⃣ Sales Trends

    Monthly Sales Trend – Useful for inventory planning & marketing campaigns.

📈 Example Business Insights

    High-value customers contribute disproportionately to revenue.

    Certain product categories dominate total sales.

    Seasonal trends are visible in monthly sales patterns.

    Profit margin rankings reveal which products should be prioritized.

📜 How to Use

    Import the dataset into MySQL:

        Use MySQL Workbench Table Data Import Wizard or LOAD DATA INFILE.

    Run the queries from sql_file.sql in MySQL Workbench.

    Review output tables to identify trends and opportunities.

📂 Files in This Repository

    sql_file.sql → Contains all SQL queries for analysis.

    SQL Results.docx → Screenshots/output of query results for reporting.

🚀 Future Improvements

    Automate analysis with Python + SQLAlchemy.

    Build a Power BI dashboard for interactive visuals.

    Add predictive analytics for sales forecasting.
