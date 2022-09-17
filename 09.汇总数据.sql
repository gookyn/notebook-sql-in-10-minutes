-- ------------------------------
-- 09. 汇总数据
-- ------------------------------

/*
 * 9.1 聚集函数
 * 对某些行运行的函数，计算并返回一个值
 *
 * 用来汇总数据
*/

/*
 * 9.1.1 AVG() 函数
 * 通过对表中行数计数并计算其列值之和，求得该列的平均值
 *
 * 注意：
 * 1、只用于单个列，如果想获得多个列的平均值，必须使用多个 AVG() 函数
 * 2、忽略列值为 NULL 的行
*/
-- 返回特定列所有行的平均值
SELECT AVG(prod_price) AS avg_price
FROM Products;

-- 返回特定列特定行的平均值
SELECT AVG(prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';

/*
 * 9.1.2 COUNT() 函数
 * 计算表中行的数目或符合特定条件的行的数目
 *
 * 注意：
 * 如果指定列名，则会忽略指定列的值为 NULL 的行；
 * 如果使用的是 *，则不忽略
*/
-- 使用 COUNT(*) 对表中行的数目进行计数，不管表列中包含的是 NUll 还是非 NULL
SELECT COUNT(*) AS num_cust
FROM Customers;

-- 使用 COUNT(column)对特定列中具有值的行进行计数，忽略 NULL 值
SELECT COUNT(cust_email) AS num_cust
FROM Customers;

/*
 * 9.1.3 MAX() 函数
 * 返回指定列中的最大值
 * 要求指定列名
 *
 * 注意：
 * 1、忽略列值为 NULL 的行
 * 2、一般用来找出最大的数值或日期值，有些 DBMS 也可以找出文本列中最大值
*/
SELECT MAX(prod_price) AS max_price
FROM Products;

/*
 * 9.1.4 MIN() 函数
 * 返回指定列中的最小值
 * 要求指定列名
 *
 * 注意：
 * 1、忽略列值为 NULL 的行
 * 2、一般用来找出最小的数值或日期值，有些 DBMS 也可以找出文本列中最小值
*/
SELECT MIN(prod_price) AS min_price
FROM Products;

/*
 * 9.1.5 SUM() 函数
 * 返回指定列值的和，也可以用来合计计算值
 *
 * 注意：
 * 忽略列值为 NULL 的行
*/
-- 返回指定列值的和
SELECT SUM(quantity) AS items_ordered
FROM OrderItems
WHERE order_num = 20005;

-- 用来合计计算值
SELECT SUM(item_price * quantity) AS total_price
FROM OrderItems
WHERE order_num = 20005;

/*
 * 9.2 聚集不同值
 * 
 * 以上 5 个聚集函数都可以如下使用：
 * 1、对所有行执行计算，指定 ALL 参数（默认，可以不指定）
 * 2、只包含不同的值，指定 DISTINCT 参数
*/
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';

-- 注意：DISTINCT 不能用于 COUNT(*)

/*
 * 9.2 组合聚集函数
 * 
 * SELECT 语句可以包含多个聚集函数
*/
SELECT COUNT(*) AS num_items, MAX(prod_price) AS price_max, MIN(prod_price) AS price_min, AVG(prod_price) AS price_avg
FROM Products;
