-- ------------------------------
-- 07. 创建计算字段
-- ------------------------------

-- 7.2 拼接字段
-- 不同 DBMS 操作方法不同，可能是：+、||、特殊函数
-- MySQL：CONCAT(str1,str2,...)
SELECT CONCAT(vend_name, ' (', vend_country, ')')
FROM Vendors
ORDER BY vend_name;

-- RTRIM(str) 函数去掉值右边的所有空格
SELECT CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')')
FROM Vendors
ORDER BY vend_name; 

-- 使用别名
-- AS 关键字
SELECT CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')')
AS vend_title
FROM Vendors
ORDER BY vend_name;

-- 7.3 执行算术计算
SELECT prod_id, quantity, item_price, quantity * item_price AS expended_price
FROM OrderItems
WHERE order_num = 20008;

-- 挑战题

-- 1
SELECT vend_id, vend_name AS vname, vend_address AS vaddress, vend_city AS vcity
FROM Vendors
ORDER BY vname;

-- 2
SELECT prod_id, prod_price, prod_price * 0.9 AS sale_price
FROM Products;
