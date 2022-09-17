-- ------------------------------
-- 10. 分组数据
-- ------------------------------

-- 10.2 创建分组
-- GROUP BY 子句
SELECT vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id;

-- 10.3 过滤分组
/*
 * HAVING 子句
 * 
 * HAVING 支持所有 WHERE 操作符
*/
SELECT cust_id, COUNT(*) AS orders
FROM Orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;

/*
 * HAVING 与 WHERE 区别：
 * WHERE 过滤行，HAVING 过滤分组
 * WHERE 在数据分组前进行过滤，HAVING 在数据分组后过滤
*/
SELECT vend_id, COUNT(*) AS num_prods
FROM Products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;

SELECT vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id
HAVING COUNT(*) >= 2;

-- 10.4 分组和排序
-- 注意：
-- 结合 ORDER BY，不要仅依赖 GROUP BY 排序数据
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3;

SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;

/*
 * 10.5 SELECT 子句顺序
 * 
 * SELECT
 * FROM
 * WHERE
 * GROUP BY
 * HAVING
 * ORDER BY
*/
