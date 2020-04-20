DROP TABLE IF EXISTS dim_users;
CREATE TABLE dim_users (
  id INTEGER,
	name VARCHAR(10),
  zipcode INTEGER
);

INSERT INTO dim_users VALUES ('a4bf', 'Alex', 10128);
INSERT INTO dim_users VALUES ('b5g8', NULL, NULL);
INSERT INTO dim_users VALUES ('c2d5', 'Rosario', 21011);
INSERT INTO dim_users VALUES ('d4h9', NULL, NULL);
INSERT INTO dim_users VALUES ('e2f3', 'Chloe', 72217);
INSERT INTO dim_users VALUES ('f5l8', NULL, NULL);
INSERT INTO dim_users VALUES ('g2b2', NULL, NULL);
INSERT INTO dim_users VALUES ('h6m9', NULL, NULL);
INSERT INTO dim_users VALUES ('i0p3', NULL, NULL);
