-- ------------------------------
-- 03. 排序检索数据
-- ------------------------------

-- 3.1 排序数据
-- 注意：ORDER BY 子句的位置
-- 在指定一条 ORDER BY 子句时，应该保证它是 SELECT 语句中最后一条子句
SELECT prod_name
FROM Products
ORDER BY prod_name;

-- 3.2 按多个列排序
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price, prod_name; -- 首先按价格排序，然后按照名称排序

-- 3.3 按列位置排序
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY 2, 3; -- 按照列的相对位置排序

-- 3.4 指定排序方向
-- ASC：升序；DESC：降序
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC;

-- 多个列
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC, prod_name; -- DESC 只应用到直接位于其前面的列名
-- 注意：如果想在多个列上进行降序排序，必须对每一列指定 DESC 关键字












