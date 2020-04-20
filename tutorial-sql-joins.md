## Introduction to SQL Joins


## What are we going to do today?

1. Learn about SQL joins
2. Create a database and fill it with data
3. Practice answering real-time analytics questions

We are going to imagine that we are working for MooMoo, a modern athleisure ecommerce company that offers customers a selection of thoughtfully curated high-performance clothes.

**1. (INNER) JOIN**
We are running an email promotion. Find the names of all customers who purchased the product with the stock keeping unit ID SKU09.

### First aside: let's get our data into Postgres

Let's open our terminal and create a database called `moomoo`:

`$ createdb moomoo`

Let's connect to this database:

`$ psql moomoo`

We are now in Postgres land - lines no longer start with `$` but with `#`
Then add our data from (this file)[]

What do we have here? And why do these tables start with these funny preambles, `fct_` and `dim_`?



Let's first learn about CTEs (Common Table Expressions), as they are super helpful in

What is the syntax:
How it is executed:

**2. LEFT JOIN**
We want to include customers who haven't yet purchased anything yet but registered on our website so we have their names and emails.

**3. RIGHT JOIN**
We want to understand how popular this product is - how many website visitors viewed it?
