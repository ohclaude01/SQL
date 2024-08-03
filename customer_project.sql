select COUNT(orderID) 
from BIT_DB.JanSales
WHERE length(orderID) = 6
AND orderID <> 'Order ID';

SELECT COUNT(orderID), product
from BIT_DB.JanSales
WHERE product = 'iPhone'
AND length(orderID) = 6
AND orderID <> 'Order ID';


SELECT DISTINCT acctnum
FROM BIT_DB.customers
JOIN FebSales ON customers.order_id = FebSales.orderID
WHERE length(orderid) = 6
AND orderid <> 'Order ID';

SELECT Product, MIN(price) 
FROM BIT_DB.JanSales
LIMIT 1;

SELECT DISTINCT Product, ROUND(SUM(quantity)*price, 2) AS revenue
from BIT_DB.JanSales
WHERE length(orderID) = 6
AND orderID <> 'Order ID'
GROUP BY Product
ORDER BY revenue DESC;  

SELECT Product, Quantity, ROUND(SUM(quantity)*price, 2) AS revenue
FROM BIT_DB.FebSales
WHERE length(orderID) = 6
AND location = '548 Lincoln St, Seattle, WA 98101'
AND orderID <> 'Order ID'
GROUP BY Product
ORDER BY revenue DESC;


SELECT count(distinct cust.acctnum), avg(quantity*price)
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust ON FEB.orderid=cust.order_id
WHERE Feb.Quantity>2
AND length(orderid) = 6
AND orderid <> 'Order ID';


SELECT Product, COUNT(Quantity), location
FROM FebSales
WHERE location LIKE '%Los Angeles%'
GROUP BY Product;