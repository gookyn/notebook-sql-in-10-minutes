-- ------------------------------
-- 12. 联结表
-- ------------------------------

-- 12.1 联结

-- 12.1.1 关系表
-- 关系表的设计就是把信息分解成多个表，一类数据一个表
-- 各表通过某些共同的值互相关联 -- 关系数据库

-- 关系数据库的可伸缩性远比非关系数据库要好

-- 12.1.2 为什么使用联结
-- 联结：用来在一条 SELECT 语句中关联表
-- 可以联结多个表返回一组输出，联结在运行时关联表中正确的行

-- 联结不是物理实体
-- 在实际的数据库表中并不存在，DBMS 会根据需要建立联结，在查询执行期间一直存在

-- 12.2 创建联结
SELECT vend_name, prod_name, prod_price
FROM Vendors, Products
WHERE Vendors.vend_id = Products.vend_id;

-- 12.2.1 WHERE 子句的重要性
-- WHERE 子句作为过滤条件，只包含那些匹配给定条件的行
-- 没有 WHERE 子句，第一个表中的每一行将与第二个表中的每一行配对，而不管它们逻辑上能否匹配 -- 笛卡尔积

-- 错误示例
SELECT vend_name, prod_name, prod_price
FROM Vendors, Products;

-- 12.2.2 内联结
-- 以上使用的联结称为等值联结，基于两个表之间的相等测试
-- 也称为内联结（inner join）

-- 明确联结类型 INNER JOIN
SELECT vend_name, prod_name, prod_price
FROM Vendors
INNER JOIN Products ON Vendors.vend_id = Products.vend_id;

-- 注意：
-- 判断条件用 ON 子句

-- 12.2.3 联结多个表
-- SQL 不限制一条 SELECT 语句中可以联结的表数目
SELECT prod_name, vend_name, prod_price, quantity
FROM OrderItems, Products, Vendors
WHERE Products.vend_id = Vendors.vend_id
	AND OrderItems.prod_id = Products.prod_id
	AND order_num = 20007;
	
-- 联结的表越多，性能下降越厉害

-- 12.4 挑战题

-- 1 返回顾客名称及相关订单号
-- 等值联结
SELECT cust_name, order_num
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

-- 或使用 INNER JOIN
SELECT cust_name, order_num
FROM Customers
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

-- 2 返回顾客名称、订单号、订单总价
-- 使用联结表
SELECT cust_name, Orders.order_num, SUM(item_price * quantity) AS order_total
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
			AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name, Orders.order_num
ORDER BY cust_name, Orders.order_num;

-- 或使用子查询
SELECT cust_name,
			 order_num,
			 (SELECT SUM(item_price * quantity)
			  FROM OrderItems
				WHERE OrderItems.order_num = Orders.order_num) AS order_total
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

-- 3 查询订购产品 BR01 的日期
SELECT order_date, cust_id
FROM Orders, OrderItems
WHERE Orders.order_num = OrderItems.order_num AND prod_id = 'BR01'
ORDER BY order_date;

-- 4 查询订购 BR01 产品的所有顾客的电子邮箱
SELECT cust_email
FROM Customers
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
	INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
WHERE prod_id = 'BR01';

-- 5 查询订单总价大于等于 1000 的顾客列表
-- 等联结
SELECT cust_name, SUM(item_price * quantity) as totol_price
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
	AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name
HAVING SUM(item_price * quantity) >= 1000  -- 注意分组及过滤
ORDER BY cust_name;

-- INNER JOIN
SELECT cust_name, SUM(item_price * quantity) as totol_price
FROM Customers
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
	INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
GROUP BY cust_name
HAVING SUM(item_price * quantity) >= 1000  -- 注意分组及过滤
ORDER BY cust_name;
