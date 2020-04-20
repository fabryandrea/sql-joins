## Introduction to SQL Joins

SQL joins enable us to get data from two or more tables by (you guessed it!) joining them. This is the real power of relational databases - we can select any information from any table, as long as we understand the relationships between those tables.

## What are we going to do today?

1. Learn about SQL joins
2. Create a database and fill it with data
3. Practice answering real-time analytics questions

We are going to imagine that we are working for MooMoo, a modern athleisure ecommerce company that offers customers a selection of thoughtfully curated high-performance clothes on its website.

**1. (INNER) JOIN**

We are running an email promotion. You are asked to find the names of all customers who purchased the product with the stock keeping unit ID `SKU09`. (Stock keeping units are alphanumeric codes used to manage sales and inventory. They are unique to products and help track information on product, manufacturer, brand, price, etc..)

### First aside: let's get our data into Postgres

Let's open our terminal and create a database called `moomoo`:

`$ createdb moomoo`

Let's connect to this database:

`$ psql moomoo`

Note: We are now in Postgres land and not in terminal land - lines no longer start with `$` but with `#`.

Then add our data from (the `moomoo-orders.sql` file)[]

### Sidebar on relational databases

What do we have here? And why do these tables start with these funny preambles, `fct_` and `dim_`?

These abbrevations denote so called fact and dimension tables. Fact tables record certain facts about our business, such as order transactions - this table records when order transactions took place, what customers were involved, and what products they ordered.

Dimension tables add more information about one dimension of the fact table - they tell us more about the customers and the products involved. Customers here have

The sheer genius of this design? If a customer moves and their zipcode changes, I only have to update one table, no matter how many products they purchased!

Let's take a look at that product with the id `SKU09`.


In order to answer the question, let's first learn about CTEs (Common Table Expressions), as they are super helpful in

**INNER JOIN**
What is the syntax:
```
SELECT a.this, b.that
FROM table_a AS a
JOIN table_b AS b
ON a.id = b.id
```

How it is executed:

**2. LEFT JOIN**

We want to include customers who haven't yet purchased anything yet but registered on our website so we have their names and emails.

**3. RIGHT JOIN**

We want to understand how popular this product is - how many website visitors viewed it?

First, note that these are not orders, so our `orders` fact table is not going to work.

**4. SELF JOIN**

Find people who viewed `SKU01` before `SKU09`.
