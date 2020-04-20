DROP TABLE IF EXISTS dim_customers;
CREATE TABLE dim_customers (
  id INTEGER,
  anon_id VARCHAR(10),
	name VARCHAR(10),
  zipcode INTEGER
);

DROP TABLE IF EXISTS dim_products;
CREATE TABLE dim_products (
	id VARCHAR(5),
	name VARCHAR(30),
  prod_family VARCHAR(10)
	price FLOAT(2)
);

drop table if exists fct_orders;
create table fct_orders (
	cust_id integer,
	prod_id varchar(5)
);

insert into student values (1, 'a4bf', 'Alex', 10128);
insert into student values (2, 'c2d5', 'Rosario', 21011);
insert into student values (3, 'e2f3', 'Chloe', 20);
insert into student values (4, 'MAGGIE', 19);
insert into student values (5, 'Sameer', 22);
insert into student values (6, 'IAN', 18);
insert into student values (7, 'BRIAN', 21);
insert into student values (8, 'Jenny', 20);
insert into student values (9, 'GILLIAN', 20);
insert into student values (10, 'BOB', 21);

INSERT INTO dim_products VALUES ('SKU01', 'comfiest sock', 'accessories', 4.99);
INSERT INTO dim_products VALUES ('SKU05', 'desktop surfer shirt', 'tops', 34.00);
INSERT INTO dim_products VALUES ('SKU09', 'quarantine leggings', 'bottoms', 65.00);

insert into schedule values (1, 'SKU01');
insert into schedule values (1, 'SKU05');
insert into schedule values (1, 'SKU09');
insert into schedule values (2, 'SKU01');
insert into schedule values (3, 'SKU01');
insert into schedule values (3, 'SKU09');
insert into schedule values (4, 'SKU01');
insert into schedule values (4, 'SKU05');
insert into schedule values (5, 'SKU05');
insert into schedule values (6, 'SKU05');
insert into schedule values (6, 'SKU09');
