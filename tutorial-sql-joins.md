# Introduction to SQL Joins

SQL joins enable us to get data from two or more tables by (you guessed it!) joining them. This is the real power of relational databases - we can select any information from any table, as long as we understand the relationship between those tables.

# What are we going to do today?

1. Learn about SQL joins
2. Create a database and fill it with data
3. Practice answering real-time analytics questions

We are going to imagine that we are working for MooMoo, a modern athleisure ecommerce company that offers customers a selection of thoughtfully curated high-performance clothes on its website.

## 1. (INNER) JOIN

We are running an email promotion. You are asked to find the names of all customers who purchased the product with the stock keeping unit ID `SKU09`. (Stock keeping units are alphanumeric codes used to manage sales and inventory. They are unique to products and help track information on product, manufacturer, brand, price, etc..)

## First aside: let's get our data into Postgres

Let's open our terminal and create a database called `moomoo`:

`$ createdb moomoo`

Let's connect to this database:

`$ psql moomoo`

**Note:** We are now in Postgres land and not in terminal land - lines no longer start with `$` but with `#`.

Then add our data from this file: [`moomoo-orders.sql`](https://github.com/fabryandrea/sql-joins/blob/master/moomoo-orders.sql)

## Sidebar on relational databases

![orders ERD](/images/fct_orders.png)

What do we have here? And why do these tables start with these funny preambles, `fct_` and `dim_`?

These abbrevations denote so called fact and dimension tables.
* **Fact tables** record certain facts about our business, such as order transactions - this table records when order transactions took place, what customers were involved, and what products they ordered.
* **Dimension tables** add more information about one dimension of the fact table - they tell us more about the customers and the products involved. Customers here have names and zipcodes; product have product names, families, and prices.
* They are connected to each other by **keys** :key:

The sheer genius of this design? If a customer moves and their zipcode changes, I only have to update one table, no matter how many products they purchased!

Now, back to the question: Find the names of all customers who purchased `SKU09`. Let's take a look at that product with the id `SKU09`:
* What is it? `SELECT * FROM dim_products WHERE id = 'SKU09'`
* Who bought it? `SELECT cust_id FROM fct_orders WHERE prod_id = 'SKU09'`
* How do I get their names?

In order to answer this question, let's first learn about CTEs (Common Table Expressions) and aliases, as they are super helpful in answering complex questions in clean code.

We can declare a CTE with `WITH` and alias any table with `AS`. Here, first I find my customers who bought this product (same as :point_up:) and then join it to the customers dimension table to get their names.

```
WITH leggings_customers AS (

  SELECT cust_id
  FROM fct_orders
  WHERE prod_id = 'SKU09'

)

, with_names AS (

  SELECT cust_id, name
  FROM dim_customers AS c
  JOIN leggings_customers AS lc
  ON c.id = lc.cust_id

)

SELECT * FROM with_names;
```

**INNER JOIN** - the syntax:
```
SELECT a.this, b.that
FROM table_a AS a
JOIN table_b AS b
ON a.id = b.id
```



## 2. LEFT JOIN

Find all customers, including those who haven't yet purchased anything yet but registered on our website, and the products they purchased (if any).

In this particular case, we are reversing what we did before - I want all customer names, so I am starting with the `customers` dimension table not the `orders` fact table. Again, I want to join `customers` with `orders`, except this time I want to keep everyone in the left table, not just the ones that overlap with the right table.

**LEFT JOIN** - the syntax:
```
SELECT a.this, b.that
FROM table_a AS a
LEFT JOIN table_b AS b
ON a.id = b.id
```



## 3. RIGHT JOIN

Find a list of website visitors who viewed this product, with their name and zipcode (if we have them).

First, note that these are not orders, so our `orders` fact table is not going to work. So let's get the `views` fact table from this file: [`moomoo-views.sql`](https://github.com/fabryandrea/sql-joins/blob/master/moomoo-views.sql)

![views ERD](/images/fct_views.png)

## Aside on event tracking

Most ecommerce companies track select events on their websites using anonymous IDs. When a customer logs in, that anonymous ID will be traced to their account ID. Since anonymous IDs are assigned randomly at every visit, one customer may have multiple anonymous IDs but will only have one account ID. Sometimes a customer will never log in during their browsing session and their anonymous ID will remain truly anonymous.

Here, we are going the opposite way - we want to keep everyone in the right `views` table and add information from the left `users` table, if available. Hence, we are using - :tada: - a right join.


**RIGHT JOIN** - the syntax:
```
SELECT a.this, b.that
FROM table_a AS a
RIGHT JOIN table_b AS b
ON a.id = b.id
```



## 4. SELF JOIN

Find people who viewed `SKU01` before `SKU09`.

Let's start by talking a look at what we expect the answer to be: `SELECT * FROM fct_views ORDER BY user_id, viewed_at DESC`

Previously, we were joining separate tables - apples to oranges, so to speak. But now all the information we need is in one table, we just want to compare this table to itself. This is extremely helpful when we have events that take place over time (for instance, we are looking at people who converted into customers after browsing our website.)

**SELF JOIN** - the syntax:
```
SELECT a.this, b.that
FROM table_a AS a
JOIN table_a AS b
ON a.id = b.id
AND ...
```



# Practice questions

Now it's your turn to practice:
1. Find the zipcodes of all customers who viewed the product `SKU01`.
2. Find all the customers who purchased `SKU01` before `SKU09`.
3. Find all the customers who viewed `SKU01` before purchasing `SKU09`.
4. Find all the customers who viewed `SKU01` and include their names, if possible.
