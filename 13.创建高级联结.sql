-- ------------------------------
-- 13. 创建高级联结
-- ------------------------------

-- 13.1 使用表别名
SELECT cust_name, cust_contact
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
	AND OI.order_num = O.order_num
	AND prod_id = 'RGAN01';
	
-- 表别名只在查询执行中使用，不返回到客户端

-- 13.2 使用不同类型的联结
-- 自联结、自然联结、外联结

-- 13.2.1 自联结
SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM Customers AS c1, Customers AS c2
WHERE c1.cust_name = c2.cust_name
	AND c2.cust_contact = 'Jim Jones';
	
-- 自联结通常作为外部语句，用来替代从相同表中检索数据的使用子查询语句

-- 13.2.2 自然联结
-- 标准的联结（内联结）返回所有数据，相同的列甚至出现多次
-- 自然联结排除多次出现，使每一列只返回一次

-- 自然联结要求只能选择那些唯一的列，一般通过对一个表使用通配符（SELECT *）
-- 而对其他表的列使用明确的子集来完成
SELECT C.*, O.order_num, O.order_date, OI.prod_id, OI.quantity, OI.item_price
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
	AND OI.order_num = O.order_num
	AND prod_id = 'RGAN01';

-- 13.2.3 外联结
-- 联结包含了在相关表中没有关联行的行

-- OUTER JOIN 关键字

-- 不同 DBMS 的外联结语法可能不同

SELECT Customers.cust_id, Orders.order_num
FROM Customers
	LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;
	
SELECT Customers.cust_id, Orders.order_num
FROM Customers
	RIGHT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;
	
-- 必须指明 LEFT 或 RIGHT

-- 全外联结
-- 检索两个表中所有行并关联可以关联的行
-- 有些 DBMS 不支持

-- 13.3 使用带聚集函数的联结
SELECT Customers.cust_id, COUNT(Orders.order_num) AS num_ord
FROM Customers
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

SELECT Customers.cust_id, COUNT(Orders.order_num) AS num_ord
FROM Customers
	LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

/*
* 13.4 使用联结和联结条件
*
* 注意所使用的联结类型
* 不同 DMBS 语法不同
* 保证使用正确的联结条件
* 应该总是提供联结条件，避免出现笛卡尔积
* 在一个联结中可以包含多个表，甚至可以对每个联结采用不同的联结类型
*/

-- 13.6 挑战题

-- 1 查询每个顾客的名称和所有订单号
SELECT cust_name, order_num
FROM Customers AS C
	INNER JOIN Orders AS O ON C.cust_id = O.cust_id
ORDER BY cust_name;

-- 2 修改1，列出所有顾客，即使没有下过订单
SELECT cust_name, order_num
FROM Customers AS C
	LEFT OUTER JOIN Orders AS O ON C.cust_id = O.cust_id
ORDER BY cust_name;

-- 3 使用外联结，查询产品名称和与之相关的订单号
SELECT prod_name, order_num
FROM Products
	LEFT OUTER JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
ORDER BY prod_name;

-- 4 修改3，返回每一项产品的总订单数
SELECT prod_name, COUNT(order_num) AS total_order
FROM Products
	LEFT OUTER JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
GROUP BY Products.prod_id
ORDER BY prod_name;

-- 5 查询供应商及其可供产品的数量，包括没有产品的供应商
SELECT Vendors.vend_id, vend_name, COUNT(prod_id) AS total_prod
FROM Vendors
	LEFT OUTER JOIN Products ON Vendors.vend_id = Products.vend_id
GROUP BY Vendors.vend_id;
