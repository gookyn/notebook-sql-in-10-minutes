-- ------------------------------
-- 17. 创建和操纵表
-- ------------------------------

-- 17.1 创建表

-- 17.1.1 表创建基础
CREATE TABLE CreateProducts
(
	prod_id			CHAR(10)			NOT NUll,
	vend_id			CHAR(10)			NOT NULL,
	prod_name		CHAR(254)			NOT NUll,
	prod_price	DECIMAL(8,2)	NOT NULL,
	prod_desc		VARCHAR(1000)	NUll
);

-- 17.1.2 使用 NUll 值
-- NULL 为默认设置
CREATE TABLE CreateVendors
(
	vend_id				CHAR(10)		NOT NUll,
	vend_name			CHAR(50)		NOT NUll,
	vend_address	CHAR(50)		,
	vend_city			CHAR(50)		,
	vend_state		CHAR(5)			,
	vend_zip			CHAR(10)		,
	vend_country	CHAR(50)
);

-- 17.1.3 指定默认值
CREATE TABLE CreateOrderItems
(
	order_num			INTEGER				NOT NUll,
	order_item		INTEGER				NOT NULL,
	prod_id				CHAR(10)			NOT NULL,
	quantity			INTEGER				NOT NULL		DEFAULT 1,
	item_price		DECIMAL(8,2)	NOT Null
);

-- 17.2 更新表
-- 增加字段
ALTER TABLE CreateVendors
ADD vend_phone	CHAR(20);

-- 删除字段
ALTER TABLE CreateVendors
DROP COLUMN vend_phone;

-- 注意：
-- ！！！使用 ALTER TABLE 时一定要小心，在改动前做完整的备份（表结构和数据均备份）

-- 17.3 删除表
DROP TABLE CustCopy;

-- 注意：
-- ！！！删除表没有确认步骤，也不能撤销，将永久删除表，谨慎操作

-- 17.6 挑战题

-- 1
ALTER TABLE Vendors
ADD vend_web CHAR(255);

-- 2
UPDATE Vendors
SET vend_web = 'https://example.com'
WHERE vend_id = 'BRS01';
