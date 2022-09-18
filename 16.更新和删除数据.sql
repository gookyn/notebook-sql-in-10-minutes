-- ------------------------------
-- 16. 更新和删除数据
-- ------------------------------

-- 16.1 更新数据

-- 注意：
-- ！！！一定要有 WHERE 子句

UPDATE Customers
SET cust_email = 'cust@emai.com',
		cust_name = 'Cust'
WHERE cust_id = 100001;

-- 要删除某个值，可以设为 NUll（假如表定义允许 NULL）
UPDATE Customers
SET cust_email = NULL
WHERE cust_id = 100001;

-- 16.2 删除数据

-- 注意：
-- ！！！一定要有 WHERE 子句

DELETE FROM Customers
WHERE cust_id = 10006;

-- DMBS 可以设置严格实施关系，存在外键时，不允许删除

-- 如果要从表中删除所有行，可以使用 TRUNCATE TABLE

/*
 * 16.3 更新和删除的指导原则
 *
 * 1、保证每个表都有主键
 * 2、除非确实打算更新和删除每一行，都则一定要带 WHERE 子句
 * 3、使用 WHERE 子句前，应该先用 SELECT 进行测试，保证过滤的是正确的记录
 * 4、有的 DBMS 允许管理员施加约束，防止执行不带 WHERE 子句的 UPDATE 或 DELETE 语句
 * 5、使用强制实施引用完整性的数据库
*/

-- 16.5 挑战题

-- 1
-- 一定要有 WHERE
UPDATE Vendors
SET vend_state = UPPER(vend_state)
WHERE vend_country = 'USA';

UPDATE Customers
SET cust_state = UPPER(cust_state)
WHERE cust_country = 'USA';

-- 2
-- 首先使用 SELECT 确认
SELECT cust_id, cust_name
FROM Customers
WHERE cust_id = 100001;

-- 删除是一定要有 WHERE
DELETE FROM Customers
WHERE cust_id = 100001;
