-- ------------------------------
-- 22. 高级 SQL 特性
-- ------------------------------

-- 22.1 约束
-- 管理如何插入或处理数据库数据的规则

-- DBMS 通过在数据库表上施加约束来实施引用完整性 

-- 22.1.1 主键
-- 主键是一种特殊的约束，用来保证一列（或一组列）中的值是唯一的，而且永不改动

/*
 * 条件：
 * 任意两行的主键值都不相同
 * 每行都具有一个主键值（列中不允许 NUll 值）
 * 包含主键值的列从不修改或更新
 * 主键值不能重用，如果从表中删除某一行，其主键值不分配给新行
*/

-- PRIMARY KEY 关键字
CREATE TABLE Vendors
(
	vend_id			CHAR(10)		NOT NULL PRIMARY KEY,
	vend_name		CHAR(50)		NOT NULL,
	vend_city		CHAR(50)		NULL
);

-- 或者使用 CONSTRAINT 语法
ALTER TABLE Vendors
ADD CONSTRAINT PRIMARY KEY (vend_id);

-- 22.1.2 外键
-- 外键是表中的一列，其值必须列在另一表的主键中
-- 外键时保证引用完整性的极其重要部分

-- REFERENCES 关键字
CREATE TABLE Orders
(
	order_num		INTEGER			NOT NULL PRIMARY KEY,
	order_date	DATETIME		NOT NULL,
	cust_id			CHAR(10)		NOT NUll REFERENCES Customers(cust_id)
);

-- 或者
ALTER TABLE Orders
ADD CONSTRAINT
FOREIGN KEY (cust_id) REFERENCES Customers(cust_id);

-- 22.1.3 唯一约束
-- 用来保证一列（或一组列）中的数据是唯一的

/*
 * 唯一约束与主键的区别：
 * 表可包含多个唯一约束，但每个表只允许一个主键
 * 唯一约束列可包含 NUll 值
 * 唯一约束列可修改或更新
 * 唯一约束列的值可重复使用
 * 唯一约束不能用于定义外键
*/

-- UNION 关键字

-- 22.1.4 检查约束
-- 检查约束用来保证一列（或一组列）中的数据满足一组指定的条件

/*
 * 常见用途：
 * 检查最小或最大值
 * 指定范围，如日期
 * 只允许特定的值，如性别字段中只允许 M 或 F
*/

CREATE TABLE OrderItems
(
	order_num			INTEGER			NOT NUll,
	order_item		INTEGER			NOT NULL,
	prod_id				CHAR(10)		NOT NULL,
	quantity			INTEGER			NOT NULL CHECK (quantity > 0),
	item_price		MONEY				NOT NULL
);

-- 22.2 索引
-- 索引用来排序数据以加快搜索和排序操作的速度

/*
 * 索引改善检索操作的性能，但降低了数据插入、修改和删除的性能，因为在执行这些操作时，必须动态地更新索引
 * 索引数据可能要占用大量的存储空间
 * 并非所有数据都适合做索引
 * 索引用于数据过滤和数据排序
 * 可以在索引中定义多个列
 * 索引必须唯一命名
 * 索引的效率随表数据的增加或改变而变化
*/

-- CREATE INDEX 语句
CREATE INDEX prod_name_index
ON Products (prod_name);

-- 22.3 触发器
-- 触发器是特殊的存储过程，在特定的数据库活动发生时自动执行

-- 可以与特定表上的 INSERT、UPDATE、DELETE 操作（或组合）相关联

/*
 * 常见用途：
 * 保证数据一致
 * 基于某个表的变动在其他表上执行活动
 * 进行额外的验证并根据需要回退数据
 * 计算计算列的值或更新时间戳
*/

-- SQL Server
-- 对所有 INSERT、UPDATE 操作，将 Customers 表中的 cust_state 列转为大写
CREATE TRIGGER customer_state
ON Customers
FOR INSERT, UPDATE
AS
UPDATE Customers
SET cust_state = UPPER(cust_state)
WHERE Customers.cust_id = inserted.cust_id;

-- 一般来说，约束的处理比触发器快，因此应尽量使用约束

-- 22.4 数据库安全
-- 对用户及操作的管理

-- GRANT、REVOKE 语句
