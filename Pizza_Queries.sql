-- 1. Explore Table Structures
DESCRIBE pizzas;
DESCRIBE pizza_types;
DESCRIBE orders;
DESCRIBE order_details;

-- 2. Basic SELECTs and Filtering
SELECT p.pizza_id, p.size, p.price, pt.name AS pizza_type, pt.category
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id;

SELECT * FROM orders WHERE order_date = '2015-09-26';


-- 3. Aggregation and GROUP BY 
SELECT pizza_id, SUM(quantity) AS total_quantity
FROM order_details
GROUP BY pizza_id
ORDER BY total_quantity DESC;

SELECT p.pizza_id, p.size, SUM(od.quantity * p.price) AS total_sales
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.pizza_id, p.size
ORDER BY total_sales DESC;

-- Subqueries
SELECT o.order_id, o.order_date, o.order_time, p.pizza_id, pt.name AS pizza_type, od.quantity
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id;

-- Subqueries
SELECT pizza_id, SUM(quantity) AS total_quantity
FROM order_details
GROUP BY pizza_id
HAVING total_quantity > (
    SELECT AVG(quantity) FROM order_details
);

-- Views for Repeated Analysis
DROP VIEW IF EXISTS monthly_pizza_sales;
CREATE VIEW monthly_pizza_sales AS
SELECT EXTRACT(YEAR FROM o.order_date) AS year,
       EXTRACT(MONTH FROM o.order_date) AS month,
       p.pizza_id,
       SUM(od.quantity * p.price) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY year, month, p.pizza_id;

SELECT * FROM monthly_pizza_sales ORDER BY year DESC, month DESC;

-- Index Optimization
CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_order_id ON order_details(order_id);
CREATE INDEX idx_od_pizza_id ON order_details(pizza_id(50));
CREATE INDEX idx_pizza_id ON pizzas(pizza_id(50));
CREATE INDEX idx_pizza_type_id ON pizzas(pizza_type_id(50));

