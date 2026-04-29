-- Count of Churned vs Non-Churned Customers
SELECT Churn, COUNT(*) AS CustomerCount
FROM telco_clean
GROUP BY Churn;

-- Churn Rate by Contract Type
SELECT Contract, 
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS ChurnRatePercentage
FROM telco_clean
GROUP BY Contract;

-- Churn by Internet Service.
SELECT InternetService, 
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS ChurnRatePercentage
FROM telco_clean
GROUP BY InternetService;

-- Churn by Payment Method.
SELECT PaymentMethod, 
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS ChurnRatePercentage
FROM telco_clean
GROUP BY PaymentMethod;

-- Churn by Tenure Group.
SELECT TenureGroup,
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS ChurnRatePercentage
FROM telco_clean
GROUP BY TenureGroup
ORDER BY TenureGroup;

-- Churn by multiple factors together ( Contract + InternetService + PaymentMethod)
SELECT 
    Contract,
    InternetService,
    PaymentMethod,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS ChurnRatePercentage
FROM telco_clean
GROUP BY Contract, InternetService, PaymentMethod
ORDER BY ChurnRatePercentage DESC;


SELECT * FROM telco_clean;

