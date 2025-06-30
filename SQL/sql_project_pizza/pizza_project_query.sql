# before importing the csv file we have created the table so that our table contains columns in our desired data type
-- create table orders(
-- order_id int not null,
-- order_date date not null,
-- order_time time not null,
-- primary key(order_id) );

# lets begin the project

SELECT * 
FROM pizzas;

SELECT * 
FROM pizza_types;

SELECT * 
FROM orders;

SELECT * 
FROM order_details;


# following are the basic requirement

-- Basic: 
-- Retrieve the total number of orders placed.

SELECT COUNT(order_id) as total_order
FROM orders;


-- Calculate the total revenue generated from pizza sales.

WITH price_table AS (
    SELECT pz.pizza_id, pz.price, od.quantity
    FROM pizzas AS pz
    JOIN order_details AS od
        ON pz.pizza_id = od.pizza_id
)
SELECT ROUND(SUM(price * quantity), 2) AS total_revenue
FROM price_table;


-- Identify the highest-priced pizza.

SELECT pt.name, pz.price
    FROM pizzas AS pz
    JOIN pizza_types AS pt
        ON pz.pizza_type_id = pt.pizza_type_id
	ORDER BY pz.price desc
    LIMIT 1;


-- Identify the most common pizza size ordered.
WITH size_table AS (
    SELECT pz.pizza_id, pz.size, od.quantity
    FROM pizzas AS pz
    JOIN order_details AS od ON pz.pizza_id = od.pizza_id
)
SELECT 
    size, 
    SUM(quantity) AS total_quantity_per_size
FROM size_table
GROUP BY size
ORDER BY total_quantity_per_size DESC
LIMIT 10;

-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pt.name AS pizza_type,
    SUM(od.quantity) AS total_quantity
FROM order_details AS od
JOIN pizzas AS pz 
	ON od.pizza_id = pz.pizza_id
JOIN pizza_types AS pt 
	ON pz.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;




-- Intermediate:

-- Join the necessary tables to 
-- find the total quantity of each pizza category ordered.

SELECT pt.category, SUM(od.quantity) AS total_quantity
FROM order_details AS od
JOIN pizzas AS pz ON od.pizza_id = pz.pizza_id
JOIN pizza_types AS pt ON pz.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY SUM(od.quantity) DESC;


-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS order_hour,
    COUNT(*) AS order_count
FROM orders
GROUP BY HOUR(order_time)
ORDER BY order_count desc;



-- Join relevant tables to find the category-wise distribution of pizzas.

# we want the count of different pizza in each categories

SELECT COUNT(pizza_type_id) as total_pizza , category
FROM pizzas AS pz
JOIN pizza_types AS pt 
	USING (pizza_type_id)
GROUP BY category
ORDER BY total_pizza DESC;



-- Group the orders by date and calculate the average number of pizzas ordered per day.

-- Orders are in orders.
-- Quantities are in order_details.

WITH daily_totals AS (
    SELECT os.order_date, SUM(od.quantity) AS total_quantity
    FROM orders AS os
    JOIN order_details AS od ON os.order_id = od.order_id
    GROUP BY os.order_date
)
SELECT ROUND(AVG(total_quantity))AS avg_pizzas_per_day
FROM daily_totals;





-- Determine the top 3 most ordered pizza types based on revenue.

WITH most_orderd AS
(
SELECT pt.name, SUM(od.quantity*pz.price) as revenue
FROM order_details AS od
JOIN pizzas AS pz 
	ON od.pizza_id = pz.pizza_id
JOIN pizza_types AS pt 
	ON pz.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
   )
SELECT *
FROM most_orderd
ORDER BY revenue DESC
LIMIT 3;
    



-- Advanced:

-- Calculate the percentage contribution of each pizza type to total revenue.

WITH revenue_pp AS (
    SELECT 
        pt.name AS pizza_name,
        SUM(od.quantity * pz.price) AS revenue
    FROM order_details AS od
    JOIN pizzas AS pz ON od.pizza_id = pz.pizza_id
    JOIN pizza_types AS pt ON pz.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.name
),
gross_revenue AS (
    SELECT SUM(revenue) AS total_revenue
    FROM revenue_pp
)

SELECT 
    pizza_name,
    revenue,
    ROUND((revenue / total_revenue) * 100, 2) AS percent_contribution
FROM revenue_pp, gross_revenue
ORDER BY percent_contribution DESC;


-- Analyze the cumulative revenue generated over time.

-- Revenue happens per order → and orders happen over time.
-- We want a running total: cumulative revenue, sorted by date.


SELECT 
    os.order_date,
    SUM(od.quantity * pz.price) AS daily_revenue,
    SUM(SUM(od.quantity * pz.price)) OVER (ORDER BY os.order_date) AS cumulative_revenue
FROM orders AS os
JOIN order_details AS od ON os.order_id = od.order_id
JOIN pizzas AS pz ON od.pizza_id = pz.pizza_id
GROUP BY os.order_date
ORDER BY os.order_date asc;


-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

WITH pizza_revenue AS (
    SELECT 
        pt.category,
        pt.name AS pizza_name,
        SUM(od.quantity * pz.price) AS total_revenue
    FROM order_details AS od
    JOIN pizzas AS pz ON od.pizza_id = pz.pizza_id
    JOIN pizza_types AS pt ON pz.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
), ranked_revenue AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_revenue DESC) AS revenue_rank
    FROM pizza_revenue
)
SELECT *
FROM ranked_revenue
WHERE revenue_rank <= 3;



































