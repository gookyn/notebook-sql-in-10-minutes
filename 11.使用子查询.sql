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

-- 挑战题

-- 1 返回 购买价格为10美元或以上产品的 顾客列表
SELECT cust_id
FROM Orders
WHERE order_num IN (SELECT order_num
										FROM OrderItems
										WHERE item_price >= 10);

-- 2 查询订购 BR01 产品的日期
SELECT order_date, cust_id
FROM Orders
WHERE order_num IN (SELECT order_num
										FROM OrderItems
										WHERE prod_id = 'BR01')
ORDER BY order_date;

-- 3 查询订购 BR01 产品的所有顾客的电子邮箱
SELECT cust_email
FROM Customers
WHERE cust_id IN (SELECT cust_id
									FROM Orders
									WHERE order_num IN (SELECT order_num
																			FROM OrderItems
																			WHERE prod_id = 'BR01'));
																			
-- 4 查询每个订单的总金额以及其客户
SELECT cust_id, 
			(SELECT SUM(item_price * quantity)
			FROM OrderItems
			WHERE Orders.order_num = OrderItems.order_num) AS total_ordered
FROM Orders
ORDER BY total_ordered DESC;

-- 5 查询所有的产品名称及所售产品的总数
SELECT prod_name,
			(SELECT SUM(quantity)
			FROM OrderItems
			WHERE Products.prod_id = OrderItems.prod_id) AS quant_sold
FROM Products;
