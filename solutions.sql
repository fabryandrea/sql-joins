-- Q1: Find the names of all customers who purchased `SKU09`.

WITH leggings_customers AS (

  SELECT cust_id
  FROM fct_orders
  WHERE prod_id = 'SKU09'

)

, with_names AS (

  SELECT cust_id, cust_name
  FROM dim_customers AS c
  JOIN leggings_customers AS lc
  ON c.id = lc.cust_id

)

SELECT * FROM with_names;

-- Q2: Find all customers with the products they purchased (if any).

WITH with_products AS (

  SELECT id, cust_name, prod_id
  FROM dim_customers cust
  LEFT JOIN fct_orders ord
  ON cust.id = ord.cust_id

)

SELECT * FROM with_products;

-- Q3: Find the zipcodes of all website visitors who viewed `SKU9`.

WITH leggings_viewers AS (

  SELECT user_id
  FROM fct_views
  WHERE prod_id = 'SKU09'

)

, with_zips AS (

  SELECT user_id, cust_name, zipcode
  FROM dim_users AS a
  RIGHT JOIN leggings_viewers AS b
  ON a.id = b.user_id

)

SELECT * FROM with_zips;


-- Q4: Find all the customers viewed `SKU01` before `SKU05`.

WITH first_socks AS (

  SELECT DISTINCT socks.user_id
  FROM fct_views socks
  JOIN fct_views tops
  ON socks.user_id = tops.user_id
  AND socks.prod_id = 'SKU01'
  AND socks.viewed_at < tops.viewed_at
  AND tops.prod_id = 'SKU05'
)

SELECT * FROM first_socks;
