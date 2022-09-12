-- ------------------------------
-- 02. 检索数据 
-- ------------------------------

/*
 * 提示：
 * 1、多条 SQL 语句必须以分号 ; 分隔
 * 2、SQL 语句不区分大小写
 * 3、在处理 SQL 语句时，其中所有空格都会被忽略
*/

-- 2.2 检索单个列
SELECT prod_name
FROM Products;

-- 2.3 检索多个列
SELECT prod_id, prod_name, prod_price
FROM Products;

-- 2.4 检索所有列
SELECT * 
FROM Products;

/*
 * 2.5 检索不同的值
 * DISTINCT 关键字：指示数据库只返回不同的值
 * 
 * 注意：
 * 1、必须直接放在列名的前面
 * 2、DISTINCT 关键字作用于所有的列，不仅仅是跟在其后的那一列
*/
SELECT DISTINCT vend_id
FROM Products;

SELECT DISTINCT vend_id, prod_price
FROM Products;

/*
 * 2.6 限制结果（只返回指定数量的行）
 *
 * 注意：不同数据库实现方式不同
 * 
 * MySQL：LIMIT 子句
*/
SELECT prod_name
FROM Products
LIMIT 5;

-- 从第 2 行起的 5 行数据
SELECT prod_name
FROM Products
LIMIT 5 OFFSET 2;




