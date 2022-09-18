-- ------------------------------
-- 14. 组合查询
-- ------------------------------

/*
 * 14.1 组合查询
 * 
 * SQL 允许执行多个查询（多条 SELECT 语句），并将结果作为一个查询结果集返回
 *
 * 主要有两种情况需要组合查询：
 * 1、在一个查询中从不同的表返回结构数据
 * 2、对一个表执行多个查询，按一个查询返回数据
*/

-- 14.2 创建组合查询

-- 14.2.1 使用 UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

/*
 * 14.2.2 UNION 规则
 * 必须由两条或两条以上的 SELECT 语句组成，语句间用 UNION 分隔
 * 每个查询必须包含相同的列、表达式或聚集函数（顺序无关）
 * 列数据类型必须兼容
*/

-- 14.2.3 包含或取消重复的行

-- UNION 默认会去除重复行

-- 如果期望返回所有的匹配行，需要使用 UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

-- 14.2.4 对组合查询结果排序
-- 在 UNION 组合查询时，只能使用一条 ORDER BY 语句，必须位于最后一条 SELECT 语句之后
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;

-- 14.4 挑战题

-- 1 使用两个 SELECT，一个查过滤订单中数量为100的产品，另一个过滤ID以 BNBG 开头的产品
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100
UNION
SELECT prod_id, quantity
FROM OrderItems
WHERE prod_id LIKE 'BNBG%'
ORDER BY prod_id;

-- 2 重写1，仅使用单个 SELECT
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100 OR prod_id LIKE 'BNBG%' -- 注意：这里是 OR，不是 AND
ORDER BY prod_id;

-- 3 组合产品名称和顾客名称
SELECT prod_name
FROM Products
UNION
SELECT cust_name -- 注意：结果会和 prod_name 合并为一列
FROM Customers
ORDER BY prod_name;

-- 4
-- ORDER BY 只能在最后一条 SELECT 之后
-- 注意分号
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state  = 'MI'
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'IL'
ORDER BY cust_name;
