SELECT COUNT(*) FROM telco_clean;
-- checking duplicate customer IDs exist or not.
SELECT customerID, COUNT(*) AS DuplicateCount
FROM telco_clean
GROUP BY customerID
HAVING COUNT(*) > 1;

-- Checking Missing or Blank Values in the data 
SELECT 
    SUM(CASE WHEN customerID IS NULL OR customerID = '' THEN 1 ELSE 0 END) AS MissingCustomerID,
    SUM(CASE WHEN TotalCharges IS NULL OR TotalCharges = '' THEN 1 ELSE 0 END) AS MissingTotalCharges
FROM telco_clean;

SET SQL_SAFE_UPDATES = 0;


-- Cleaning the Missing Values in TotalCharges
UPDATE telco_clean
SET TotalCharges = NULL
WHERE TotalCharges = '';
-- verifying 
SELECT COUNT(*) 
FROM telco_clean
WHERE TotalCharges IS NULL;

-- Converting TotalCharges to Decimal
ALTER TABLE telco_clean
MODIFY TotalCharges DECIMAL(10,2);

DESCRIBE telco_clean;






