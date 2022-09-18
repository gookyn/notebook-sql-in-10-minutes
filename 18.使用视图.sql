-- ------------------------------
-- 18. 使用视图
-- ------------------------------

-- 18.1 视图
-- 视图是虚拟的表，只包含使用时动态检索数据的查询

/*
 * 为什么使用视图
 * 1、重写 SQL 语句
 * 2、简化复杂的 SQL 操作
 * 3、使用表的一部分而不是整个表
 * 4、保护数据
 * 5、更改数据格式和表示
*/

-- 18.2 创建视图

-- 18.2.1 利用视图简化复杂的联结
CREATE VIEW ProductCustomers AS
SELECT cust_name, cust_contact, prod_id
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
	AND OrderItems.order_num = 	Orders.order_num;
	
-- 通过视图查询
SELECT cust_name, cust_contact
FROM ProductCustomers
WHERE prod_id = 'RGAN01';

-- 18.2.2 用视图重新格式化检索出的数据
CREATE VIEW VendorLocations AS
SELECT CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')') AS vend_title
FROM Vendors;

SELECT * FROM VendorLocations;

-- 18.2.3 用视图过滤不想要的数据
CREATE VIEW CustomerEmailList AS
SELECT cust_id, cust_name, cust_email
FROM Customers
WHERE cust_email IS NOT NULL;

SELECT * 
FROM CustomerEmailList;

-- 18.2.3 使用视图与计算字段
CREATE VIEW OrderItemsExpanded AS
SELECT order_num, prod_id, quantity, item_price, quantity * item_price AS expanded_price
FROM OrderItems;

SELECT * 
FROM OrderItemsExpanded
WHERE order_num = 20008;

-- 18.4 挑战题

-- 1
CREATE VIEW CustomerWithOrders AS
SELECT Customers.cust_id,
			 Customers.cust_name,
			 Customers.cust_email,
			 Customers.cust_contact,
			 Customers.cust_country,
			 Customers.cust_state,
			 Customers.cust_city,
			 Customers.cust_address,
			 Customers.cust_zip
FROM Customers
	INNER JOIN Orders ON Orders.cust_id = Customers.cust_id;
	
SELECT * 
FROM CustomerWithOrders;

-- 2
-- 视图中不能使用 ORDER BY
