-- ------------------------------
-- 04. 过滤数据
-- ------------------------------

-- 4.1 使用 WHERE 子句
SELECT prod_name, prod_price
FROM Products
WHERE prod_price = 3.49;

-- 注意：WHERE 子句的位置
-- 在同时使用 ORDER BY 和 WHERE 子句时，应该让 ORDER BY 位于 WHERE 之后，否则会发生错误

-- 4.2 WHERE 子句操作符
-- 4.2.1 检查单个值
SELECT prod_name, prod_price
FROM Products
WHERE prod_price < 10;

-- 4.2.2 不匹配检查
SELECT vend_id, prod_name
FROM Products
WHERE vend_id <> 'DLL01';

SELECT vend_id, prod_name
FROM Products
WHERE vend_id != 'DLL01';

-- <> 和 != 通常可以互换，但并非所有 DBMS 都支持

-- 4.2.3 范围值检查
-- BETWEEN 操作符
SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 5 AND 10; -- 包含起始值

-- 4.2.4 空值检查
-- NULL：无值，与字段包含 0、空字符串或仅仅包含空格不同
-- IS NULL 子句
SELECT prod_name
FROM Products
WHERE prod_price IS NULL;

SELECT cust_name
FROM Customers
WHERE cust_email IS NULL;

-- 注意：通过过滤选择不包含指定值的所有行时，无法返回含 NULL 值的行



