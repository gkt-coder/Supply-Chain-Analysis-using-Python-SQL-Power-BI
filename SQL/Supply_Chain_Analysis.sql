select *from supply_chain_analysis;

# Top delayed warehouses
SELECT
    Warehouse_ID,
    Location,
    Order_delay
FROM supply_chain_analysis
ORDER BY Order_delay DESC
LIMIT 20;

# High Stockout Risk Locations
SELECT
    Warehouse_ID,
    Location,
    Current_Stock,
    Demand_Forecast,
    Stockout_Risk
FROM supply_chain_analysis
ORDER BY Stockout_Risk DESC
LIMIT 20;

# Product Category Sales Performance
SELECT
    Product_Category,
    SUM(Monthly_Sales) AS Total_Sales,
    AVG(Customer_Rating) AS Avg_Rating
FROM supply_chain_analysis
GROUP BY Product_Category
ORDER BY Total_Sales DESC;

# Cost vs Profit Analysis
SELECT
    Warehouse_ID,
    Location,
    Total_Cost,
    Revenue,
    profit
FROM supply_chain_analysis
ORDER BY profit DESC;

# Demand vs Stock Comparison
SELECT
    Warehouse_ID,
    Location,
    Current_Stock,
    Demand_Forecast,
    Inventory_Gap,
    CASE
        WHEN Inventory_Gap > 0 THEN 'Stock Shortage'
        WHEN Inventory_Gap < 0 THEN 'Overstock'
        ELSE 'Balanced'
    END AS Status
FROM supply_chain_analysis	
ORDER BY ABS(Inventory_Gap) DESC;