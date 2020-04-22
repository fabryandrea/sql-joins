-- Q1: Find the names of all customers who purchased `SKU09`.

WITH leggings_customers AS (

  SELECT cust_id
  FROM fct_orders
  WHERE prod_id = 'SKU09'
  
)

, with_names AS (

  SELECT DISTINCT cust_id, name
  FROM dim_customers AS c
  JOIN leggings_customers AS lc
  ON c.id = lc.cust_id

)

SELECT * FROM with_names;

-- Q2: Include customers who haven't yet purchased.
-- Q3: Find all website visitors who viewed `SKU9`.
-- Q4: Find people who viewed `SKU01` before `SKU09`.
