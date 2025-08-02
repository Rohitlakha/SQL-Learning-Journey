-- 🔍 View all data from the payment3 table
SELECT * FROM payment3;

-- 🏷️ Assigning a label to each payment based on amount using CASE (for product value)
SELECT customer_id, amount,
  CASE 
    WHEN amount > 100 THEN 'Expensive product'
    WHEN amount = 100 THEN 'Moderate product'
    ELSE 'Inexpensive product' 
  END AS ProductStatus
FROM payment3;

-- 🧾 Classifying customers by specific purchase amount using CASE
SELECT customer_id,
  CASE amount
    WHEN 500 THEN 'Prime Customer'
    WHEN 100 THEN 'Plus Customer'
    ELSE 'Regular Customer'
  END AS CustomerStatus
FROM payment3;
