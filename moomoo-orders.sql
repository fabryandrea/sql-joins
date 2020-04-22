DROP TABLE IF EXISTS dim_customers;
CREATE TABLE dim_customers (
  id INTEGER,
	name VARCHAR(10),
  zipcode INTEGER
);

DROP TABLE IF EXISTS dim_products;
CREATE TABLE dim_products (
	id VARCHAR(5),
	name VARCHAR(30),
  prod_family VARCHAR(15),
	price FLOAT(2)
);

DROP TABLE IF EXISTS fct_orders;
CREATE TABLE fct_orders (
  ordered_at TIMESTAMP,
	cust_id INTEGER,
	prod_id VARCHAR(5)
);

INSERT INTO dim_customers VALUES (1, 'Alex', 10128);
INSERT INTO dim_customers VALUES (2, 'Rosario', 21011);
INSERT INTO dim_customers VALUES (3, 'Chloe', 20220);
INSERT INTO dim_customers VALUES (4, 'Juan', 94207);
INSERT INTO dim_customers VALUES (5, 'Sameer', 83254);
INSERT INTO dim_customers VALUES (6, 'Nick', 70115);
INSERT INTO dim_customers VALUES (7, 'Nadya', 21235);
INSERT INTO dim_customers VALUES (8, 'Jenny', 20209);
INSERT INTO dim_customers VALUES (9, 'Aisha', 02103);
INSERT INTO dim_customers VALUES (10, 'Tyrell', 03217);

INSERT INTO dim_products VALUES ('SKU01', 'comfiest sock', 'accessories', 4.99);
INSERT INTO dim_products VALUES ('SKU05', 'desktop surfer shirt', 'tops', 34.00);
INSERT INTO dim_products VALUES ('SKU09', 'quarantine leggings', 'bottoms', 65.00);

INSERT INTO fct_orders VALUES ('2019-06-22 19:10:25', 1, 'SKU01');
INSERT INTO fct_orders VALUES ('2019-08-30 17:32:04', 1, 'SKU05');
INSERT INTO fct_orders VALUES ('2019-12-06 20:33:12', 1, 'SKU09');
INSERT INTO fct_orders VALUES ('2020-04-02 11:10:25', 2, 'SKU01');
INSERT INTO fct_orders VALUES ('2019-11-15 14:35:37', 3, 'SKU01');
INSERT INTO fct_orders VALUES ('2019-11-15 14:46:34', 3, 'SKU09');
INSERT INTO fct_orders VALUES ('2019-01-23 08:10:02', 4, 'SKU01');
INSERT INTO fct_orders VALUES ('2019-01-24 06:51:15', 4, 'SKU05');
INSERT INTO fct_orders VALUES ('2019-03-09 23:22:13', 5, 'SKU05');
INSERT INTO fct_orders VALUES ('2020-04-04 18:16:09', 6, 'SKU05');
INSERT INTO fct_orders VALUES ('2019-12-22 09:18:39', 6, 'SKU09');
