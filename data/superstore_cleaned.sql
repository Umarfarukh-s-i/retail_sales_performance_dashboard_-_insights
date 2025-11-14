use retail;
CREATE TABLE superstore_cleaned (
    order_id VARCHAR(50),
    order_date DATE,
    month VARCHAR(20),
    ship_date DATE,
    customer VARCHAR(100),
    manufactory VARCHAR(100),
    product_name VARCHAR(255),
    segment VARCHAR(100),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    region VARCHAR(100),
    zip VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    discount FLOAT,
    profit FLOAT,
    quantity INT,
    sales FLOAT,
    profit_margin FLOAT
);

select * from superstore_cleaned;

# Total Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM superstore_cleaned
GROUP BY Region
ORDER BY Total_Sales DESC;

#Top 5 Products by Profit
SELECT Product_Name, SUM(Profit) AS Total_Profit
FROM superstore_cleaned
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 5;

#Sales and Profit by Category
SELECT category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM superstore_cleaned
GROUP BY category;

#Discount Impact on Profit
SELECT 
  CASE WHEN discount >= 0.2 THEN 'High Discount' ELSE 'Low Discount' END AS Discount_Level,
  SUM(Sales) AS Sales,
  SUM(Profit) AS Profit
FROM superstore_cleaned
GROUP BY Discount_Level;






