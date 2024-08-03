#In this SQL file, I'm querying a database with multiple tables in it to quantify statistics about customer and order data. 
  
#1. How many orders were placed in January?
select COUNT(orderID) 
from BIT_DB.JanSales
WHERE length(orderID) = 6
AND orderID <> 'Order ID';
  
#2. How many of those orders were for an iPhone?
SELECT COUNT(orderID), product
from BIT_DB.JanSales
WHERE product = 'iPhone'
AND length(orderID) = 6
AND orderID <> 'Order ID';

#3. Select the customer account numbers for all the orders that were placed in February. 
SELECT DISTINCT acctnum
FROM BIT_DB.customers
JOIN FebSales ON customers.order_id = FebSales.orderID
WHERE length(orderid) = 6
AND orderid <> 'Order ID';

#4. Which product was the cheapest one sold in January, and what was the price? 
SELECT Product, MIN(price) 
FROM BIT_DB.JanSales
LIMIT 1;

#5. What is the total revenue for each product sold in January? 
SELECT DISTINCT Product, ROUND(SUM(quantity)*price, 2) AS revenue
from BIT_DB.JanSales
WHERE length(orderID) = 6
AND orderID <> 'Order ID'
GROUP BY Product
ORDER BY revenue DESC;  
  
#6. Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue? 
SELECT Product, Quantity, ROUND(SUM(quantity)*price, 2) AS revenue
FROM BIT_DB.FebSales
WHERE length(orderID) = 6
AND location = '548 Lincoln St, Seattle, WA 98101'
AND orderID <> 'Order ID'
GROUP BY Product
ORDER BY revenue DESC;

#7. How many customers ordered more than 2 products at a time in February, and what was the average amount spent for those customers? 
SELECT count(distinct cust.acctnum), avg(quantity*price)
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust ON FEB.orderid=cust.order_id
WHERE Feb.Quantity>2
AND length(orderid) = 6
AND orderid <> 'Order ID';

#8. List all the products sold in Los Angeles in February, and include how many of each were sold.
SELECT Product, COUNT(Quantity), location
FROM FebSales
WHERE location LIKE '%Los Angeles%'
GROUP BY Product;
