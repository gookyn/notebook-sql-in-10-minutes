-- ------------------------------
-- 11. 使用子查询
-- ------------------------------

-- 11.1 子查询
-- 任何 SQL 语句都是查询，但此术语一般指 SELECT 语句
-- 子查询：嵌套在其他查询中的查询

-- 11.2 利用子查询进行过滤
SELECT cust_id
FROM Orders
WHERE order_num IN (SELECT order_num
										FROM OrderItems
										WHERE prod_id = 'RGAN01');
										
-- 在 SELECT 语句中，子查询总是从内向外处理

SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
									FROM Orders
									WHERE order_num IN (SELECT order_num
																			FROM OrderItems
																			WHERE prod_id = 'RGAN01'));
																			
-- 注意：
-- 作为子查询的 SELECT 语句只能查询单个列

-- 11.3 作为计算字段使用子查询
SELECT
	cust_name,
	cust_state,
	( SELECT COUNT(*) FROM Orders WHERE Orders.cust_id = Customers.cust_id ) AS orders 
FROM
	Customers 
ORDER BY
	cust_name;
	
	-- 完全限定列名 Orders.cust_id、Customers.cust_id
