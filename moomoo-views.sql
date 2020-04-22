DROP TABLE IF EXISTS dim_users;
CREATE TABLE dim_users (
  id VARCHAR(5),
  cust_id INTEGER,
	cust_name VARCHAR(10),
  zipcode INTEGER
);

DROP TABLE IF EXISTS fct_views;
CREATE TABLE fct_views (
  viewed_at TIMESTAMP,
	user_id VARCHAR(5),
	prod_id VARCHAR(5)
);

INSERT INTO dim_users VALUES ('a4bf', 1, 'Alex', 10128);
INSERT INTO dim_users VALUES ('b5g8', NULL, NULL, NULL);
INSERT INTO dim_users VALUES ('c2d5', 2, 'Rosario', 21011);
INSERT INTO dim_users VALUES ('d4h9', NULL, NULL, NULL);
INSERT INTO dim_users VALUES ('e2f3', 3, 'Chloe', 72217);
INSERT INTO dim_users VALUES ('f5l8', NULL, NULL, NULL);
INSERT INTO dim_users VALUES ('g2b2', NULL, NULL, NULL);
INSERT INTO dim_users VALUES ('h6m9', NULL, NULL, NULL);
INSERT INTO dim_users VALUES ('i0p3', NULL, NULL, NULL);


INSERT INTO fct_views VALUES ('2019-06-22 19:10:25', 'a4bf', 'SKU01');
INSERT INTO fct_views VALUES ('2019-08-30 17:32:04', 'a4bf', 'SKU05');
INSERT INTO fct_views VALUES ('2019-12-06 20:33:12', 'a4bf', 'SKU09');
INSERT INTO fct_views VALUES ('2020-04-02 11:10:25', 'b5g8', 'SKU01');
INSERT INTO fct_views VALUES ('2019-11-15 14:35:37', 'e2f3', 'SKU01');
INSERT INTO fct_views VALUES ('2019-11-15 14:46:34', 'e2f3', 'SKU09');
INSERT INTO fct_views VALUES ('2019-01-23 08:10:02', 'i0p3', 'SKU01');
INSERT INTO fct_views VALUES ('2019-01-24 06:51:15', 'i0p3', 'SKU05');
INSERT INTO fct_views VALUES ('2019-03-09 23:22:13', 'g2b2', 'SKU05');
INSERT INTO fct_views VALUES ('2020-04-04 18:16:09', 'f5l8', 'SKU05');
INSERT INTO fct_views VALUES ('2019-12-22 09:18:39', 'f5l8', 'SKU09');
