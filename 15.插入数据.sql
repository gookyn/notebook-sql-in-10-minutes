-- ------------------------------
-- 15. 插入数据
-- ------------------------------

-- 15.1 数据插入

-- 15.1.1 插入完整的行
INSERT INTO Customers
VALUES
	(
		10006,
		'Toy Land',
		'123 Any Street',
		'New York',
		'NY',
		'11111',
		'USA',
		NULL,
	NULL 
	);
	
-- 注意：
-- 每列必须以它们在表定义中出现的次序填充
-- 尽量避免使用这种方法

-- 另一种方法：指定列，不需要依赖表定义中的次序
INSERT INTO Customers (
	cust_id,
	cust_contact,
	cust_email,
	cust_name,
	cust_address,
	cust_city,
	cust_state,
	cust_zip 
)
VALUES
	(
		10007,
		NULL,
		NULL,
		'Toy Land',
		'123 Any Street',
		'New York',
		'NY',
		'11111' 
	);
	
-- 注意：
-- VALUES 的数目必须正确且对应

-- 15.1.2 插入部分行
-- 可以省略某些列

INSERT INTO Customers (
	cust_id,
	cust_name,
	cust_address,
	cust_city,
	cust_state,
	cust_zip 
)
VALUES
	(
		10008,
		'Toy Land',
		'123 Any Street',
		'New York',
		'NY',
		'11111' 
	);
	
	-- 15.1.3 插入检索出的数据
	-- INSERT SELECT
	
	-- 从 CustNew 表中读取数据并插入到 Customers 表
	INSERT INTO Customers (
	cust_id,
	cust_name,
	cust_address,
	cust_city,
	cust_state,
	cust_zip 
)
SELECT
	cust_id,
	cust_name,
	cust_address,
	cust_city,
	cust_state,
	cust_zip
FROM CustNew;

-- 注意：
-- 插入数据时使用的是列的位置，和列名没有关系
-- INSERT SELECT 中可以包含 WHERE 子句，以过滤需要插入的数据

-- 15.2 从一个表复制到另一个表
-- CREATE SELECT
CREATE TABLE CustCopy AS SELECT * FROM Customers;

-- 注意：
-- 任何 SELECT 选项和子句都可以使用
-- 可利用联结从多个表插入数据
-- 不管从多少个表中检索数据，都只能插入到一个表中

-- 15.4 挑战题
-- 1
INSERT INTO Customers(
	cust_id,
	cust_name
)
VALUES
(
	100001,
	'cust01'
);

-- 2
CREATE TABLE OrdersCopy AS SELECT * FROM Orders;

CREATE TABLE OrderItemsCopy AS SELECT * FROM OrderItems;
