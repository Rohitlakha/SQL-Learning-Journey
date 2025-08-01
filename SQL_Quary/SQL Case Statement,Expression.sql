select * from payment3

SELECT customer_id, amount,
 CASE
 WHENamount > 100 THEN 'Expensive product'
 WHENamount = 100 THEN 'Moderate product'
 ELSE 'Inexpensive product' 
ENDAS ProductStatus
 FROM payment3

  SELECT customer_id,
 CASE amount
 WHEN500 THEN 'Prime Customer'
 WHEN100 THEN 'Plus Customer'
 ELSE 'Regular Customer'
 ENDAS CustomerStatus
 FROM payment3