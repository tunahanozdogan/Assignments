SELECT city, COUNT(*) as customer_id
FROM sale.customer
GROUP BY city
ORDER BY customer_id DESC;

------------------------------------

SELECT order_id, SUM(quantity) as total_quantity
FROM sale.order_item
GROUP BY order_id;


-------------------------------------
SELECT order_id, product_id, MIN(list_price) as cheapest_price
FROM sale.order_item
GROUP BY order_id, product_id
ORDER BY cheapest_price DESC;

--------------------------------------

SELECT order_id, SUM(list_price * quantity - discount) as total_amount
FROM sale.order_item
GROUP BY order_id
ORDER BY total_amount DESC;

--------------------------------------

SELECT order_id, AVG(list_price) as avg_price
FROM sale.order_item
GROUP BY order_id
HAVING AVG(list_price) = (SELECT MAX(avg_price) FROM
    (SELECT order_id, AVG(list_price) as avg_price
     FROM sale.order_item
     GROUP BY order_id) subquery);

---------------------------------------

SELECT brand_id, product_id, list_price
FROM product.product
ORDER BY brand_id ASC, list_price DESC;


-----------------------------------------

SELECT brand_id, product_id, list_price
FROM product.product
ORDER BY list_price DESC, brand_id ASC;


-----------------------------------------

---------------------------------------
SELECT last_name
FROM sale.customer
WHERE last_name LIKE 'B%s';


----------------------------------------
SELECT *
FROM sale.customer
WHERE city IN ('Allen', 'Buffalo', 'Boston', 'Berkeley');