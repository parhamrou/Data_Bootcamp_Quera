-- Section1
    SELECT employees.employeeNumber, CONCAT(employees.firstName, ' ', employees.lastName) AS Name, COUNT(customers.salesRepEmployeeNumber) AS CustomersCount
    FROM employees
    JOIN customers
    ON employees.employeeNumber = customers.salesRepEmployeeNumber
    GROUP BY employees.employeeNumber
    ORDER BY CustomersCount DESC
-- Section2
    SELECT customers.customerNumber
    FROM customers
    JOIN orders
    ON customers.customerNumber = orders.customerNumber
    JOIN
    (SELECT DISTINCT orderdetails.orderNumber AS order_number, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) OVER (PARTITION BY orderdetails.orderNumber) AS order_sum
    FROM orderdetails
    ORDER BY order_sum DESC) T
    ON orders.orderNumber = order_number
    GROUP BY customers.customerNumber
    ORDER BY SUM(order_sum) DESC
    LIMIT 5
-- Section3
    SELECT T.*, RANK() over (PARTITION BY T.productline ORDER BY T.value DESC) AS value_rank FROM
    (SELECT products.productLine AS productline, products.productName, ((MSRP - products.buyPrice) * quantityInStock) AS 'value'
    FROM products
    JOIN productlines
    ON products.productLine = productlines.productLine) T
